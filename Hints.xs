/* $File: //member/autrijus/Devel-Hints/Hints.xs $ $Author: autrijus $
   $Revision: #1 $ $Change: 4022 $ $DateTime: 2003/01/29 18:56:37 $ */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Devel::Hints	PACKAGE = Devel::Hints

SV *
cop_label()
    PPCODE:
	PUSHs(newSVpv(PL_curcop->cop_label, 0));

SV *
cop_seq()
    PPCODE:
	PUSHs(newSVuv(PL_curcop->cop_seq));

SV *
cop_arybase()
    PPCODE:
	PUSHs(newSViv(PL_curcop->cop_arybase));

SV *
cop_line()
    PPCODE:
	PUSHs(newSVuv((UV)PL_curcop->cop_line));

SV *
cop_warnings()
    PPCODE:
	PUSHs(newSVuv((UV)PL_curcop->cop_warnings));

SV *
cop_io()
    PPCODE:
	PUSHs(PL_curcop->cop_io);

