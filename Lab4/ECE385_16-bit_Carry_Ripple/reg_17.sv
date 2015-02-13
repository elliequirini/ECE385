module reg_17 (input Clk, Reset, Ld_B, Ofl, Run,
					input [15:0] Data_In, 			//input for parallel load
					output Overflow,					//overflow bit
					output logic [15:0] Data_Out);//contents of registers
					
	always_ff @ (posedge Clk or posedge Ld_B or posedge Reset)
	begin
	
	if(Reset)
		begin
		Data_Out[15:0] <= 16'h0000;
		Overflow = 1'b0;
		end

	else if (Ld_B | Run)
		begin
		Data_Out[15:0] <= Data_In;
		Overflow <= Ofl;
		end

endmodule