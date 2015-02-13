module mux21_4 (input select, input[3:0] n,c, output [3:0] q);

	wire[1:0] d0, d1, d2, d3; 
	assign d0[0] = n[0];
	assign d0[1] = c[0];
	
	assign d1[0] = n[1];
	assign d1[1] = c[1];
	
	assign d2[0] = n[2];
	assign d2[1] = c[2];
	
	assign d3[0] = n[3];
	assign d3[1] = c[3];
	
	//always_comb
	//begin
		mux21 mux0 (.select(select), 
		.q(q[0]), 
		.d(d0));
		mux21 mux1 (.select(select), .q(q[1]), .d(d1));
		mux21 mux2 (.select(select), .q(q[2]), .d(d2));
		mux21 mux3 (.select(select), .q(q[3]), .d(d3));
	//end
	
endmodule
	