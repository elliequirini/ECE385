//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    17:44:03 10/08/06
// Design Name:    ECE 385 Lab 6 Given Code - Incomplete ISDU
// Module Name:    ISDU - Behavioral
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//------------------------------------------------------------------------------


module ISDU ( 	input			Clk, 
									Reset,
									Run,
									Continue,
									ContinueIR,
									
				input [3:0]  	Opcode, 
				input        	IR_5,
				  
				output logic 	LD_MAR,
									LD_MDR,
									LD_IR,
									LD_BEN,
									LD_CC,
									LD_REG,
									LD_PC,
									
				output logic 	GatePC,
									GateMDR,
									GateALU,
									GateMARMUX,
									
				output logic [1:0] 	PCMUX,
											DRMUX,
											SR1MUX,
				output logic 			SR2MUX,
											ADDR1MUX,
				output logic [1:0] 	ADDR2MUX,
				output logic 			MARMUX,
				  
				output logic [1:0] 	ALUK,
				  
				output logic 	Mem_CE,
									Mem_UB,
									Mem_LB,
									Mem_OE,
									Mem_WE
				);

    enum logic [3:0] {Halted, PauseIR1, PauseIR2, S_18, S_33_1, S_33_2, S_35, S_32, S_01,
								S_LDR, S_LDR_2, S_LDR_3, S_LDR_4, S_AND}   State, Next_state;   // Internal state logic
	    
    always_ff @ (posedge Clk or posedge Reset )
    begin : Assign_Next_State
        if (Reset) 
            State <= Halted;
        else 
            State <= Next_state;
    end
   
	always_comb
    begin 
	    Next_state  = State;
	 
        unique case (State)
            Halted : 
	            if (Run) 
					Next_state <= S_18;					  
            S_18 : 
                Next_state <= S_33_1;
            S_33_1 : 
                Next_state <= S_33_2;
            S_33_2 : 
                Next_state <= S_35;
            S_35 : 
                Next_state <= S_32;
					 
            PauseIR1 : 
                if (~ContinueIR) 
                    Next_state <= PauseIR1;
                else 
                    Next_state <= PauseIR2;
            PauseIR2 : 
                if (ContinueIR) 
                    Next_state <= PauseIR2;
                else 
                    Next_state <= S_18; //S_18
						  
            S_32 : 
				case (Opcode)
					4'b0001 : // ADD
						Next_state <= S_01;
					4'b0110 : // LDR
						Next_state <= S_LDR;
					4'b0101 : // AND
						Next_state <= S_AND;
					
					default : 
					    Next_state <= S_18;
				endcase
				
            S_01 : // ADD
				Next_state <= S_18;
				
				S_AND : Next_state <= S_18;
				
				S_LDR : Next_state <= S_LDR_2;
				S_LDR_2 : Next_state <= S_LDR_3;
				S_LDR_3 : Next_state <= S_LDR_4;
				S_LDR_4 : Next_state <= S_18;
				
			default : ;

	     endcase
    end
   
    always_comb
    begin 
        //default controls signal values; within a process, these can be
        //overridden further down (in the case statement, in this case)
	    LD_MAR = 1'b0;
	    LD_MDR = 1'b0;
	    LD_IR = 1'b0;
	    LD_BEN = 1'b0;
	    LD_CC = 1'b0;
	    LD_REG = 1'b0;
	    LD_PC = 1'b0;
		 
	    GatePC = 1'b0;
	    GateMDR = 1'b0;
	    GateALU = 1'b0;
	    GateMARMUX = 1'b0;
		 
		 ALUK = 2'b00;
		 
	    PCMUX = 2'b00;
	    DRMUX = 2'b00;
	    SR1MUX = 2'b00;
	    SR2MUX = 1'b0;
	    ADDR1MUX = 1'b0;
	    ADDR2MUX = 2'b00;
	    MARMUX = 1'b0;
		 
	    Mem_OE = 1'b1;
	    Mem_WE = 1'b1;
		 
	    case (State)
			Halted: ;
			S_18 : 
				begin 
					GatePC = 1'b1;
					LD_MAR = 1'b1;
					PCMUX = 2'b00;
					LD_PC = 1'b1;
				end
			S_33_1 : 
				Mem_OE = 1'b0;
			S_33_2 : 
				begin 
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
                end
            S_35 : 
                begin 
					GateMDR = 1'b1;
					LD_IR = 1'b1;
                end
            PauseIR1: ;
            PauseIR2: ;
            S_32 : 
                LD_BEN = 1'b1;
					 
					 
            S_01 : // ADD
                begin 
					SR2MUX = IR_5;
					ALUK = 2'b00;
					GateALU = 1'b1;
					LD_REG = 1'b1;
                end
					 
				S_AND: // AND
					begin
					SR2MUX = IR_5;
					ALUK = 2'b01;
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1; 	
					end
					 
				S_LDR: // (MAR <- Breg + SEXT(off6))
					begin
					ADDR1MUX = 1'b1; 
					ADDR2MUX = 1'b0; 
					MARMUX = 1'b0; 
					GateMARMUX = 1'b1;
					LD_MAR = 1'b1;
					end

				S_LDR_2 : // (2 cycles required..MDR<-M[MAR])
					begin
					Mem_OE = 1'b0;
					end
				S_LDR_3 : 
					begin
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
					end
				S_LDR_4 : // (DR<-MDR)
					begin
					GateMDR = 1'b1; 
					LD_REG = 1'b1;
					LD_CC = 1'b1; 
					end
					
            default : ;
           endcase
       end 

	assign Mem_CE = 1'b0;
	assign Mem_UB = 1'b0;
	assign Mem_LB = 1'b0;
	
endmodule
