# $File: //member/autrijus/Devel-Hints/Makefile.PL $ $Author: autrijus $
# $Revision: #4 $ $Change: 6920 $ $DateTime: 2003/07/10 17:20:26 $

use 5.006;
use inc::Module::Install;

WriteMakefile(
    AUTHOR		=> 'Autrijus Tang (autrijus@autrijus.org)',
    ABSTRACT		=> 'Access compile-time hints at runtime',
    NAME		=> 'Devel::Hints',
    VERSION_FROM	=> 'Hints.pm',
    PREREQ_PM		=> {
	'Test::More'	=> 0,
    }
);

par_base('AUTRIJUS');
fetch_par() unless can_cc();
auto_install();

1;
