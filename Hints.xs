/* $File: //member/autrijus/Devel-Hints/Hints.xs $ $Author: autrijus $
   $Revision: #3 $ $Change: 4083 $ $DateTime: 2003/02/05 01:26:01 $ */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#define MYCOP ((count <= 0) ? PL_curcop \
			    : cxstack[cxstack_ix - count + 1 ].blk_oldcop)

MODULE = Devel::Hints	PACKAGE = Devel::Hints

SV *
cop_label(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVpv(MYCOP->cop_label, 0));

SV *
cop_stashpv(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVpv(CopSTASHPV(MYCOP), 0));

SV *
cop_stash(count=0)
	I32		count
    PPCODE:
	PUSHs(newRV((SV *)CopSTASH(MYCOP)));

SV *
cop_file(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVpv(CopFILE(MYCOP), 0));

SV *
cop_filegv(count=0)
	I32		count
    PPCODE:
	PUSHs(newRV((SV *)CopFILEGV(MYCOP)));

SV *
cop_seq(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVuv(MYCOP->cop_seq));

SV *
cop_arybase(count=0)
	I32		count
    PPCODE:
	PUSHs(newSViv(MYCOP->cop_arybase));

SV *
cop_line(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVuv((UV)MYCOP->cop_line));

SV *
cop_warnings(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVuv((UV)MYCOP->cop_warnings));

#if PERL_REVISION == 5 && PERL_VERSION >= 7
SV *
cop_io(count=0)
	I32		count
    PPCODE:
	PUSHs( MYCOP->cop_io );

#endif