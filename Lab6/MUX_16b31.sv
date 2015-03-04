module MUX_16b31 (input logic [15:0] IN_0, IN_1, IN_2, input logic [1:0] SEL, output logic [15:0] OUT);

	always_comb
	begin
		if(SEL == 2'b00)
			OUT <= IN_0;
		if(SEL == 2'b01)
			OUT <= IN_1;
		if(SEL == 2'b02)
			OUT <= IN_2;		
	end
endmodule