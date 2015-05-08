module game_entity_table(input logic [7:0] Sprite,
								 output logic [7:0] TLX, TLY, BRX, BRY);

	always_comb
	begin
		unique case(Sprite)
			8'h00,8'h01,
			8'ha1,8'ha2,8'ha3,8'ha4,8'ha5,8'ha6,8'ha7,8'ha8,
			8'hb1,8'hb2,8'hb3,8'hb4,8'hb5,8'hb6,8'hb7,8'hb8,
			8'hc0,8'hc1,8'hc2,8'hc3,8'hc4,8'hc5,8'hc6,8'hc7,8'hc8,
			8'hd0,8'hd1,8'hd2,8'hd3,8'hd4,8'hd5,8'hd6,8'hd7,8'hd8: 
					begin
						TLX <= 296;
						TLY <= 187;
						BRX <= 344;
						BRY <= 240;
					end
		endcase
	end
		
endmodule