use strict;
use inc::Module::Install;

name        'Devel-Hints';
all_from    'Hints.pm';

build_requires 'ok';
build_requires 'Test::More';

sign; WriteAll;
