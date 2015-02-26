module LC3_CPU(input logic   	Clk,     	// Internal
												Reset,   	// Push button 0
												Run,			// Push button 1
												Continue,	// Push button 2
												ContinueIR,
                  input wire [15:0]	Data_in,     		// input data from switches
						output logic  		CE, UB, LB, OE, WE,
						inout wire [19:0]	ADDR,
						inout wire [15:0]	Data_out);
					
	
	logic [15:0] IR,l1,l12,l6,l8,l11;
	logic l0,l2,l5,l7,l9,l10;
	
	tristate_buffer MDR_gate(
									.buf_in(l0), 
									.select(l1), 
									.buf_out(l6));
	
	tristate_buffer PC_gate(
									.buf_in(l2), 
									.select(l12), 
									.buf_out(l8));
	
	ISDU			Ctrl( .Clk,
							.Reset(Reset),
							.Run(Run),
							.Continue(Continue),
							.ContinueIR(ContinueIR),
							.IR_5(IR[5]),
							.Opcode(IR[15:12]),
							.LD_MAR(l7),
							.LD_MDR(l9),
							.LD_IR(l5),
							
							.LD_PC(l10),
							.GatePC(l2),
							.GateMDR(l0),
							
							.Mem_CE(CE),
							.Mem_UB(UB),
							.Mem_LB(LB),
							.Mem_OE(OE),
							.Mem_WE(WE)
							);
							
	reg16		IR_Reg	(.*,
							.Load(l5),
							.Data_In(l6),
							.Data_Out(ADDR));
							
	reg16		MAR_Reg	(.*,
							.Load(l7),
							.Data_In(l8),
							.Data_Out(ADDR));
							
	reg16		MDR_Reg	(.*,
							.Load(l9),
							.Data_In(Data_in),
							.Data_Out(l1));
							
	reg16		PC_Reg	(.*,
							.Load(l10),
							.Data_In(l11),
							.Data_Out(l12));
							
	assign Data_out = IR;
						
endmodule 