# $File: //member/autrijus/Devel-Hints/Makefile.PL $ $Author: autrijus $
# $Revision: #2 $ $Change: 4083 $ $DateTime: 2003/02/05 01:26:01 $

use 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
    AUTHOR		=> 'Autrijus Tang (autrijus@autrijus.org)',
    ABSTRACT		=> 'Access compile-time hints at runtime',
    NAME		=> 'Devel::Hints',
    VERSION_FROM	=> 'Hints.pm',
    PREREQ_PM		=> {
	'Test::More'	=> 0,
    }
);

1;
