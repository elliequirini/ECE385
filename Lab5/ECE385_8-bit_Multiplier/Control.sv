module Control (input  Clk, Reset, ClearA_LoadB, Run, M,
                output logic Shift_En, Clr_Ld, Add, Fn, Reset_c, D_);
					
enum logic [4:0] {Idle, R, Load, Start, Done, A, B, C, D, E, F, G, H, A2, B2, C2, D2, E2, F2, G2, H2} curr_state, next_state;

always_ff @ (posedge Clk or posedge Reset)  
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
						next_state = Start;
					else if(ClearA_LoadB)
						next_state = Load;
						
		Start: 	next_state = A2;
			A2:	next_state = A;
			A : 	next_state = B2;
			B2:	next_state = B;
			B :   next_state = C2;
			C2:	next_state = C;
			C :   next_state = D2;
			D2:	next_state = D;
			D :   next_state = E2;
			E2:	next_state = E;
			E :   next_state = F2;
			F2:	next_state = F;
			F :   next_state = G2;
			G2:	next_state = G;
			G :   next_state = H2;
			H2:	next_state = H;
			H : 	next_state = Done;
		Done :	if(~Run) next_state = Idle;
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
				Fn <= 1'b0;
				D_ <= 1'b0;
			end
		Load:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b1;
				Add <= 1'b0;
				Fn <= 1'b0;
				D_ <= 1'b0;
			end
		
		A2, B2, C2, D2, E2, F2, G2:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Fn <= 1'b0;
				D_ <= 1'b0;
				
				if(M)
					Add <= 1'b1;
				else
					Add <= 1'b0;
			end
		
		H2:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Fn <= 1'b1;
				D_ <= 1'b0;
				
				if(M)
					Add <= 1'b1;
				else
					Add <= 1'b0;
			end
			
		A, B, C, D, E, F, G, H:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b1;
				Clr_Ld <= 1'b0;
				Fn <= 1'b0;
				Add <= 1'b0;
				D_ <= 1'b0;
			end
			
		Idle, Start:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				Fn <= 1'b0;
				D_ <= 1'b0;
			end
		Done:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				Fn <= 1'b0;
				D_ <= 1'b1;
			end
			
		default:
			begin
				Reset_c <= 1'b0;
				Shift_En <= 1'b0;
				Clr_Ld <= 1'b0;
				Add <= 1'b0;
				Fn <= 1'b0;
				D_ <= 1'b0;
			end
	endcase
end
endmodule	