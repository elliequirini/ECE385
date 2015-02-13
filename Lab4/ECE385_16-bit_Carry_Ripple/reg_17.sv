module reg_17 (input Reset, Ld_B, Ofl,
					input [15:0] Data_In, 			//input for parallel load
					output Overflow,					//overflow bit
					output logic [15:0] Data_Out);//contents of registers
					
	always_ff @ (posedge Ld_B or posedge Reset)
	begin
	
	if(Reset)
		begin
		Data_Out[15:0] <= 16'h0000;
		Overflow = 1'b0;
		end

	else if (Ld_B)
		begin
		Data_Out[15:0] <= Data_In;
		Overflow = Ofl;
		end
	end

endmodule