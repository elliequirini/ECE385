module Control (input  Clk, Reset, ClearA_LoadB, Run, M,
                output logic Shift_En, Clr_Ld, Add, Sub, Reset_c);
					
enum logic [3:0] {Idle, R, Load, A, B, C, D, E, F, G, H} curr_state, next_state;

always_ff @ (posedge Clk or posedge Reset )  
    begin
        if (Reset)
            curr_state = R;
        else 
            curr_state = next_state;
    end
	 
always_comb
begin
	next_state = curr_state;
	
	unique case (curr_state)
		R:			next_state = Idle;
		Load: 	next_state = Idle;
		Idle: 	if(Run)
						next_state = A;
					else if(ClearA_LoadB)
						next_state = Load;
						
			A : 	next_state = B;
			B :   next_state = C;
			C :   next_state = D;
			D :   next_state = E;
			E :   next_state = F;
			F :   next_state = G;
			G :   next_state = H;
			H : 	next_state = Idle;
	endcase

end

always_comb
begin 
	case (curr_state)
		R:
			begin
				Reset_c <= 1'b1;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				Sub <= 1'b0;
			end
		Idle:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				Sub <= 1'b0;
			end
		Load:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b1;
				Add <= 1'b0;
				Sub <= 1'b0;
			end
			
		G:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b1;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				
				if(M)
					Sub <= 1'b1;
				else
					Sub <= 1'b0;	
			end
		
		H:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b1;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				Sub <= 1'b0;
			end
			
		default:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b1;
				Clr_Ld <= 1'b0;
				Sub <= 1'b0;
				
				if(M)
					Add <= 1'b1;
				else
					Add <= 1'b0;
			end
	endcase
end
endmodule