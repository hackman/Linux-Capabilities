#ifndef __linux
#error "No linux. Compile aborted."
#endif

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/capability.h>

MODULE = Linux::Capabilities		PACKAGE = Linux::Capabilities

SV * cap_get_proc_wrapper()
PPCODE:
	cap_t caps;
	int cap_len;
	char *cap_text = NULL;
	ST(0) = sv_newmortal();
	caps = cap_get_proc();
	if (caps == NULL)
		XPUSHs(sv_2mortal(newSViv(0)));
	else {
		cap_text = cap_to_text(caps, &cap_len);
		if (cap_free(caps) == -1)
			fprintf(stderr, "Linux::Capabilities error: unable to free capability memory\n");
		if (cap_text)
			XPUSHs(sv_2mortal(newSVpv(cap_text, cap_len)));
	}

SV * cap_is_supported_wrapper(int cap)
PPCODE:
	if (cap < 0 || cap > CAP_LAST_CAP) {
		fprintf(stderr, "Linux::Capabilities error: invalid capability supplied\n");
		XPUSHs(sv_2mortal(newSViv(0)));
	}
	if (CAP_IS_SUPPORTED((cap_value_t) cap)) {
		XPUSHs(sv_2mortal(newSViv(1)));
	} else {
		XPUSHs(sv_2mortal(newSViv(0)));
	}

SV * cap_get_bound_wrapper()
PPCODE:
	cap_value_t cap_val;
	int ret = 0;
	ret = cap_get_bound(cap_val);
	if (ret == -1) {
		fprintf(stderr, "Linux::Capabilities error: unable to get the bounding set\n");
		XPUSHs(sv_2mortal(newSViv(-1)));
	} else {
		XPUSHs(sv_2mortal(newSViv(ret)));
	}

SV * cap_get_pid_wrapper(int pid)
PPCODE:
	int cap_len;
	char *cap_text = NULL;
	cap_t caps = cap_get_pid((pid_t) pid);
	if (caps == NULL) {
		fprintf(stderr, "Linux::Capabilities error: unable to capabilities for pid %d\n", pid);
		XPUSHs(sv_2mortal(newSViv(0)));
	} else {
		cap_text = cap_to_text(caps, &cap_len);
		if (cap_text)
			XPUSHs(sv_2mortal(newSVpv(cap_text, cap_len)));
	}
