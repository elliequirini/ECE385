module carry_select16(input [15:0]A,B, input c_in, output [15:0] S, output c_out);

	wire [2:0] c;
	wire [2:0] NC_c,C_c;
	wire [15:0] NC_Sum, C_Sum;
	
	full_adder_4 	FA0 (.A(A[3:0]), .B(B[3:0]), .c_in(c_in), .S(S[3:0]), .c_out(c[0]));
	
	full_adder_4	FA11 (.A(A[7:4]), .B(B[7:4]), .c_in(0), .S(NC_Sum[7:4]), .c_out(NC_c[0]));	
	full_adder_4	FA12 (.A(A[7:4]), .B(B[7:4]), .c_in(1), .S(C_Sum[7:4]), .c_out(C_c[0]));
	mux21_4 			mux1(.select(c[0]), .n(NC_Sum[7:4]), .c(C_Sum[7:4]), .q(S[7:4]));
	
	full_adder_4	FA21 (.A(A[11:8]), .B(B[11:8]), .c_in(0), .S(NC_Sum[11:8]), .c_out(NC_c[1]));	
	full_adder_4	FA22 (.A(A[11:8]), .B(B[11:8]), .c_in(1), .S(C_Sum[11:8]), .c_out(C_c[1]));
	assign c[1] = (c[0] & C_c[0]) | NC_c[0];
	mux21_4 			mux2(.select(c[1]), .n(NC_Sum[11:8]), .c(C_Sum[11:8]), .q(S[11:8]));
	
	full_adder_4	FA31 (.A(A[15:12]), .B(B[15:12]), .c_in(0), .S(NC_Sum[15:12]), .c_out(NC_c[2]));	
	full_adder_4	FA32 (.A(A[15:12]), .B(B[15:12]), .c_in(1), .S(C_Sum[15:12]), .c_out(C_c[2]));
	assign c[2] = (c[1] & C_c[1]) | NC_c[1];
	mux21_4 			mux3(.select(c[2]), .n(NC_Sum[15:12]), .c(C_Sum[15:12]), .q(S[15:12]));
	
	assign c_out = (c[2] & C_c[2]) | NC_c[2];
	
endmodule