module CPU(input logic		Clk,     		// Internal
												Reset,   		// Push button 0
												Run,				// Push button 1
												Continue,		// Push button 2
                  input  [15:0] S,     		// input data from switches
						output logic  CE, UB, LB, OE, WE,
                  output [11:0] LED,
						output [19:0] ADDR,
						inout [15:0]  Data);
			
						
	logic Reset_h, Run_h, Continue_h; 
	always_comb
	begin
		Reset_h = ~Reset;
		Continue_h = ~Continue;
		Run_h = ~Run;
	end
	
	logic [15:0] IR, MAR, MDR, MDR_buf, PC_out, PC_inc, PC_buf;
	logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC;
	logic GatePC, GateMDR, GateALU, GateMARMUX;
	
	
	reg16			regMAR(.Clk, .Load(LD_MAR), .Data_In(PC_out), .Data_Out(MAR), .Reset(Reset_h));
	reg16			regMDR(.Clk, .Load(LD_MDR), .Data_In(Data), .Data_Out(MDR), .Reset(Reset_h));
	reg16			regIR(.Clk, .Load(LD_IR), .Data_In(MDR_buf), .Reset(Reset_h), .Data_Out(IR));
	reg16			regPC(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out), .Reset(Reset_h));

	/*
	reg16			regR0(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	reg16			regR1(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	reg16			regR2(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	reg16			regR3(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));	
	reg16			regR4(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	reg16			regR5(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	reg16			regR6(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	reg16			regR7(.Clk, .Load(LD_PC), .Data_In(PC_buf), .Data_Out(PC_out),	.Reset(Reset_h));
	*/
	

	ISDU			Ctrl(
						.Clk,
						.Reset(Reset_h),
						.Run(Run_h),
						.Continue(Continue_h),
						.ContinueIR(Continue_h),
						.Mem_CE(CE),
						.Mem_UB(UB),
						.Mem_LB(LB),
						.Mem_OE(OE),
						.Mem_WE(WE),
						.LD_MAR,
						.LD_MDR,
						.LD_IR,
						.LD_BEN,
						.LD_CC,
						.LD_REG,
						.LD_PC,
						.GatePC,
						.GateMDR,
						.GateALU,
						.GateMARMUX);
							
	IncPC 		NextPC(.PC(PC_out),
							 .PC_out(PC_inc));

							 
	//assign ADDR = {4'b0, MAR};
	/*
	test_memory MEM(.*,
						.A({4'b0, MAR}),
						.Clk,
						.Reset(Reset_h),
						.I_O(Data)						
						);*/

	tristate_buffer MDR_gate(
									.buf_in(MDR), 
									.select(GateMDR), 
									.buf_out(MDR_buf));
	
	tristate_buffer PC_gate(
									.buf_in(PC_inc), 
									.select(GatePC), 
									.buf_out(PC_buf));

endmodule
