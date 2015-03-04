module SEXT_516 (input [4:0] IN, output [15:0] OUT);
	
	always_comb
	begin
		if(IN[4] == 0)
			OUT <= (16'b0000000000000000 + IN);
		else
			OUT <= (16'b1111111111100000 + IN);
	end
endmodule
