module MUX_3b21(input [2:0] IN_0, IN_1, input logic SEL, output logic [2:0] OUT);

	always_comb
	begin
		if(SEL == 1'b0)
			OUT <= IN_0;
		else
			OUT <= IN_1;	
	end

endmodule