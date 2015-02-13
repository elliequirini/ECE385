module control (input Reset, Load_B, Run,
					 output logic Ld_B);
					 
	enum logic [3:0] {A,B,C,D} cur_state, next_state;
	
	always_ff @ (posedge Reset)
	begin
		if(Reset)
			cur_state = A;
		else
			cur_state = next_state;
		end
		
		always_comb
		begin
			next_state = cur_state;
			
			unique case (cur_state)
				A:	next_state = D;
				B: next_state = D;
				C: next_state = D;
				D: 
				begin
					if(Run)
						next_state = B;
					else if(Load_B)
						next_state = C;
					else
						next_state = D;
				end
				endcase
			end
			
			always_comb
			begin
				case (cur_state)
					C:
					begin
						Ld_B <= Load_B;
					end
					default:
					begin
						Ld_B <= 1'b0;
					end
				endcase
			end
endmodule
					
						
					
					
					
					
					
					
					
			
				
				