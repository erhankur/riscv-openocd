/* SPDX-License-Identifier: GPL-2.0-or-later */

#ifndef RISCV_H
#define RISCV_H

struct riscv_program;

#include <stdint.h>
#include "opcodes.h"
#include "gdb_regs.h"
#include "jtag/jtag.h"
#include "target/register.h"
#include <helper/command.h>

/* The register cache is statically allocated. */
#define RISCV_MAX_HARTS 1024
#define RISCV_MAX_REGISTERS 5000
#define RISCV_MAX_TRIGGERS 32
#define RISCV_MAX_HWBPS 16

#define DEFAULT_COMMAND_TIMEOUT_SEC		2
#define DEFAULT_RESET_TIMEOUT_SEC		30

#define RISCV_SATP_MODE(xlen)  ((xlen) == 32 ? SATP32_MODE : SATP64_MODE)
#define RISCV_SATP_PPN(xlen)  ((xlen) == 32 ? SATP32_PPN : SATP64_PPN)
#define RISCV_PGSHIFT 12

# define PG_MAX_LEVEL 4

#define RISCV_NUM_MEM_ACCESS_METHODS  3

#define RISCV_BATCH_ALLOC_SIZE 128

extern struct target_type riscv011_target;
extern struct target_type riscv013_target;

/*
 * Definitions shared by code supporting all RISC-V versions.
 */
typedef uint64_t riscv_reg_t;
typedef uint32_t riscv_insn_t;
typedef uint64_t riscv_addr_t;

typedef enum {
	YNM_MAYBE,
	YNM_YES,
	YNM_NO
} yes_no_maybe_t;

enum riscv_mem_access_method {
	RISCV_MEM_ACCESS_UNSPECIFIED,
	RISCV_MEM_ACCESS_PROGBUF,
	RISCV_MEM_ACCESS_SYSBUS,
	RISCV_MEM_ACCESS_ABSTRACT
};

enum riscv_halt_reason {
	RISCV_HALT_INTERRUPT,
	RISCV_HALT_EBREAK,
	RISCV_HALT_SINGLESTEP,
	RISCV_HALT_TRIGGER,
	RISCV_HALT_UNKNOWN,
	RISCV_HALT_GROUP,
	RISCV_HALT_ERROR
};

enum riscv_isrmasking_mode {
	/* RISCV_ISRMASK_AUTO,	*/ /* not supported yet */
	RISCV_ISRMASK_OFF,
	/* RISCV_ISRMASK_ON,	*/ /* not supported yet */
	RISCV_ISRMASK_STEPONLY,
};

enum riscv_hart_state {
	RISCV_STATE_NON_EXISTENT,
	RISCV_STATE_RUNNING,
	RISCV_STATE_HALTED,
	RISCV_STATE_UNAVAILABLE
};

typedef struct {
	struct target *target;
	unsigned custom_number;
} riscv_reg_info_t;

#define RISCV_SAMPLE_BUF_TIMESTAMP_BEFORE	0x80
#define RISCV_SAMPLE_BUF_TIMESTAMP_AFTER	0x81
struct riscv_sample_buf {
	uint8_t *buf;
	unsigned int used;
	unsigned int size;
};

typedef struct {
	bool enabled;
	struct {
		bool enabled;
		target_addr_t address;
		uint32_t size_bytes;
	} bucket[16];
} riscv_sample_config_t;

typedef struct {
	struct list_head list;
	uint16_t low, high;
	char *name;
} range_list_t;

typedef struct {
	unsigned dtm_version;

	struct command_context *cmd_ctx;
	void *version_specific;

	/* Single buffer that contains all register names, instead of calling
	 * malloc for each register. Needs to be freed when reg_list is freed. */
	char *reg_names;

	/* It's possible that each core has a different supported ISA set. */
	int xlen;
	riscv_reg_t misa;
	/* Cached value of vlenb. 0 indicates there is no vector support.
	 * Note that you can have vector support without misa.V set, because
	 * Zve* extensions implement vector registers without setting misa.V. */
	unsigned int vlenb;

	/* The number of triggers per hart. */
	unsigned int trigger_count;

	/* record the tinfo of each trigger */
	unsigned int trigger_tinfo[RISCV_MAX_TRIGGERS];

	/* For each physical trigger contains:
	 * -1: the hwbp is available
	 * -4: The trigger is used by the itrigger command
	 * -5: The trigger is used by the etrigger command
	 * >= 0: unique_id of the breakpoint/watchpoint that is using it.
	 * Note that in RTOS mode the triggers are the same across all harts the
	 * target controls, while otherwise only a single hart is controlled. */
	int trigger_unique_id[RISCV_MAX_HWBPS];

	/* The unique id of the trigger that caused the most recent halt. If the
	 * most recent halt was not caused by a trigger, then this is -1. */
	uint32_t trigger_hit;

	/* The number of entries in the debug buffer. */
	int debug_buffer_size;

	/* This hart contains an implicit ebreak at the end of the program buffer. */
	bool impebreak;

	bool triggers_enumerated;

	/* Decremented every scan, and when it reaches 0 we clear the learned
	 * delays, causing them to be relearned. Used for testing. */
	int reset_delays_wait;

	/* This target has been prepped and is ready to step/resume. */
	bool prepped;
	/* This target was selected using hasel. */
	bool selected;

	/* Used by riscv_openocd_poll(). */
	bool halted_needs_event_callback;
	enum target_event halted_callback_event;

	enum riscv_isrmasking_mode isrmask_mode;

	/* Helper functions that target the various RISC-V debug spec
	 * implementations. */
	int (*get_register)(struct target *target, riscv_reg_t *value, int regid);
	int (*set_register)(struct target *target, int regid, uint64_t value);
	int (*get_register_buf)(struct target *target, uint8_t *buf, int regno);
	int (*set_register_buf)(struct target *target, int regno,
			const uint8_t *buf);
	int (*select_target)(struct target *target);
	int (*get_hart_state)(struct target *target, enum riscv_hart_state *state);
	/* Resume this target, as well as every other prepped target that can be
	 * resumed near-simultaneously. Clear the prepped flag on any target that
	 * was resumed. */
	int (*resume_go)(struct target *target);
	int (*step_current_hart)(struct target *target);
	int (*on_halt)(struct target *target);
	/* Get this target as ready as possible to resume, without actually
	 * resuming. */
	int (*resume_prep)(struct target *target);
	int (*halt_prep)(struct target *target);
	int (*halt_go)(struct target *target);
	int (*on_step)(struct target *target);
	enum riscv_halt_reason (*halt_reason)(struct target *target);
	int (*write_debug_buffer)(struct target *target, unsigned index,
			riscv_insn_t d);
	riscv_insn_t (*read_debug_buffer)(struct target *target, unsigned index);
	int (*execute_debug_buffer)(struct target *target);
	int (*invalidate_cached_debug_buffer)(struct target *target);
	int (*dmi_write_u64_bits)(struct target *target);
	void (*fill_dmi_write_u64)(struct target *target, char *buf, int a, uint64_t d);
	void (*fill_dmi_read_u64)(struct target *target, char *buf, int a);
	void (*fill_dmi_nop_u64)(struct target *target, char *buf);

	int (*authdata_read)(struct target *target, uint32_t *value, unsigned int index);
	int (*authdata_write)(struct target *target, uint32_t value, unsigned int index);

	int (*dmi_read)(struct target *target, uint32_t *value, uint32_t address);
	int (*dmi_write)(struct target *target, uint32_t address, uint32_t value);

	int (*sample_memory)(struct target *target,
						 struct riscv_sample_buf *buf,
						 riscv_sample_config_t *config,
						 int64_t until_ms);

	int (*read_memory)(struct target *target, target_addr_t address,
			uint32_t size, uint32_t count, uint8_t *buffer, uint32_t increment);

	/* How many harts are attached to the DM that this target is attached to? */
	int (*hart_count)(struct target *target);
	unsigned (*data_bits)(struct target *target);

	COMMAND_HELPER((*print_info), struct target *target);

	/* Storage for vector register types. */
	struct reg_data_type_vector vector_uint8;
	struct reg_data_type_vector vector_uint16;
	struct reg_data_type_vector vector_uint32;
	struct reg_data_type_vector vector_uint64;
	struct reg_data_type_vector vector_uint128;
	struct reg_data_type type_uint8_vector;
	struct reg_data_type type_uint16_vector;
	struct reg_data_type type_uint32_vector;
	struct reg_data_type type_uint64_vector;
	struct reg_data_type type_uint128_vector;
	struct reg_data_type_union_field vector_fields[5];
	struct reg_data_type_union vector_union;
	struct reg_data_type type_vector;

	/* Set when trigger registers are changed by the user. This indicates we need
	 * to beware that we may hit a trigger that we didn't realize had been set. */
	bool manual_hwbp_set;

	/* Memory access methods to use, ordered by priority, highest to lowest. */
	int mem_access_methods[RISCV_NUM_MEM_ACCESS_METHODS];

	/* Different memory regions may need different methods but single configuration is applied
	 * for all. Following flags are used to warn only once about failing memory access method. */
	bool mem_access_progbuf_warn;
	bool mem_access_sysbus_warn;
	bool mem_access_abstract_warn;

	/* In addition to the ones in the standard spec, we'll also expose additional
	 * CSRs in this list. */
	struct list_head expose_csr;
	/* Same, but for custom registers.
	 * Custom registers are for non-standard extensions and use abstract register numbers
	 * from range 0xc000 ... 0xffff. */
	struct list_head expose_custom;

	riscv_sample_config_t sample_config;
	struct riscv_sample_buf sample_buf;

	/* Track when we were last asked to do something substantial. */
	int64_t last_activity;

	yes_no_maybe_t vsew64_supported;
} riscv_info_t;

COMMAND_HELPER(riscv_print_info_line, const char *section, const char *key,
			   unsigned int value);

typedef struct {
	uint8_t tunneled_dr_width;
	struct scan_field tunneled_dr[4];
} riscv_bscan_tunneled_scan_context_t;

typedef struct {
	const char *name;
	int level;
	unsigned va_bits;
	unsigned pte_shift;
	unsigned vpn_shift[PG_MAX_LEVEL];
	unsigned vpn_mask[PG_MAX_LEVEL];
	unsigned pte_ppn_shift[PG_MAX_LEVEL];
	unsigned pte_ppn_mask[PG_MAX_LEVEL];
	unsigned pa_ppn_shift[PG_MAX_LEVEL];
	unsigned pa_ppn_mask[PG_MAX_LEVEL];
} virt2phys_info_t;

/* Wall-clock timeout for a command/access. Settable via RISC-V Target commands.*/
extern int riscv_command_timeout_sec;

/* Wall-clock timeout after reset. Settable via RISC-V Target commands.*/
extern int riscv_reset_timeout_sec;

extern bool riscv_enable_virtual;
extern bool riscv_ebreakm;
extern bool riscv_ebreaks;
extern bool riscv_ebreaku;

/* Everything needs the RISC-V specific info structure, so here's a nice macro
 * that provides that. */
static inline riscv_info_t *riscv_info(const struct target *target) __attribute__((unused));
static inline riscv_info_t *riscv_info(const struct target *target)
{
	assert(target->arch_info);
	return target->arch_info;
}
#define RISCV_INFO(R) riscv_info_t *R = riscv_info(target);

extern uint8_t ir_dtmcontrol[4];
extern struct scan_field select_dtmcontrol;
extern uint8_t ir_dbus[4];
extern struct scan_field select_dbus;
extern uint8_t ir_idcode[4];
extern struct scan_field select_idcode;

extern struct scan_field select_user4;
extern struct scan_field *bscan_tunneled_select_dmi;
extern uint32_t bscan_tunneled_select_dmi_num_fields;
typedef enum { BSCAN_TUNNEL_NESTED_TAP, BSCAN_TUNNEL_DATA_REGISTER } bscan_tunnel_type_t;
extern int bscan_tunnel_ir_width;
extern bscan_tunnel_type_t bscan_tunnel_type;

uint32_t dtmcontrol_scan_via_bscan(struct target *target, uint32_t out);
void select_dmi_via_bscan(struct target *target);

/*** OpenOCD Interface */
int riscv_openocd_poll(struct target *target);

int riscv_halt(struct target *target);

int riscv_resume(
	struct target *target,
	int current,
	target_addr_t address,
	int handle_breakpoints,
	int debug_execution,
	bool single_hart
);

int riscv_openocd_step(
	struct target *target,
	int current,
	target_addr_t address,
	int handle_breakpoints
);

int riscv_openocd_assert_reset(struct target *target);
int riscv_openocd_deassert_reset(struct target *target);

/*** RISC-V Interface ***/

/* Initializes the shared RISC-V structure. */
void riscv_info_init(struct target *target, riscv_info_t *r);

/* Steps the hart that's currently selected in the RTOS, or if there is no RTOS
 * then the only hart. */
int riscv_step_rtos_hart(struct target *target);

bool riscv_supports_extension(struct target *target, char letter);

/* Returns XLEN for the given (or current) hart. */
unsigned riscv_xlen(const struct target *target);
int riscv_xlen_of_hart(const struct target *target);

/* Sets the current hart, which is the hart that will actually be used when
 * issuing debug commands. */
int riscv_set_current_hartid(struct target *target, int hartid);
int riscv_select_current_hart(struct target *target);
int riscv_current_hartid(const struct target *target);

/*** Support functions for the RISC-V 'RTOS', which provides multihart support
 * without requiring multiple targets.  */

/* Lists the number of harts in the system, which are assumed to be
 * consecutive and start with mhartid=0. */
unsigned int riscv_count_harts(struct target *target);

/** Set register, updating the cache. */
int riscv_set_register(struct target *target, enum gdb_regno i, riscv_reg_t v);
/** Get register, from the cache if it's in there. */
int riscv_get_register(struct target *target, riscv_reg_t *value,
		enum gdb_regno r);
/** Read the register into the cache, and mark it dirty so it will be restored
 * before resuming. */
int riscv_save_register(struct target *target, enum gdb_regno regid);
/** Write all dirty registers to the target. */
int riscv_flush_registers(struct target *target);

/* Checks the state of the current hart -- "is_halted" checks the actual
 * on-device register. */
int riscv_get_hart_state(struct target *target, enum riscv_hart_state *state);
enum riscv_halt_reason riscv_halt_reason(struct target *target);

/* These helper functions let the generic program interface get target-specific
 * information. */
size_t riscv_debug_buffer_size(struct target *target);

riscv_insn_t riscv_read_debug_buffer(struct target *target, int index);
int riscv_write_debug_buffer(struct target *target, int index, riscv_insn_t insn);
int riscv_execute_debug_buffer(struct target *target);

void riscv_fill_dmi_nop_u64(struct target *target, char *buf);
void riscv_fill_dmi_write_u64(struct target *target, char *buf, int a, uint64_t d);
void riscv_fill_dmi_read_u64(struct target *target, char *buf, int a);
int riscv_dmi_write_u64_bits(struct target *target);

/* Invalidates the register cache. */
void riscv_invalidate_register_cache(struct target *target);

int riscv_enumerate_triggers(struct target *target);

int riscv_add_breakpoint(struct target *target, struct breakpoint *breakpoint);
int riscv_remove_breakpoint(struct target *target,
		struct breakpoint *breakpoint);
int riscv_add_watchpoint(struct target *target, struct watchpoint *watchpoint);
int riscv_remove_watchpoint(struct target *target,
		struct watchpoint *watchpoint);
int riscv_hit_watchpoint(struct target *target, struct watchpoint **hit_wp_address);

int riscv_init_registers(struct target *target);

void riscv_semihosting_init(struct target *target);
typedef enum {
	SEMI_NONE,		/* Not halted for a semihosting call. */
	SEMI_HANDLED,	/* Call handled, and target was resumed. */
	SEMI_WAITING,	/* Call handled, target is halted waiting until we can resume. */
	SEMI_ERROR		/* Something went wrong. */
} semihosting_result_t;
semihosting_result_t riscv_semihosting(struct target *target, int *retval);

void riscv_add_bscan_tunneled_scan(struct target *target, struct scan_field *field,
		riscv_bscan_tunneled_scan_context_t *ctxt);

int riscv_read_by_any_size(struct target *target, target_addr_t address, uint32_t size, uint8_t *buffer);
int riscv_write_by_any_size(struct target *target, target_addr_t address, uint32_t size, uint8_t *buffer);

int riscv_interrupts_disable(struct target *target, uint64_t ie_mask, uint64_t *old_mstatus);
int riscv_interrupts_restore(struct target *target, uint64_t old_mstatus);

#endif
