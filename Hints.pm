# $File: //member/autrijus/Devel-Hints/Hints.pm $ $Author: autrijus $
# $Revision: #5 $ $Change: 7156 $ $DateTime: 2003/07/27 08:55:12 $

use 5.006;
package Devel::Hints;

$VERSION = '0.10';

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
    cop_io
    ),
);

__PACKAGE__->bootstrap($VERSION);

1;

__END__

=head1 NAME

Devel::Hints - Access compile-time hints at runtime

=head1 VERSION

This document describes version 0.10 of Devel::Hints, released
July 26, 2003.

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

This module exports the C<cop> (code operator) struct as individual
functions; callers can call them to find out the lexical-scoped hints
that its block (or statement) is compiled under.

No functions are exported by default.  Each function may take an
optional positive integer as argument, indicating how many blocks
it should walk upward to obtain the C<cop> members.

Functions can also take another optional argument, which (if specified)
I<becomes the new value> for the hint, affecting the current statement
or block's behaviour.

=head1 FUNCTIONS

=over 4

=item cop_label

Label for the current construct.

=item cop_file

File name for the current source file.

=item cop_filegv

Glob reference to the current source filehandle.

=item cop_stashpv

The current package name.

=item cop_stash

Hash reference to the current symbol table.

=item cop_seq

Parse sequencial number.

=item cop_arybase

Array base the calling line was compiled with.

=item cop_line

The line number.

=item cop_warnings

Lexical warnings bitmask, a.k.a. C<${^WARNING_BITS}>.  If no lexical
warnings are in effect, returns the global warning flags as an integer.

=item cop_io

Lexical IO defaults, a.k.a. C<${^OPEN}>.  If no lexical IO layers
are in effect, an empty string is returned.  Always returns C<undef>
under pre-5.7 versions of Perl.

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
