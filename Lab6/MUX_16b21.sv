module MUX_16b21(input [15:0] IN_0, IN_1, input logic SEL, output [15:0] OUT)

	always_comb
	begin
		if(SEL == 1'b0)
			OUT <= IN_0;
		if(SEL == 1'b1)
			OUT <= IN_1;	
	end

endmodule