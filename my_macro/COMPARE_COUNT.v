// $Id: COMPARE_COUNT.v 50 2015-03-24 16:26:19Z rbb $

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

module COMPARE_COUNT (A, B, Q0, Q1, Q2, CLK, VALID, CLR, LOOP);
    input [63:0] A;
    input [63:0] B;
    output [31:0] Q0;
    output [31:0] Q1;
    output [31:0] Q2;
    input CLK;
    input VALID;
    input CLR;
    input LOOP;

    reg [31:0] Q0, Q1, Q2;
    reg VALID_R;
    reg CLR_R;
    reg LOOP_R;
    reg [31:0] DIFF;

    always @ (posedge CLK) begin
	VALID_R <= VALID;
	CLR_R <= CLR;
	LOOP_R <= LOOP;

	DIFF <= A - B;

	if (VALID_R & LOOP_R) begin
	    if (CLR_R) begin
	        Q0 <= DIFF[31] ? 1 : 0;
	        Q1 <= (DIFF == 32'b0) ? 1 : 0;
	        Q2 <= (~DIFF[31] & ~(DIFF == 32'b0)) ? 1 : 0;
		end
	    else begin
	        Q0 <= DIFF[31] ? Q0 + 1 : Q0;
	        Q1 <= (DIFF == 0) ? Q1 + 1 : Q1;
	        Q2 <= (~DIFF[31] & ~(DIFF == 32'b0)) ? Q2 + 1 : Q2;
		end
	    end
	end
endmodule
