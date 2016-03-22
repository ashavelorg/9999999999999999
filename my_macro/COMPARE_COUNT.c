// $Id:

//
// Copyright 2015 SRC Computers, LLC.  All rights reserved.
//
//      Manufactured in the United States of America.
//
// SRC Computers, LLC
// 4240 N Nevada Avenue
// Colorado Springs, CO 80907
// (v) (719) 262-0213
// (f) (719) 262-0223
//
// As covered under the End User Software License Agreement, no
// permission has been granted to distribute or copy this software
// without the express permission of SRC Computers, LLC.
//
// This program is distributed WITHOUT ANY WARRANTY OF ANY KIND.
//
// SRC Computers, LLC Confidential as covered under the NDA agreement.
//

#include <user_debug.h>
#include "compare_count.h"

        void cmp_count__dbg (int64_t v0, int64_t v1, int reset,
			int *lt, int *eq, int *gt, cmp_count_Struct *state) {
	    if (reset) {
	        state->lt = 0;
	        state->eq = 0;
	        state->gt = 0;
		}

	    if (v0 < v1)
	        state->lt++;
	    else if (v0 == v1)
	        state->eq++;
	    else
	        state->gt++;

	    *lt = state->lt;
	    *eq = state->eq;
	    *gt = state->gt;
	    }
