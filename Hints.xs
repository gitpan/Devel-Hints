/* $File: //member/autrijus/Devel-Hints/Hints.xs $ $Author: autrijus $
   $Revision: #4 $ $Change: 6920 $ $DateTime: 2003/07/10 17:20:26 $ */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#define MYCOP ((count <= 0) ? PL_curcop \
			    : cxstack[cxstack_ix - count + 1 ].blk_oldcop)

MODULE = Devel::Hints	PACKAGE = Devel::Hints

SV *
cop_label(count=0, value=NULL)
	I32		count
	char*		value
    PPCODE:
	if (value) MYCOP->cop_label = value;
	PUSHs(newSVpv(MYCOP->cop_label, 0));

SV *
cop_stashpv(count=0,value=NULL)
	I32		count
	char*		value
    PPCODE:
	if (value) CopSTASHPV_set(MYCOP, value);
	PUSHs(newSVpv(CopSTASHPV(MYCOP), 0));

SV *
cop_stash(count=0)
	I32		count
    PPCODE:
	PUSHs(newRV((SV *)CopSTASH(MYCOP)));

SV *
cop_file(count=0,value=NULL)
	I32		count
	char*		value
    PPCODE:
#ifdef ITHREADS
	if (value) CopFILE_set(MYCOP, value);
#else
	if (value) sv_setpv( CopFILESV(MYCOP), value);
#endif
	PUSHs(newSVpv(CopFILE(MYCOP), 0));

SV *
cop_filegv(count=0)
	I32		count
    PPCODE:
	PUSHs(newRV((SV *)CopFILEGV(MYCOP)));

SV *
cop_seq(count=0, value=NULL)
	I32		count
	UV		value
    PPCODE:
	if (value) sv_setuv(MYCOP->cop_warnings, value);
	PUSHs(newSVuv(MYCOP->cop_seq));

SV *
cop_arybase(count=0, value=NULL)
	I32		count
	I32		value
    PPCODE:
	if (value) MYCOP->cop_arybase = value;
	PUSHs(newSViv(MYCOP->cop_arybase));

SV *
cop_line(count=0, value=NULL)
	I32		count
	U16		value
    PPCODE:
	if (value) MYCOP->cop_line = value;
	PUSHs(newSVuv((UV)MYCOP->cop_line));

SV *
cop_warnings(count=0, value=NULL)
	I32		count
	UV		value
    PPCODE:
	if (value) sv_setuv(MYCOP->cop_warnings, value);
	PUSHs(newSVuv((UV)MYCOP->cop_warnings));

#if PERL_REVISION == 5 && PERL_VERSION >= 7
SV *
cop_io(count=0, value=NULL)
	I32		count
	SV*		value
    PPCODE:
	if (value) MYCOP->cop_io = newSVsv(value);
	PUSHs( MYCOP->cop_io );

#endif
