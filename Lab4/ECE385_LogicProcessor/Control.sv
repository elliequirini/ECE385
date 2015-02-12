module control (input  Clk, Reset, LoadA, LoadB, Execute,
                output logic Shift_En, Ld_A, Ld_B );

    // declare signals curr_state, next_state of type enum
    //    with enum values of A, B, ..., F as the state values
    enum logic [3:0] {A, B, C, D, E, F, G, H, I, J}   curr_state, next_state; 


    always_ff @ (posedge Clk or posedge Reset )  
    begin
        if (Reset)
            curr_state = A;
        else 
            curr_state = next_state;
    end

    // Assign outputs based on ‘state’
	 always_comb
    begin
        next_state  = curr_state;         

        unique case (curr_state) 

            A :    if (Execute)
                       next_state = B;
            B :    next_state = C;
            C :    next_state = D;
            D :    next_state = E;
            E :    next_state = F;
            F :    next_state = G;
            G :    next_state = H;
            H :    next_state = I;
            I :    next_state = J;
            J :    if (~Execute) 
                       next_state = A;
        endcase
    end

    // Assign outputs based on ‘state’
	 always_comb
    begin
        case (curr_state) 
	   	   A: 
	         begin
                Ld_A <= LoadA;
                Ld_B <= LoadB;
                Shift_En <= 1'b0;
		      end
	   	   J: 
		      begin
                Ld_A <= 1'b0;
                Ld_B <= 1'b0;
                Shift_En <= 1'b0;
		      end
	   	   default:
		      begin
                Ld_A <= 1'b0;
                Ld_B <= 1'b0;
                Shift_En <= 1'b1;
		      end
        endcase
    end

endmodule
