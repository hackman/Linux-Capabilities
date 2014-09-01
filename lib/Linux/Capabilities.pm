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
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	cap_get_proc cap_set_proc cap_get_bound cap_drop_bound cap_get_pid
);

our $VERSION = '0.01';

use constant {
# list all caps here
	CLONE_ALL => 0,
};

require XSLoader;
XSLoader::load('Linux::Capabilities', $VERSION);

# Preloaded methods go here.

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
