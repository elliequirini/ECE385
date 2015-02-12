module compute (input  [2:0]  F, 
                input  A_In, B_In,
                output logic A_Out, B_Out, F_A_B);

    always_comb
	 begin
        unique case (F)
	 	   3'b000   : F_A_B = A_In & B_In ;
		   3'b001   : F_A_B = A_In | B_In ;
		   3'b010   : F_A_B = A_In ^ B_In ;
		   3'b011   : F_A_B = 1'b1 ;
		   3'b100   : F_A_B = A_In &~ B_In ;
		   3'b101   : F_A_B = A_In |~ B_In ;
		   3'b110   : F_A_B = A_In ^~ B_In ;
		   3'b111   : F_A_B = 1'b0 ;
        endcase
    end

	
    assign A_Out = A_In;
    assign B_Out = B_In;
	 
	 
endmodule