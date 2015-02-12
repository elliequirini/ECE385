module reg_17 (input Clk, Reset, Load, Ofl,
					input [15:0] Data_In, 			//input for parallel load
					output Overflow,					//overflow bit
					output logic [15:0] Data_Out);//contents of registers
					
	always_ff @ (posedge Clk or posedge Load or posedge Reset)
	begin
	
	if(Reset){
		Data_Out[15:0] <= 16'h00;
		Overflow = 1'b0;
	}
	else if (Load){
		Data_Out[15:0] <= Data_In;
		Overflow = Ofl;
	}
	end

endmodule