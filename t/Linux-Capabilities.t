# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Linux-Setns.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Linux::Capabilities') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

isnt(cap_get_proc(), 0);
