/* $File: //member/autrijus/Devel-Hints/Hints.xs $ $Author: autrijus $
   $Revision: #2 $ $Change: 4025 $ $DateTime: 2003/01/29 20:16:46 $ */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#define MYCOP ((count <= 0) ? PL_curcop \
			    : cxstack[cxstack_ix - count + 1 ].blk_oldcop)

MODULE = Devel::Hints	PACKAGE = Devel::Hints

SV *
cop_label(count=0)
	I32		count
    PPCODE:
	PUSHs(newSVpv(MYCOP->cop_label, 0));

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

SV *
cop_io(count=0)
	I32		count
    PPCODE:
	PUSHs( MYCOP->cop_io );

