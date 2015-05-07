module color_table(input int color,
						 output logic [7:0]  R, G, B);

	logic [7:0] Red, Green, Blue;
						 
	always_comb
	begin
		unique case (color)
			0:	begin //background
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
			end
			1: begin //black
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
			end
			2: begin //pink
				Red = 8'hff;
				Green = 8'hae;
				Blue = 8'hc9;
			end
			3: begin //grey
				Red = 8'h4a;
				Green = 8'h4a;
				Blue = 8'h4a;
			end
			4: begin //green
				Red = 8'hb5;
				Green = 8'he6;
				Blue = 8'h1d;
			end
			5: begin //white
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
			end
			6: begin //dark red
				Red = 8'h5e;
				Green = 8'h00;
				Blue = 8'h0e;
			end
			7: begin //red
				Red = 8'h88;
				Green = 8'h00;
				Blue = 8'h15;
			end
			
			8: begin //light red
				Red = 8'hd9;
				Green = 8'h00;
				Blue = 8'h21;
			end
		endcase
	end
	assign R = Red;
	assign G = Green;
	assign B = Blue;
endmodule