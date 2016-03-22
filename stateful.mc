// $Id:

//
// Copyright 2004-2015 SRC Computers, LLC.  All rights reserved.
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

#include <libmap.h>
#include "compare_count.h"

void cmp_count (int64_t, int64_t, int, int*, int*, int*);

void subr (int64_t A[], int64_t B[], int m, int *lt, int *eq, int *gt, int mapnum) {
    OBM_BANK_A (AL, int64_t, MAX_OBM_SIZE)
    OBM_BANK_B (BL, int64_t, MAX_OBM_SIZE)
    int i;

    buffered_dma_cpu (CM2OBM, PATH_0, AL, MAP_OBM_stripe(1,"A"), A, 1, m*8);

    buffered_dma_cpu (CM2OBM, PATH_0, BL, MAP_OBM_stripe(1,"B"), B, 1, m*8);

    for (i=0; i<m; i++) {
	cmp_count (AL[i], BL[i], i==0, lt, eq, gt);
	}
    }
