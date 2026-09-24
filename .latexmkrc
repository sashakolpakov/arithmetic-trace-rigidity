# Fix the PDF build clock so that clean builds of unchanged sources are
# byte-for-byte reproducible with the recorded TeX toolchain.  The epoch is
# 2026-09-22 00:00:00 UTC, the fixed build date for all three manuscripts.
$ENV{'SOURCE_DATE_EPOCH'} = '1790035200';
$ENV{'FORCE_SOURCE_DATE'} = '1';
$ENV{'TZ'} = 'UTC';
