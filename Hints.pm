# $File: //member/autrijus/Devel-Hints/Hints.pm $ $Author: autrijus $
# $Revision: #1 $ $Change: 4022 $ $DateTime: 2003/01/29 18:56:37 $

use 5.008;
package Devel::Hints;

$VERSION = '0.01';

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);
@EXPORT_OK = qw( cop_label cop_seq cop_arybase cop_line cop_warnings cop_io );
%EXPORT_TAGS = ( all => \@EXPORT_OK );

__PACKAGE__->bootstrap($VERSION);

1;

__END__

=head1 NAME

Devel::Hints - Access compile-time hints at runtime

=head1 VERSION

This document describes version 0.01 of Devel::Hints, released
January 30, 2003.

=head1 SYNOPSIS

    use Devel::Hints ':all';

    LABEL:
    print cop_label();	    # 'LABEL'

    print cop_seq();	    # some integer

    $[ = 10;
    print cop_arybase();    # 10

    #line 100
    print cop_line();	    # 100

    use warnings;
    print cop_warnings();   # same as compile-time ${^WARNING_BITS}

    use open IO => ':utf8';
    print cop_io();	    # same as compile-time ${^OPEN}

=head1 DESCRIPTION

This module exports the C<cop> struct as individual functions;
callers can call them to find out the lexical-scoped hints that
its block is compiled under.

No functions are exported by default.

=head1 CAVEATS

The two other members (C<cop_stashpv> and C<cop_file> under ithreads,
C<cop_stash> and C<cop_filegv> otherwise) are not exported.

=head1 ACKNOWLEDGMENTS

Thanks to Rafael Garcia-Suarez for demonstrating how to do this with
the elegant B<Inline.pm>-based code on p5p, which I adapted to this
less elegant XS implementation.

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2003 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
