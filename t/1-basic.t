# $File: //member/autrijus/Devel-Hints/t/1-basic.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 4022 $ $DateTime: 2003/01/29 18:56:37 $

use Test::More tests => 7;

use_ok('Devel::Hints');
Devel::Hints->import(':all');

LABEL:
is(cop_label(), 'LABEL', 'cop_label');

ok(cop_seq(), 'cop_seq');

$[ = 10;
is(cop_arybase(), 10, 'cop_arybase');

#line 100
is(cop_line(), 100, 'cop_line');

use warnings;
is(cop_warnings(), 12, 'cop_warnings');

use open IO => ':raw';
is(cop_io(), ":raw\0:raw", 'cop_io');

1;
