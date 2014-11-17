package Linux::Capabilities;

use 5.018001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Linux::Setns ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	CAP_CHOWN CAP_DAC_OVERRIDE CAP_DAC_READ_SEARCH CAP_FOWNER CAP_FSETID CAP_KILL CAP_SETGID CAP_SETUID CAP_SETPCAP CAP_LINUX_IMMUTABLE CAP_NET_BIND_SERVICE CAP_NET_BROADCAST CAP_NET_ADMIN CAP_NET_RAW CAP_IPC_LOCK CAP_IPC_OWNER CAP_SYS_MODULE CAP_SYS_RAWIO CAP_SYS_CHROOT CAP_SYS_PTRACE CAP_SYS_PACCT CAP_SYS_ADMIN CAP_SYS_BOOT CAP_SYS_NICE CAP_SYS_RESOURCE CAP_SYS_TIME CAP_SYS_TTY_CONFIG CAP_MKNOD CAP_LEASE CAP_AUDIT_WRITE CAP_AUDIT_CONTROL CAP_SETFCAP CAP_MAC_OVERRIDE CAP_MAC_ADMIN CAP_SYSLOG CAP_WAKE_ALARM CAP_BLOCK_SUSPEND CAP_LAST_CAP
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	cap_valid
	cap_get_proc
	cap_set_proc
	cap_get_bound
	cap_drop_bound
	cap_is_supported
);

our $VERSION = '0.01';

use constant {
# list all caps here
	CLONE_ALL => 0,
	CAP_CHOWN => 0,
	CAP_DAC_OVERRIDE => 1,
	CAP_DAC_READ_SEARCH => 2,
	CAP_FOWNER => 3,
	CAP_FSETID => 4,
	CAP_KILL => 5,
	CAP_SETGID => 6,
	CAP_SETUID => 7,
	CAP_SETPCAP => 8,
	CAP_LINUX_IMMUTABLE => 9,
	CAP_NET_BIND_SERVICE => 10,
	CAP_NET_BROADCAST => 11,
	CAP_NET_ADMIN => 12,
	CAP_NET_RAW => 13,
	CAP_IPC_LOCK => 14,
	CAP_IPC_OWNER => 15,
	CAP_SYS_MODULE => 16,
	CAP_SYS_RAWIO => 17,
	CAP_SYS_CHROOT => 18,
	CAP_SYS_PTRACE => 19,
	CAP_SYS_PACCT => 20,
	CAP_SYS_ADMIN => 21,
	CAP_SYS_BOOT => 22,
	CAP_SYS_NICE => 23,
	CAP_SYS_RESOURCE => 24,
	CAP_SYS_TIME => 25,
	CAP_SYS_TTY_CONFIG => 26,
	CAP_MKNOD => 27,
	CAP_LEASE => 28,
	CAP_AUDIT_WRITE => 29,
	CAP_AUDIT_CONTROL => 30,
	CAP_SETFCAP => 31,
	CAP_MAC_OVERRIDE => 32,
	CAP_MAC_ADMIN => 33,
	CAP_SYSLOG => 34,
	CAP_WAKE_ALARM => 35,
	CAP_BLOCK_SUSPEND => 36,
	CAP_LAST_CAP => 36,
};

require XSLoader;
XSLoader::load('Linux::Capabilities', $VERSION);

# Preloaded methods go here.

sub cap_is_supported {
	my $ret = cap_is_supported_wrapper($_[0]);
	if ($ret) {
		return 1;
	} else {
		return 0;
	}
}

sub cap_get_proc {
	my $ret = cap_get_proc_wrapper();
	if ($ret eq 0) {
		return 1;
	} else {
		return $ret;
	}
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Linux::Capabilities - Perl extension to the LibCap functions

=head1 SYNOPSIS

	TODO: Add synopsis here

=head1 DESCRIPTION

This trivial module provides interface to the Linux libcap system calls. It
also provides the CAP_* constants that are used to specify capabilities. 


=head2 EXPORT

 cap_get_proc	- subroutine
 cap_set_proc	- subroutine
 cap_get_bound	- subroutine
 cap_drop_bound	- subroutine
 cap_get_pid	- subroutine



=head1 SEE ALSO

capabilities(s) Linux man page.
cap_get_proc(s) Linux man page.

=head1 AUTHOR

Marian HackMan Marinov, E<lt>hackman@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by Marian HackMan Marinov

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
