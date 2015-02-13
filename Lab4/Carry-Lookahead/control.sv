module control (input Clk, Reset, Load_B, Run,
					 output logic Ld_B);

	enum logic [2:0] {A, B, C} curr_state, next_state; 
	
	always_ff @ (posedge Clk, posedge Reset)
	begin
		if (Reset)
			curr_state = A;
		else
			curr_state = next_state;
	end
	
	always_comb
	begin
		next_state = curr_state;
		unique case (curr_state)
			A : if (Run)
					next_state = B;
				else if (Load_B)
					next_state = C;
					
			B : next_state = A;
			C : next_state = A;
		endcase
	end
	
	always_comb
	begin
		case (curr_state)
			A:
				Ld_B <= 1'b0;
			B:
				Ld_B <= 1'b0;
			C:
				Ld_B <= 1'b1;
		endcase
				
	end
endmodule
					
						
					
					
					
					
					
					
					
			
				
				