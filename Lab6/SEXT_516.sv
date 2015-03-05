module SEXT_516 (input [4:0] IN, output [15:0] OUT);
	
	always_comb
	begin
		if(IN[4] == 0)
			OUT <= (16'b0000000000000000 + IN);
		else
			OUT <= (16'b1111111111100000 + IN);
	end
endmodule

module SEXT_1116 (input [10:0] IN, output [15:0] OUT);
	
	always_comb
	begin
		if(IN[10] == 0)
			OUT <= (16'b0000000000000000 + IN);
		else
			OUT <= (16'b1111111111100000 + IN);
	end
endmodule

module SEXT_916 (input [8:0] IN, output [15:0] OUT);
	
	always_comb
	begin
		if(IN[8] == 0)
			OUT <= (16'b0000000000000000 + IN);
		else
			OUT <= (16'b1111111111100000 + IN);
	end
endmodule


module SEXT_616 (input [5:0] IN, output [15:0] OUT);
	
	always_comb
	begin
		if(IN[5] == 0)
			OUT <= (16'b0000000000000000 + IN);
		else
			OUT <= (16'b1111111111100000 + IN);
	end
endmodule

module ZEXT_816 (input [7:0] IN, output [15:0] OUT);
	
	always_comb
	begin
		OUT <= (16'b0000000000000000 + IN);
	end
endmodule