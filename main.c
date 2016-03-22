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
#include <stdlib.h>

#define SIZE 512

void subr (int64_t A[], int64_t B[], int m, int *lt, int *eq, int *gt, int mapnum);

int main () {
    int lt, eq, gt;
    int lt_cpu, eq_cpu, gt_cpu;
    int64_t *A, *B;
    int mapnum = 0;
    int m = SIZE;
    int i, err=0;

    map_allocate (1);

    A = (int64_t*) malloc (SIZE * sizeof (int64_t));
    B = (int64_t*) malloc (SIZE * sizeof (int64_t));

    for (i=0; i<SIZE; i++) {
        A[i] = random ();
	// make B equal A occasionally
        B[i] = (random () < 0x10000000) ? A[i] : random ();
	}

    subr (A, B, SIZE, &lt, &eq, &gt, mapnum);


    lt_cpu = eq_cpu = gt_cpu = 0;

    for (i=0; i<SIZE; i++)
        if (A[i] < B[i])
	    lt_cpu++;
	else if (A[i] == B[i])
	    eq_cpu++;
	else
	    gt_cpu++;

    if (lt != lt_cpu)
        err = 1;

    if (eq != eq_cpu)
        err = 1;

    if (gt != gt_cpu)
        err = 1;

    map_free (1);

    if (err) {
	printf ("results are not correct\n");
        exit (1);
	}
    else {
	printf ("results are correct\n");
        exit (0);
	}
    }
