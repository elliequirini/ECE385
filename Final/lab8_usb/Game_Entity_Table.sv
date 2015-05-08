module game_entity_table(input logic [7:0] Sprite,
								 output logic [7:0] TLX, TLY, BRX, BRY);

	
	always_comb
	begin
		unique case(Sprite)
			8'h00,8'h01,
			8'ha1,8'ha2,8'ha3,8'ha4,8'ha5,8'ha6,8'ha7,8'ha8,
			8'hb1,8'hb2,8'hb3,8'hb4,8'hb5,8'hb6,8'hb7,8'hb8,
			8'hc1,8'hd1: 
					begin
						TLX <= 296;
						TLY <= 187;
						BRX <= 344;
						BRY <= 240;
					end
			8'he0:
				begin
					
				end
		endcase
	end
		
endmodule