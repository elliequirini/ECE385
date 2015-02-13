module reg_17 (input Clk, Reset, Ld_B, Of1, Run,
					input [15:0] Data_In, 			//input for parallel load
					input [15:0] Data_Calc,
					output logic Overflow,					//overflow bit
					output logic [15:0] Data_Out);//contents of registers
					
	always_ff @ (posedge Run or posedge Ld_B or posedge Reset)
	begin
	
	if(Reset)
		begin
		Data_Out[15:0] <= 16'h0000;
		Overflow = 1'b0;
		end

	else if (Ld_B)
		begin
		Data_Out <= Data_In;
		Overflow <= 1'b0;
		end
		
	else if (Run)
		begin
		Data_Out <= Data_Calc;
		Overflow <= Of1;
		end
	end

endmodule