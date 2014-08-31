#ifndef __linux
#error "No linux. Compile aborted."
#endif

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <errno.h>
#include <sys/types.h>
#include <sys/capability.h>

MODULE = Linux::Capabilities		PACKAGE = Linux::Capabilities

SV * cap_get_proc_wrapper(void)
PPCODE:
	cap_t caps;
	int cap_len;
	char *cap_text = NULL;
	ST(0) = sv_newmortal();
	caps = cap_get_proc();
	if (caps == NULL)
		XPUSHs(sv_2mortal(newSVnv(0)));
	else {
		cap_text = cap_to_text(caps, &cap_len);
		if (cap_text) {
			XPUSHs(sv_2mortal(newSVpv(cap_text, cap_len)));
		}
	}
