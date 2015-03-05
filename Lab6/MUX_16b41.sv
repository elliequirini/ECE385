module MUX_16b41 (input Clk, input logic [15:0] IN_0, IN_1, IN_2, IN_3, 
						input [1:0] SEL, 
						output logic [15:0] OUT);

	always_ff @ (IN_0 or IN_1 or IN_2 or IN_3 or SEL)
	begin
		if(SEL == 2'b00)
			OUT <= IN_0;
		else if(SEL == 2'b01)
			OUT <= IN_1;
		else if(SEL == 2'b10)
			OUT <= IN_2;
		else if(SEL == 2'b11)
			OUT <= IN_3;
	end
endmodule