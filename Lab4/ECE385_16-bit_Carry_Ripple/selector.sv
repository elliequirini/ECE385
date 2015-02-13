module selector(input Calc, input [16:0] s1, s2,
					output [16:0] s3);
					
	always_comb
	begin
		unique case (Calc)
			1 : s3 <= s1;
			0 : s3 <= s2;
		endcase
	end
endmodule
