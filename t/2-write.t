# $File: //member/autrijus/Devel-Hints/t/2-write.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 7155 $ $DateTime: 2003/07/27 08:53:27 $

use strict;
use Test::More tests => 19;

use_ok('Devel::Hints');
Devel::Hints->import(':all');

my ($Topic, $TopicRV);
foreach (qw(label file filegv stashpv stash seq arybase line warnings io)) {
    no strict 'refs';

    $Topic = "cop_$_";
    $TopicRV = "cop_$_ - return value";
    &$_ if defined &$_;
}

sub label {
    my $x;
ENTER:
    is(cop_label(0 => $Topic), $Topic, $TopicRV) unless $x;
    (ok($x, $Topic), goto LEAVE) if $x++;
    goto $Topic;
LEAVE:
}

sub file {
    local $SIG{__WARN__} = sub { like($_[0], qr/$Topic/, $Topic) };
    is(cop_file(0 => $Topic), $Topic, $TopicRV), warn;
}

sub filegv {
    my $x = cop_filegv(0, \*DATA);
    is($x, \*DATA, $TopicRV);
}

sub stashpv {
    my $x;
    is(cop_stashpv(0 => $Topic), $Topic, $TopicRV), $x = bless{};
    is(ref $x, $Topic, $Topic);
}

sub stash {
    $FOO::X = 1;
    is(cop_stash(0 => \%FOO::), \%FOO::, $TopicRV), reset('X');
    ok(!$FOO::X, $Topic);
}

sub seq {
    is(cop_seq(0 => 0), 0, $TopicRV), is(cop_seq(), 0, $Topic);
}

sub arybase {
    my @a = (1 .. 10);
    is(cop_arybase(0 => 1), 1, $TopicRV), is($a[1], 1, $Topic);
}

sub line {
    local $SIG{__WARN__} = sub { like($_[0], qr/1000/, $Topic) };
    is(cop_line(0 => 1000), 1000, $TopicRV), warn;
}

sub warnings {
    my $x;
    no warnings 'redefine';
    BEGIN { $x = ${^WARNING_BITS} };
    is(cop_warnings(0 => ~$x), ~$x, $TopicRV), sub {
	ok(warnings::enabled("redefine"), $Topic)
    }->();
}

sub io {
SKIP: {
    skip('cop_io() not available', 1) unless defined cop_io();
    is(cop_io(0 => ":raw\0:raw"), ":raw\0:raw", $TopicRV);
}
}
