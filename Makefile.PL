# $File: //member/autrijus/Devel-Hints/Makefile.PL $ $Author: autrijus $
# $Revision: #1 $ $Change: 4022 $ $DateTime: 2003/01/29 18:56:37 $

use 5.008;
use ExtUtils::MakeMaker;

WriteMakefile(
    AUTHOR		=> 'Autrijus Tang (autrijus@autrijus.org)',
    ABSTRACT		=> 'Access compile-time hints at runtime',
    NAME		=> 'Devel::Hints',
    VERSION_FROM	=> 'Hints.pm',
);

1;
