# $File: //member/autrijus/Devel-Hints/t/1-basic.t $ $Author: autrijus $
# $Revision: #2 $ $Change: 4025 $ $DateTime: 2003/01/29 20:16:46 $

use Test::More tests => 11;

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
is(cop_io(0), ":raw\0:raw", 'cop_io');

{
    use open IO => ':utf8';
    is(cop_io(1), ":raw\0:raw", 'cop_io(1) on block');
}

{ { {
use open IO => ':utf8';
is(show_io(), ":utf8\0:utf8", 'cop_io(1) on blocks');
} } }

{
use open IO => ':utf8';
is(show_io(), ":utf8\0:utf8", 'cop_io(1) on sub');
}

{
use open IO => ':utf8';
is(show_io_2(), ":utf8\0:utf8", 'cop_io(2) on block');
}

1;

sub show_io { return cop_io(1) }
sub show_io_2 { { return cop_io(2) } }
