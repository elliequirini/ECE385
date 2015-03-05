module ALU (input [15:0] A_In, B_In,
				input [2:0] F,
				output logic [15:0] F_A_B);
	always_comb
		begin
			unique case (F)
				3'b000 : F_A_B = A_In + B_In ;
				3'b001 : F_A_B = A_In - B_In ;
				3'b010 : F_A_B = A_In & B_In ;
				3'b011 : F_A_B = A_In | B_In ;
				3'b100 : F_A_B = A_In ^ B_In ;
				3'b101 : F_A_B = ~A_In;
				3'b101 : F_A_B = 1'b0;
				default : F_A_B = A_In; //must be included
			endcase
		end
			
endmodule
