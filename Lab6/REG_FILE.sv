module REG_FILE(input Clk, Reset, LD_REG,
					input logic [15:0] BUS, 
					input logic [2:0] DR, SR1, SR2, 
					output logic [15:0] SR1_OUT, SR2_OUT);

	logic [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
	
	//reg16	inputReg(.Clk, .Load(LD_REG), .Data_In(BUS), .Data_Out(DR_data), .Reset);
	//reg16 SR1_Reg(.Clk, .Load(1), .Data_In(SR1_val), .Data_Out(SR1_OUT), .Reset);
	
	always_ff @ (posedge Clk)
	begin 
		if(LD_REG)
			case(DR)
				3'b000: R0 <= BUS;
				3'b001: R1 <= BUS;
				3'b010: R2 <= BUS;
				3'b011: R3 <= BUS;
				3'b100: R4 <= BUS;
				3'b101: R5 <= BUS;
				3'b110: R6 <= BUS;
				3'b111: R7 <= BUS;
				default: ;
			endcase
			
		case(SR1)
			3'b000: SR1_OUT <= R0;
			3'b001: SR1_OUT <= R1;
			3'b010: SR1_OUT <= R2;
			3'b011: SR1_OUT <= R3;
			3'b100: SR1_OUT <= R4;
			3'b101: SR1_OUT <= R5;
			3'b110: SR1_OUT <= R6;
			3'b111: SR1_OUT <= R7;
			default: ;
		endcase
		
		case(SR2)
			3'b000: SR2_OUT <= R0;
			3'b001: SR2_OUT <= R1;
			3'b010: SR2_OUT <= R2;
			3'b011: SR2_OUT <= R3;
			3'b100: SR2_OUT <= R4;
			3'b101: SR2_OUT <= R5;
			3'b110: SR2_OUT <= R6;
			3'b111: SR2_OUT <= R7;
			default: ;
		endcase
		
	end
endmodule	
		
	