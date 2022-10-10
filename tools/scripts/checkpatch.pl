#!/usr/bin/perl -w
# Licensed under the terms of the GNU GPL License version 2
$P =~ s@.*/@@g;
  --no-tree                  run without a openocd tree
  --show-types               show the message "types" in the output
  --root=PATH                PATH to the openocd tree root

) or help(1);
help(0) if ($help);
	print "$P: no input files\n";
	exit(1);
@ignore = split(/,/, join(',',@ignore));
foreach my $word (@ignore) {
	$word =~ s/\s*\n?$//g;
	$word =~ s/^\s*//g;
	$word =~ s/\s+/ /g;
	$word =~ tr/[a-z]/[A-Z]/;
	next if ($word =~ m/^\s*#/);
	next if ($word =~ m/^\s*$/);
	$ignore_type{$word}++;
		print "Must be run from the top-level dir. of a openocd tree\n";
			__init_refok|
			__rcu
			__bitwise__|
			__(?:mem|cpu|dev|)(?:initdata|initconst|init\b)|
			__weak
our $Inline	= qr{inline|__always_inline|noinline};
our $Constant	= qr{(?:[0-9]+|0x[0-9a-fA-F]+)[UL]*};
our $Assignment	= qr{(?:\*\=|/=|%=|\+=|-=|<<=|>>=|&=|\^=|\|=|=)};
our $Compare    = qr{<=|>=|==|!=|<|>};
			&&|\|\||,|\^|\+\+|--|&|\||\+|-|\*|\/|%
our $UTF8	= qr {
	[\x09\x0A\x0D\x20-\x7E]              # ASCII
	| [\xC2-\xDF][\x80-\xBF]             # non-overlong 2-byte
our $typeTypedefs = qr{(?x:
	printk(?:_ratelimited|_once|)|
	[a-z0-9]+_(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)|
	LOG_(?:DEBUG|INFO|WARNING|ERROR|USER|USER_N|OUTPUT)+
	qr{(?:unsigned\s+)?char},
	qr{(?:unsigned\s+)?short},
	qr{(?:unsigned\s+)?int},
	qr{(?:unsigned\s+)?long},
	qr{(?:unsigned\s+)?long\s+int},
	qr{(?:unsigned\s+)?long\s+long},
	qr{(?:unsigned\s+)?long\s+long\s+int},
	qr{unsigned},
	memory
	my $mods = "(?x:  \n" . join("|\n  ", @modifierList) . "\n)";
	my $all = "(?x:  \n" . join("|\n  ", @typeList) . "\n)";
				(?:typeof|__typeof__)\s*\(\s*\**\s*$Ident\s*\)|
			(?:[\s\*]+\s*const|[\s\*]+|(?:\s*\[\s*\])+)?
	$Declare	= qr{(?:$Storage\s+)?$Type};
our $match_balanced_parentheses = qr/(\((?:[^\(\)]+|(-1))*\))/;
our $Typecast	= qr{\s*(\(\s*$NonptrType\s*\)){0,1}\s*};
our $LvalOrFunc	= qr{($Lval)\s*($match_balanced_parentheses{0,1})\s*};
	$string =~ s@^\s*\(\s*@@g;
	$string =~ s@\s*\)\s*$@@g;
$chk_signoff = 0 if ($file);
my @dep_includes = ();
my @dep_functions = ();
my $removal = "Documentation/feature-removal-schedule.txt";
if ($tree && -f "$root/$removal") {
	open(my $REMOVE, '<', "$root/$removal") ||
				die "$P: $removal: open failed - $!\n";
	while (<$REMOVE>) {
		if (/^Check:\s+(.*\S)/) {
			for my $entry (split(/[, ]+/, $1)) {
				if ($entry =~ m@include/(.*)@) {
					push(@dep_includes, $1);
				} elsif ($entry !~ m@/@) {
					push(@dep_functions, $entry);
				}
			}
	close($REMOVE);
	if ($file) {
exit($exit);
    }
		$formatted_email =~ s/$address.*$//;
		$name =~ s/^\s+|\s+$//g;
		$address = "jenkins"
	$name =~ s/^\s+|\s+$//g;
	$name =~ s/^\"|\"$//g;
	$address =~ s/^\s+|\s+$//g;
	return ($name, $address, $comment);
	my ($name, $address) = @_;
	$name =~ s/^\s+|\s+$//g;
	$name =~ s/^\"|\"$//g;
	$address =~ s/^\s+|\s+$//g;
		$formatted_email = "$name <$address>";
	return $formatted_email;
			for (; ($n % 4) != 0; $n++) {
		# Comments we are wacking completly including the begin
				$remainder =~ /^(else)(?:\s|\{)/ &&
	$stmt =~ s/^\s*\{//;
	my ($current_comment) = ($rawlines[$end_line - 1] =~ m@.*(/\*.*\*/)\s*(?:\\\s*)?$@);
			$type = 'C';
		} elsif ($cur =~/^(;|\{|})/) {
			do
					push(@modifierList, $modifier);
			push(@typeList, $possible);
       return !defined $ignore_type{$_[0]};
	if (!show_type($_[1]) ||
	    (defined $tst_only && $_[2] !~ /\Q$tst_only\E/)) {
	my $line;
		$line = "$prefix$_[0]:$_[1]: $_[2]\n";
	} else {
		$line = "$prefix$_[0]: $_[2]\n";
	$line = (split('\n', $line))[0] . "\n" if ($terse);
	push(our @report, $line);
	if (report("ERROR", $_[0], $_[1])) {
	if (report("WARNING", $_[0], $_[1])) {
	if ($check && report("CHECK", $_[0], $_[1])) {
			if ($1 =~ m@Documentation/kernel-parameters.txt$@) {
		if ($rawline=~/^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
		if ($line=~/^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
#make up the handle for any error we report on this line
		$prefix = "$filename:$realline: " if ($emacs && $file);
		$prefix = "$filename:$linenr: " if ($emacs && !$file);

			$realfile =~ s@^([^/]*)/@@;

			$realfile =~ s@^([^/]*)/@@;
			if ($realfile =~ /(Makefile|Kconfig|\.c|\.h|\.S|\.tmpl)$/) {
		if ($line =~ /^\s*signed-off-by:/i) {
		if ($line =~ /^(\s*)($signature_tags)(\s*)(.*)/) {
				WARN("BAD_SIGN_OFF",
				     "Do not use whitespace before $ucfirst_sign_off\n" . $herecurr);
				WARN("BAD_SIGN_OFF",
				     "'$ucfirst_sign_off' is the preferred signature form\n" . $herecurr);
				WARN("BAD_SIGN_OFF",
				     "Use a single space after $ucfirst_sign_off\n" . $herecurr);
			my ($email_name, $email_address, $comment) = parse_email($email);
			my $suggested_email = format_email(($email_name, $email_address));
				if ("$dequoted$comment" ne $email &&
				    "<$email_address>$comment" ne $email &&
				    "$suggested_email$comment" ne $email) {
					     "email address '$email' might be better as '$suggested_email$comment'\n" . $herecurr);
# Check for wrappage within a valid hunk of the file
		if ($realcnt != 0 && $line !~ m{^(?:\+|-| |\\ No newline|$)}) {
			ERROR("CORRUPTED_PATCH",
			      "patch seems to be corrupt (line wrapped?)\n" .
				$herecurr) if (!$emitted_corrupt++);
# Check for absolute kernel paths.
		if ($tree && $line =~ /^[^-]/) {
			while ($line =~ m{(?:^|\s)(/\S*)}g) {
				my $file = $1;
				if ($file =~ m{^(.*?)(?::\d+)+:?$} &&
				    check_absolute_file($1, $herecurr)) {
					#
				} else {
					check_absolute_file($file, $herecurr);
				}
			ERROR("DOS_LINE_ENDINGS",
			      "DOS line endings\n" . $herevet);

			ERROR("TRAILING_WHITESPACE",
			      "trailing whitespace\n" . $herevet);
		# Don't care in this branch. This always messes up when we merge changes down.
		#if ($rawline =~ /\bwrite to the Free/i ||
		#    $rawline =~ /\b59\s+Temple\s+Pl/i ||
		#    $rawline =~ /\b51\s+Franklin\s+St/i) {
		#	my $herevet = "$here\n" . cat_vet($rawline) . "\n";
		#	ERROR("FSF_MAILING_ADDRESS",
		#	      "Do not include the paragraph about writing to the Free Software Foundation's mailing address " .
		#	      "from the sample GPL notice. The FSF has changed addresses in the past, and may do so again. " .
		#	      "OpenOCD already includes a copy of the GPL.\n" . $herevet)
		#}
		    $line =~ /\+\s*(?:---)?help(?:---)?$/) {
			my $length = 0;
			my $cnt = $realcnt;
			my $ln = $linenr + 1;
			my $f;
			my $is_end = 0;
			while ($cnt > 0 && defined $lines[$ln - 1]) {
				$f = $lines[$ln - 1];
				$cnt-- if ($lines[$ln - 1] !~ /^-/);
				$is_end = $lines[$ln - 1] =~ /^\+/;
				$ln++;
				$f =~ s/^.//;
				$f =~ s/#.*//;
				$f =~ s/^\s+//;
				next if ($f =~ /^$/);
				if ($f =~ /^\s*config\s/) {
					$is_end = 1;
				$length++;
			WARN("CONFIG_DESCRIPTION",
			     "please write a paragraph that describes the config symbol fully\n" . $herecurr) if ($is_end && $length < 4);
			#print "is_end<$is_end> length<$length>\n";
		next if ($realfile !~ /\.(h|c|s|S|pl|sh)$/);

#120 column limit
		if ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
		    $rawline !~ /^.\s*\*\s*\@$Ident\s/ &&
		    !($line =~ /^\+\s*$logFunctions\s*\(\s*(?:(KERN_\S+\s*|[^"]*))?"[X\t]*"\s*(?:|,|\)\s*;)\s*$/ ||
		    $line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
		    $length > 120)
		{
			WARN("LONG_LINE",
			     "line over 120 characters\n" . $herecurr);
# check for spaces before a quoted newline
		if ($rawline =~ /^.*\".*\s\\n/) {
			WARN("QUOTED_WHITESPACE_BEFORE_NEWLINE",
			     "unnecessary whitespace before a quoted newline\n" . $herecurr);
			WARN("MISSING_EOF_NEWLINE",
			     "adding a line without newline at end of file\n" . $herecurr);
# Blackfin: use hi/lo macros
		if ($realfile =~ m@arch/blackfin/.*\.S$@) {
			if ($line =~ /\.[lL][[:space:]]*=.*&[[:space:]]*0x[fF][fF][fF][fF]/) {
				my $herevet = "$here\n" . cat_vet($line) . "\n";
				ERROR("LO_MACRO",
				      "use the LO() macro, not (... & 0xFFFF)\n" . $herevet);
			}
			if ($line =~ /\.[hH][[:space:]]*=.*>>[[:space:]]*16/) {
				my $herevet = "$here\n" . cat_vet($line) . "\n";
				ERROR("HI_MACRO",
				      "use the HI() macro, not (... >> 16)\n" . $herevet);
			}
		next if ($realfile !~ /\.(h|c|pl)$/);
# more than 8 must use tabs.
			ERROR("CODE_INDENT",
			      "code indent should use tabs where possible\n" . $herevet);
			WARN("SPACE_BEFORE_TAB",
			     "please, no space before tabs\n" . $herevet);
# check we are in a valid C source file if not then ignore this hunk
		next if ($realfile !~ /\.(h|c)$/);
		if ($rawline =~ /^\+ / && $line !~ /\+ *(?:$;|#|$Ident:)/)  {
			WARN("LEADING_SPACE",
			     "please, no spaces at the start of a line\n" . $herevet);
# Blackfin: don't use __builtin_bfin_[cs]sync
		if ($line =~ /__builtin_bfin_csync/) {
			my $herevet = "$here\n" . cat_vet($line) . "\n";
			ERROR("CSYNC",
			      "use the CSYNC() macro in asm/blackfin.h\n" . $herevet);
		}
		if ($line =~ /__builtin_bfin_ssync/) {
			my $herevet = "$here\n" . cat_vet($line) . "\n";
			ERROR("SSYNC",
			      "use the SSYNC() macro in asm/blackfin.h\n" . $herevet);
		if ($realcnt && $line =~ /.\s*\S/) {
			$s =~ s/\{.*$//s;
#		if ($line=~/\bswitch\s*\(.*\)/) {
#			my $err = '';
#			my $sep = '';
#			my @ctx = ctx_block_outer($linenr, $realcnt);
#			shift(@ctx);
#			for my $ctx (@ctx) {
#				my ($clen, $cindent) = line_stats($ctx);
#				if ($ctx =~ /^\+\s*(case\s+|default:)/ &&
#							$indent != $cindent) {
#					$err .= "$sep$ctx\n";
#					$sep = '';
#				} else {
#					$sep = "[...]\n";
#				}
#			}
#			if ($err ne '') {
#				ERROR("SWITCH_CASE_INDENT_LEVEL",
#				      "switch and case should be at the same indent\n$hereline$err");
#			}
#		}
		if ($line =~ /(.*)\b((?:if|while|for|switch)\s*\(|do\b|else\b)/ && $line !~ /^.\s*\#/) {
			if ($ctx !~ /\{\s*/ && defined($lines[$ctx_ln -1]) && $lines[$ctx_ln - 1] =~ /^\+\s*\{/) {
		if ($line =~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*#/ && $line !~ /\}\s*while\s*/) {

			# Find out how long the conditional actually is.
			my @newlines = ($c =~ /\n/gs);
			my $cond_lines = 1 + $#newlines;
			$s =~ s/^\s*\{//;
			if ($check && (($sindent % 4) != 0 ||
			    ($sindent <= $indent && $s ne ''))) {
		if ($line=~/^[^\+]/) {next;}
		if ($line =~ /^.\s*\{/ &&
			ERROR("OPEN_BRACE",
			      "that open brace { should be on the previous line\n" . $hereprev);
				      "malformed #include filename\n" .
					$herecurr);
			ERROR("C99_COMMENTS",
			      "do not use C99 // comments\n" . $herecurr);
		    ($lines[$realline_next - 1] =~ /EXPORT_SYMBOL.*\((.*)\)/ ||
		     $lines[$realline_next - 1] =~ /EXPORT_UNUSED_SYMBOL.*\((.*)\)/)) {
			if ($stat =~ /^.([A-Z_]+)\s*\(\s*($Ident)/ &&
		    ($line =~ /EXPORT_SYMBOL.*\((.*)\)/ ||
		     $line =~ /EXPORT_UNUSED_SYMBOL.*\((.*)\)/)) {
		if ($line =~ /^.$Type\s*$Ident\s*(?:\s+$Modifier)*\s*=\s*(0|NULL|false)\s*;/) {
			ERROR("GLOBAL_INITIALISERS",
			      "do not initialise globals to 0 or NULL\n" .
				$herecurr);
		if ($line =~ /\bstatic\s.*=\s*(0|NULL|false)\s*;/) {
			ERROR("INITIALISED_STATIC",
			      "do not initialise statics to 0 or NULL\n" .
				$herecurr);
               }
               }
# check for declarations of struct pci_device_id
		if ($line =~ /\bstruct\s+pci_device_id\s+\w+\s*\[\s*\]\s*\=\s*\{/) {
			WARN("DEFINE_PCI_DEVICE_TABLE",
			     "Use DEFINE_PCI_DEVICE_TABLE for struct pci_device_id\n" . $herecurr);
#		if ($line =~ /\btypedef\s/ &&
#		    $line !~ /\btypedef\s+$Type\s*\(\s*\*?$Ident\s*\)\s*\(/ &&
#		    $line !~ /\btypedef\s+$Type\s+$Ident\s*\(/ &&
#		    $line !~ /\b$typeTypedefs\b/ &&
#		    $line !~ /\b__bitwise(?:__|)\b/) {
#			WARN("NEW_TYPEDEFS",
#			     "do not add new typedefs\n" . $herecurr);
#		}
		if ($line =~ m{\($NonptrType(\s*(?:$Modifier\b\s*|\*\s*)+)\)}) {
			my ($from, $to) = ($1, $1);
			#print "from<$from> to<$to>\n";
				ERROR("POINTER_LOCATION",
				      "\"(foo$from)\" should be \"(foo$to)\"\n" .  $herecurr);
		} elsif ($line =~ m{\b$NonptrType(\s*(?:$Modifier\b\s*|\*\s*)+)($Ident)}) {
			my ($from, $to, $ident) = ($1, $1, $2);
			#print "from<$from> to<$to> ident<$ident>\n";
				ERROR("POINTER_LOCATION",
				      "\"foo${from}bar\" should be \"foo${to}bar\"\n" .  $herecurr);
# # no BUG() or BUG_ON()
# 		if ($line =~ /\b(BUG|BUG_ON)\b/) {
# 			print "Try to use WARN_ON & Recovery code rather than BUG() or BUG_ON()\n";
# 			print "$herecurr";
# 			$clean = 0;
# 		}
"Prefer printk_ratelimited or pr_<level>_ratelimited to printk_ratelimit\n" . $herecurr);
		}

# printk should use KERN_* levels.  Note that follow on printk's on the
# same line do not need a level, so we use the current block context
# to try and find and validate the current printk.  In summary the current
# printk includes all preceding printk's which have no newline on the end.
# we assume the first bad printk is the one to report.
		if ($line =~ /\bprintk\((?!KERN_)\s*"/) {
			my $ok = 0;
			for (my $ln = $linenr - 1; $ln >= $first_line; $ln--) {
				#print "CHECK<$lines[$ln - 1]\n";
				# we have a preceding printk if it ends
				# with "\n" ignore it, else it is to blame
				if ($lines[$ln - 1] =~ m{\bprintk\(}) {
					if ($rawlines[$ln - 1] !~ m{\\n"}) {
						$ok = 1;
					}
					last;
				}
			}
			if ($ok == 0) {
				WARN("PRINTK_WITHOUT_KERN_LEVEL",
				     "printk() should include KERN_ facility level\n" . $herecurr);
		if (($line=~/$Type\s*$Ident\(.*\).*\s\{/) and
		    !($line=~/\#\s*define.*do\s\{/) and !($line=~/}/)) {
			ERROR("OPEN_BRACE",
			      "open brace '{' following function declarations go on the next line\n" . $herecurr);
		if ($line =~ /^.\s*\{/ &&
			ERROR("OPEN_BRACE",
			      "open brace '{' following $1 go on the same line\n" . $hereprev);
		if ($line =~ /^.\s*(?:typedef\s+)?(enum|union|struct)(?:\s+$Ident)?(?:\s+$Ident)?[=\{]/) {
		    WARN("SPACING",
			 "missing space after $1 definition\n" . $herecurr);
			    $prefix !~ /\{\s+$/) {
				ERROR("BRACKET_SPACE",
				      "space prohibited before open square bracket '['\n" . $herecurr);

				WARN("SPACING",
				     "space prohibited between function name and open parenthesis '('\n" . $herecurr);
				\?|:
				    $ca =~ /\s$/ && $cc =~ /^\s*,/) {
						ERROR("SPACING",
						      "space required after that '$op' $at\n" . $hereptr);
				#   :   when part of a bitfield
				} elsif ($op eq '->' || $opv eq ':B') {
						ERROR("SPACING",
						      "spaces prohibited around that '$op' $at\n" . $hereptr);
				# , must have a space on the right.
						ERROR("SPACING",
						      "space required after that '$op' $at\n" . $hereptr);
						ERROR("SPACING",
						      "space required before that '$op' $at\n" . $hereptr);
						ERROR("SPACING",
						      "space prohibited after that '$op' $at\n" . $hereptr);
						ERROR("SPACING",
						      "space required one side of that '$op' $at\n" . $hereptr);
						ERROR("SPACING",
						      "space prohibited before that '$op' $at\n" . $hereptr);
						ERROR("SPACING",
						      "space prohibited after that '$op' $at\n" . $hereptr);

					if ($ctx =~ /Wx[^WCE]|[^WCE]xW/) {
						ERROR("SPACING",
						      "need consistent spacing around '$op' $at\n" .
							$hereptr);
					if ($ctx =~ /Wx./) {
						ERROR("SPACING",
						      "space prohibited before that '$op' $at\n" . $hereptr);
					    	$ok = 1;
					# Ignore ?:
					if (($opv eq ':O' && $ca =~ /\?$/) ||
					    ($op eq '?' && $cc =~ /^:/)) {
					    	$ok = 1;
						ERROR("SPACING",
						      "spaces required around that '$op' $at\n" . $hereptr);
## 			# falsly report the parameters of functions.
		    $line =~ /do\{/) {
			ERROR("SPACING",
			      "space required before the open brace '{'\n" . $herecurr);
		if ($line =~ /}(?!(?:,|;|\)))\S/) {
			ERROR("SPACING",
			      "space required after that close brace '}'\n" . $herecurr);
			ERROR("SPACING",
			      "space prohibited after that open square bracket '['\n" . $herecurr);
			ERROR("SPACING",
			      "space prohibited before that close square bracket ']'\n" . $herecurr);
			ERROR("SPACING",
			      "space prohibited after that open parenthesis '('\n" . $herecurr);
			ERROR("SPACING",
			      "space prohibited before that close parenthesis ')'\n" . $herecurr);
#goto labels aren't indented, allow a single space however
		if ($line=~/^.\s+[A-Za-z\d_]+:(?![0-9]+)/ and
		   !($line=~/^. [A-Za-z\d_]+:/) and !($line=~/^.\s+default:/)) {
			WARN("INDENTED_LABEL",
			     "labels should not be indented\n" . $herecurr);
# Return is not a function.
		if (defined($stat) && $stat =~ /^.\s*return(\s*)(\(.*);/s) {
			my $value = $2;

			# Flatten any parentheses
			$value =~ s/\(/ \(/g;
			$value =~ s/\)/\) /g;
			while ($value =~ s/\[[^\{\}]*\]/1/ ||
			       $value !~ /(?:$Ident|-?$Constant)\s*
					     $Compare\s*
					     (?:$Ident|-?$Constant)/x &&
			       $value =~ s/\([^\(\)]*\)/1/) {
			}
#print "value<$value>\n";
			if ($value =~ /^\s*(?:$Ident|-?$Constant)\s*$/) {
				ERROR("RETURN_PARENTHESES",
				      "return is not a function, parentheses are not required\n" . $herecurr);

# Return of what appears to be an errno should normally be -'ve
		if ($line =~ /^.\s*return\s*(E[A-Z]*)\s*;/) {
			my $name = $1;
			if ($name ne 'EOF' && $name ne 'ERROR') {
				WARN("USE_NEGATIVE_ERRNO",
				     "return of an errno should typically be -ve (return -$1)\n" . $herecurr);
# typecasts on min/max could be min_t/max_t
		if ($line =~ /^\+(?:.*?)\b(min|max)\s*\($Typecast{0,1}($LvalOrFunc)\s*,\s*$Typecast{0,1}($LvalOrFunc)\s*\)/) {
			if (defined $2 || defined $8) {
				my $call = $1;
				my $cast1 = deparenthesize($2);
				my $arg1 = $3;
				my $cast2 = deparenthesize($8);
				my $arg2 = $9;
				my $cast;
				if ($cast1 ne "" && $cast2 ne "") {
					$cast = "$cast1 or $cast2";
				} elsif ($cast1 ne "") {
					$cast = $cast1;
				} else {
					$cast = $cast2;
				}
				WARN("MINMAX",
				     "$call() should probably be ${call}_t($cast, $arg1, $arg2)\n" . $herecurr);
		if ($line=~/\b(if|while|for|switch)\(/) {
			ERROR("SPACING", "space required before the open parenthesis '('\n" . $herecurr);
		if ($line =~ /do\s*(?!\{)/) {
				ERROR("ASSIGN_IN_IF",
				      "do not use assignment in if condition\n" . $herecurr);
			$s =~ s/$;//g; 	# Remove any comments
			if (length($c) && $s !~ /^\s*\{?\s*\\*\s*$/ &&
				ERROR("TRAILING_STATEMENTS",
				      "trailing statements should be on next line\n" . $herecurr . $stat_real);
			$s =~ s/$;//g; 	# Remove any comments
			if ($s !~ /^\s*(?:\sif|(?:\{|)\s*\\?\s*$)/) {
			      "trailing statements should be on next line\n" .
		if ($prevline=~/}\s*$/ and $line=~/^.\s*else\s*/ and
						$previndent == $indent) {
			ERROR("ELSE_AFTER_BRACE",
			      "else should follow close brace '}'\n" . $hereprev);
		if ($prevline=~/}\s*$/ and $line=~/^.\s*while\s*/ and
						$previndent == $indent) {
				ERROR("WHILE_AFTER_BRACE",
				      "while should follow close brace '}'\n" . $hereprev);
#studly caps, commented out until figure out how to distinguish between use of existing and adding new
#		if (($line=~/[\w_][a-z\d]+[A-Z]/) and !($line=~/print/)) {
#		    print "No studly caps, use _\n";
#		    print "$herecurr";
#		    $clean = 0;
#		}
		if ($line=~/\#\s*define.*\\\s$/) {
			WARN("WHITESPACE_AFTER_LINE_CONTINUATION",
			     "Whitepspace after \\ makes next lines useless\n" . $herecurr);
#warn if <asm/foo.h> is #included and <linux/foo.h> is available (uses RAW line)
				if ($realfile =~ m{^arch/}) {
					CHK("ARCH_INCLUDE_LINUX",
					    "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
				} else {
					WARN("INCLUDE_LINUX",
					     "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);

			my $args = defined($1);

			# Find the end of the macro and limit our statement
			# search to that.
			while ($cnt > 0 && defined $lines[$ln - 1] &&
				$lines[$ln - 1] =~ /^(?:-|..*\\$)/)
			{
				$ctx .= $rawlines[$ln - 1] . "\n";
				$cnt-- if ($lines[$ln - 1] !~ /^-/);
				$ln++;
			}
			$ctx .= $rawlines[$ln - 1];

				ctx_statement_block($linenr, $ln - $linenr + 1, 0);
			# Extract the remainder of the define (if any) and
			# rip off surrounding spaces, and trailing \'s.
			$rest = '';
			while ($off != 0 || ($cnt > 0 && $rest =~ /\\\s*$/)) {
				#print "ADDING cnt<$cnt> $off <" . substr($lines[$ln - 1], $off) . "> rest<$rest>\n";
				if ($off != 0 || $lines[$ln - 1] !~ /^-/) {
					$rest .= substr($lines[$ln - 1], $off) . "\n";
					$cnt--;
				}
				$ln++;
				$off = 0;
			}
			$rest =~ s/\\\n.//g;
			$rest =~ s/^\s*//s;
			$rest =~ s/\s*$//s;

			# Clean up the original statement.
			if ($args) {
				substr($dstat, 0, length($dcond), '');
			} else {
				$dstat =~ s/^.\s*\#\s*define\s+$Ident\s*//;
			while ($dstat =~ s/\([^\(\)]*\)/1/ ||
			       $dstat =~ s/\{[^\{\}]*\}/1/ ||
			       $dstat =~ s/\[[^\{\}]*\]/1/)
				MODULE_PARAM_DESC|
				^\"|\"$
			if ($rest ne '' && $rest ne ',') {
				if ($rest !~ /while\s*\(/ &&
				    $dstat !~ /$exceptions/)
				{
					      "Macros with multiple statements should be enclosed in a do - while loop\n" . "$here\n$ctx\n");
			} elsif ($ctx !~ /;/) {
				if ($dstat ne '' &&
				    $dstat !~ /^(?:$Ident|-?$Constant)$/ &&
				    $dstat !~ /$exceptions/ &&
				    $dstat !~ /^\.$Ident\s*=/ &&
				    $dstat =~ /$Operators/)
				{
					ERROR("COMPLEX_MACRO",
					      "Macros with complex values should be enclosed in parenthesis\n" . "$here\n$ctx\n");
# make sure symbols are always wrapped with VMLINUX_SYMBOL() ...
# all assignments may have only one of the following with an assignment:
#	.
#	ALIGN(...)
#	VMLINUX_SYMBOL(...)
		if ($realfile eq 'vmlinux.lds.h' && $line =~ /(?:(?:^|\s)$Ident\s*=|=\s*$Ident(?:\s|$))/) {
			WARN("MISSING_VMLINUX_SYMBOL",
			     "vmlinux.lds.h needs VMLINUX_SYMBOL() around C-visible symbols\n" . $herecurr);
				my $allowed = 0;
					$seen++ if ($block =~ /^\s*\{/);
					#print "cond<$cond> block<$block> allowed<$allowed>\n";
						$allowed = 1;
						$allowed = 1;
						$allowed = 1;
				if ($seen && !$allowed) {
					WARN("BRACES",
					     "braces {} are not necessary for any arm of this statement\n" . $herectx);
				my $herectx = $here . "\n";
				for (my $n = 0; $n < $cnt; $n++) {
					$herectx .= raw_line($linenr, $n) . "\n";
				WARN("BRACES",
				     "braces {} are not necessary for single statement blocks\n" . $herectx);
# don't include deprecated include files (uses RAW line)
		for my $inc (@dep_includes) {
			if ($rawline =~ m@^.\s*\#\s*include\s*\<$inc>@) {
				ERROR("DEPRECATED_INCLUDE",
				      "Don't use <$inc>: see Documentation/feature-removal-schedule.txt\n" . $herecurr);
# don't use deprecated functions
		for my $func (@dep_functions) {
			if ($line =~ /\b$func\b/) {
				ERROR("DEPRECATED_FUNCTION",
				      "Don't use $func(): see Documentation/feature-removal-schedule.txt\n" . $herecurr);
# no volatiles please
#		my $asm_volatile = qr{\b(__asm__|asm)\s+(__volatile__|volatile)\b};
#		if ($line =~ /\bvolatile\b/ && $line !~ /$asm_volatile/) {
#			WARN("VOLATILE",
#			     "Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt\n" . $herecurr);
#		}
			CHK("REDUNDANT_CODE",
			    "if this code is redundant consider removing it\n" .
				$herecurr);
# check for needless kfree() checks
		if ($prevline =~ /\bif\s*\(([^\)]*)\)/) {
			my $expr = $1;
			if ($line =~ /\bkfree\(\Q$expr\E\);/) {
				WARN("NEEDLESS_KFREE",
				     "kfree(NULL) is safe this check is probably not required\n" . $hereprev);
# check for needless usb_free_urb() checks
		if ($prevline =~ /\bif\s*\(([^\)]*)\)/) {
			my $expr = $1;
			if ($line =~ /\busb_free_urb\(\Q$expr\E\);/) {
				WARN("NEEDLESS_USB_FREE_URB",
				     "usb_free_urb(NULL) is safe this check is probably not required\n" . $hereprev);
		if ($line =~ /\budelay\s*\(\s*(\w+)\s*\)/) {
			if (! (($1 =~ /(\d+)/) && ($1 < 10)) ) {
				    "usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt\n" . $line);
				     "msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.txt\n" . $line);
			ERROR("SPACING",
			      "exactly one space required after that #$1\n" . $herecurr);
		if ($line =~ /\b(mb|rmb|wmb|read_barrier_depends|smp_mb|smp_rmb|smp_wmb|smp_read_barrier_depends)\(/) {
				CHK("MEMORY_BARRIER",
				    "memory barrier without comment\n" . $herecurr);
		if ($line =~ /\b$Storage\b/ && $line !~ /^.\s*$Storage\b/) {
			     "storage class should be at the beginning of the declaration\n" . $herecurr)
		if ($line =~ /\b(__inline__|__inline)\b/) {
			WARN("INLINE",
			     "plain inline is preferred over $1\n" . $herecurr);
# Check for __attribute__ packed, prefer __packed
#		if ($line =~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
#			WARN("PREFER_PACKED",
#			     "__packed is preferred over __attribute__((packed))\n" . $herecurr);
#		}
# Check for __attribute__ aligned, prefer __aligned
#		if ($line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
#			WARN("PREFER_ALIGNED",
#			     "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
#		}
# check for line continuations in quoted strings with odd counts of "
		if ($rawline =~ /\\$/ && $rawline =~ tr/"/"/ % 2) {
			WARN("LINE_CONTINUATIONS",
			     "Avoid line continuations in quoted strings\n" . $herecurr);
# check for new externs in .c files.
#		if ($realfile =~ /\.c$/ && defined $stat &&
#		    $stat =~ /^.\s*(?:extern\s+)?$Type\s+($Ident)(\s*)\(/s)
#		{
#			my $function_name = $1;
#			my $paren_space = $2;
#			my $s = $stat;
#			if (defined $cond) {
#				substr($s, 0, length($cond), '');
#			}
#			if ($s =~ /^\s*;/ &&
#			    $function_name ne 'uninitialized_var')
#			{
#				WARN("AVOID_EXTERNS",
#				     "externs should be avoided in .c files\n" .  $herecurr);
#			}
#			if ($paren_space =~ /\n/) {
#				WARN("FUNCTION_ARGUMENTS",
#				     "arguments for function declarations should follow identifier\n" . $herecurr);
#
#		} elsif ($realfile =~ /\.c$/ && defined $stat &&
#		    $stat =~ /^.\s*extern\s+/)
#		{
#			WARN("AVOID_EXTERNS",
#			     "externs should be avoided in .c files\n" .  $herecurr);
				    "__setup appears un-documented -- check Documentation/kernel-parameters.txt\n" . $herecurr);
# check for pointless casting of kmalloc return
		if ($line =~ /\*\s*\)\s*[kv][czm]alloc(_node){0,1}\b/) {
		    WARN("ONE_SEMICOLON",
			 "Statements terminations use 1 semicolon\n" . $herecurr);
		if ($line =~ /__FUNCTION__/) {
			WARN("USE_FUNC",
			     "__func__ should be used instead of gcc specific __FUNCTION__\n"  . $herecurr);
		}
# recommend kstrto* over simple_strto*
		if ($line =~ /\bsimple_(strto.*?)\s*\(/) {
			     "consider using kstrto* in preference to simple_$1\n" . $herecurr);
# check for __initcall(), use device_initcall() explicitly please
			     "please use device_initcall() instead of __initcall()\n" . $herecurr);
		}
# check for various ops structs, ensure they are const.
		my $struct_ops = qr{acpi_dock_ops|
				address_space_operations|
				backlight_ops|
				block_device_operations|
				dentry_operations|
				dev_pm_ops|
				dma_map_ops|
				extent_io_ops|
				file_lock_operations|
				file_operations|
				hv_ops|
				ide_dma_ops|
				intel_dvo_dev_ops|
				item_operations|
				iwl_ops|
				kgdb_arch|
				kgdb_io|
				kset_uevent_ops|
				lock_manager_operations|
				microcode_ops|
				mtrr_ops|
				neigh_ops|
				nlmsvc_binding|
				pci_raw_ops|
				pipe_buf_operations|
				platform_hibernation_ops|
				platform_suspend_ops|
				proto_ops|
				rpc_pipe_ops|
				seq_operations|
				snd_ac97_build_ops|
				soc_pcmcia_socket_ops|
				stacktrace_ops|
				sysfs_ops|
				tty_operations|
				usb_mon_operations|
				wd_ops}x;
		if ($line !~ /\bconst\b/ &&
		    $line =~ /\bstruct\s+($struct_ops)\b/) {
			     "struct $1 should normally be const\n" .
				$herecurr);
		    $line !~ /\[[^\]]*NR_CPUS[^\]]*\.\.\.[^\]]*\]/)
# check for %L{u,d,i} in strings
		my $string;
		while ($line =~ /(?:^|")([X\t]*)(?:"|$)/g) {
			$string = substr($rawline, $-[1], $+[1] - $-[1]);
			$string =~ s/%%/__/g;
			if ($string =~ /(?<!%)%L[udi]/) {
				WARN("PRINTF_L",
				     "\%Ld/%Lu are not-standard C, use %lld/%llu\n" . $herecurr);
				last;
		if ($line =~ /debugfs_create_file.*S_IWUGO/ ||
		    $line =~ /DEVICE_ATTR.*S_IWUGO/ ) {
		# Check for memset with swapped arguments
		if ($line =~ /memset.*\,(\ |)(0x|)0(\ |0|)\);/) {
			ERROR("MEMSET",
			      "memset size is 3rd argument, not the second.\n" . $herecurr);
	# This is not a patch, and we are are in 'no-patch' mode so
	if (!$is_patch) {
	if ($is_patch && $chk_signoff && $signoff == 0) {
		ERROR("MISSING_SIGN_OFF",
		      "Missing Signed-off-by: line(s)\n");
		print "\n" if ($quiet == 0);
			print "NOTE: whitespace errors detected, you may wish to use scripts/cleanpatch or\n";
			print "      scripts/cleanfile\n\n";
	if (keys %ignore_type) {
	    print "NOTE: Ignored message types:";
	    foreach my $ignore (sort keys %ignore_type) {
		print " $ignore";
	    }
	    print "\n";
	    print "\n" if ($quiet == 0);
	}
	if ($clean == 1 && $quiet == 0) {
		print "$vname has no obvious style problems and is ready for submission.\n"
	}
	if ($clean == 0 && $quiet == 0) {
		print << "EOM";
$vname has style problems, please review.
If any of these errors are false positives, please report
them to the openocd-devel mailing list or prepare a patch
and send it to Gerrit for review.