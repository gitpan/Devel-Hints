# $File: //member/autrijus/Devel-Hints/Hints.pm $ $Author: autrijus $
# $Revision: #4 $ $Change: 6920 $ $DateTime: 2003/07/10 17:20:26 $

use 5.006;
package Devel::Hints;

$VERSION = '0.04';

use strict;
use vars qw($VERSION @ISA @EXPORT_OK %EXPORT_TAGS);

require Exporter;
require DynaLoader;

@ISA		= qw( Exporter DynaLoader );
%EXPORT_TAGS	= ( all => \@EXPORT_OK );
@EXPORT_OK	= ( qw(
    cop_label
    cop_stash	cop_stashpv
    cop_file	cop_filegv
    cop_seq
    cop_arybase
    cop_line
    cop_warnings
    ), ( $] >= 5.007 ? ( 'cop_io' ) : () )
);

__PACKAGE__->bootstrap($VERSION);

1;

__END__

=head1 NAME

Devel::Hints - Access compile-time hints at runtime

=head1 VERSION

This document describes version 0.04 of Devel::Hints, released
July 8, 2003.

=head1 SYNOPSIS

    use Devel::Hints ':all';

    LABEL:
    print cop_label();	    # 'LABEL'
    cop_label(0 => 'FOO');  # "goto FOO;" is valid after this point!
    print cop_file();	    # same as __FILE__
    print cop_filegv();	    # same as \$::{'_<' . __FILE__}
    print cop_stashpv();    # same as __PACKAGE__
    print cop_stash();	    # same as \%{__PACKAGE__ . '::'}
    print cop_seq();	    # an integer
    print cop_arybase();    # same as $[
    print cop_line();	    # same as __LINE__

    use warnings;
    print cop_warnings();   # same as compile-time ${^WARNING_BITS}

    # cop_io() is only available to Perl 5.7 or above
    use open IO => ':utf8';
    print cop_io();	    # same as compile-time ${^OPEN}

    {
	use IO => ':raw';
	print cop_io(1);    # access one uplevel; still ":utf8\0:utf8"
    }

=head1 DESCRIPTION

This module exports the C<cop> struct as individual functions;
callers can call them to find out the lexical-scoped hints that
its block is compiled under.

No functions are exported by default.  Each function may take an
optional positive integer as argument, indicating how many blocks
it should walk upward to obtain the C<cop> members.  Most functions
also takes another optional argument, which (if specified) I<becomes
the new value> for the hint.

=head1 FUNCTIONS

=over 4

=item cop_label

Label for the current construct.

=item cop_file

File name for the current line.

=item cop_filegv

Reference to the filehandle glob.  Read only.

=item cop_stashpv

The current package name.

=item cop_stash

Reference to the current symbol table.  Read only.

=item cop_seq

Parse sequencial number.

=item cop_arybase

Array base the calling line was compiled with.

=item cop_line

The line number.

=item cop_warnings

Lexical warnings bitmask, a.k.a. C<${^WARNING_BITS}>.

=item cop_io

Lexical IO defaults, a.k.a. C<${^OPEN}>.

=back

=head1 ACKNOWLEDGMENTS

Thanks to Rafael Garcia-Suarez for demonstrating how to do this with
the elegant B<Inline::C> code on p5p, which I adapted to this
less elegant XS implementation.

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2003 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
