module CPU(input logic		Clk,     		// Internal
									Reset,   		// Push button 0
									Run,				// Push button 1
									Continue,		// Push button 2

						output logic  CE, UB, LB, OE, WE,
                  output [11:0] LED,
						output [19:0] ADDR,
						inout [15:0]  Data);
			
						
	logic Reset_h, Run_h, Continue_h; 
	logic n, z, p;
	always_comb
	begin
		Reset_h = ~Reset;
		Continue_h = ~Continue;
		Run_h = ~Run;
	end
	
	//logic for ISDU
	logic [15:0] IR, MAR, MDR, PC_out, PC_inc, PC_buf;
	logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC;
	logic GatePC, GateMDR, GateALU, GateMARMUX;
	logic [1:0] PCMUX, DRMUX;
	logic SR1MUX, SR2MUX, ADDR1MUX, MARMUX;
	logic [1:0] ADDR2MUX, ALUK;   
	

	ISDU			Ctrl(
						.Clk,
						.Reset(Reset_h),
						.Run(Run_h),
						.Continue(Continue_h),
						.ContinueIR(Continue_h),
						.Opcode(IR[15:12]),
						.IR_5(IR[5]),
						
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
						.GateMARMUX,
						
						.PCMUX,
						.DRMUX,
						.SR1MUX,
						.SR2MUX,
						.ADDR1MUX,
						.ADDR2MUX,
						.MARMUX,
						.ALUK);

						
	NZP_Reg		NZP(.*, .Reset(Reset_h), .Load(LD_CC), .LV(Data));


	/******PC UNIT********** 
	CONDITIONS: PCMUX, LD_PC
	INPUTS: PC <- Data 
			  PC <- ALT_ADDR
			  PC <- PC+1
	OUTPUT: Data Bus <- PC
	***********************/ 
	logic [15:0] ALT_ADDR;
	MUX_16b31		PC_MUX(	 .IN_0(PC_inc), 
									 .IN_1(ALT_ADDR), 
									 .IN_2(Data), 
									 .SEL(PCMUX), 
									 .OUT(PC_buf));
	
	reg16				regPC(	 .Clk, 
									 .Load(LD_PC), 
									 .Data_In(PC_buf), 
									 .Data_Out(PC_out), 
									 .Reset(Reset_h));
								
	IncPC 			NextPC(	 .PC(PC_out),
									 .PC_out(PC_inc));
					
	tristate_buffer PC_gate( .buf_in(PC_out), 
									 .select(GatePC), 
									 .buf_out(Data));
	
	
	/******REGISTER & ARITHMETIC UNIT********** 
	CONDITIONS: LD_REG, IR[5], ALUK, GateALU
	INPUTS: DR <- Data 
			  SR1, SR2, SEXT(IR[4:0])
	OUTPUT: Data Bus <- ALU
	******************************************/
	logic [15:0] SR1, SR2, SR2_mux, ALU_out, IMM;
	logic [2:0] SR1_IN;
	
	MUX_3b21 		SR1MUXX(.IN_0(IR[8:6]),
									.IN_1(IR[11:9]),
									.SEL(SR1MUX),
									.OUT(SR1_IN));
	
	REG_FILE			Reg_File( .*,
									 .BUS(Data), 
									 .DR(IR[11:9]), 
									 .SR1(SR1_IN), 
									 .SR2(IR[2:0]), 
									 .LD_REG,
									 .SR1_OUT(SR1), 
									 .SR2_OUT(SR2));
									 
	SEXT_516 		SEXT0(.IN(IR[4:0]), .OUT(IMM));
									 
	MUX_16b21		SR2MUXX(	 .IN_0(SR2),
									 .IN_1(IMM),
									 .SEL(IR[5]),
									 .OUT(SR2_mux));
									 
	ALU_16			ALU(		 .A_In(SR1), 
									 .B_In(SR2_mux), 
									 .F(ALUK),
									 .F_A_B(ALU_out));
			
	tristate_buffer ALU_gate(
									.buf_in(ALU_out), 
									.select(GateALU), 
									.buf_out(Data));
	
	
	/**** ERRTHING ELSE ****/
	logic [15:0] IMM1, IMM2, IMM3, IMM4, ADDR1_OUT, ADDR2_OUT, MARMUX_buf;
	SEXT_1116 		SEXT1(.IN(IR[10:0]), .OUT(IMM1));
	SEXT_916 		SEXT2(.IN(IR[8:0]), .OUT(IMM2));
	SEXT_616 		SEXT3(.IN(IR[5:0]), .OUT(IMM3));
	ZEXT_816			ZEXT1(.IN(IR[7:0]), .OUT(IMM4));
	
	MUX_16b41 		ADDR2MUXX(.Clk,
									.IN_0(IMM1),
									.IN_1(IMM2),
									.IN_2(IMM3),
									.IN_3(16'b0),
									.SEL(ADDR2MUX),
									.OUT(ADDR2_OUT));
									
	MUX_16b21		ADDR1MUXX(.IN_0(SR1),
									.IN_1(PC),
									.SEL(ADDR1MUX),
									.OUT(ADDR1_OUT));
	
	adder 			ADDIT(.in1(ADDR1_OUT),
								.in2(ADDR2_OUT),
								.out(ALT_ADDR));
	
	MUX_16b21 		MARMUXX(.IN_0(IMM4),
									.IN_1(ALT_ADDR),
									.SEL(MARMUX),
									.OUT(MARMUX_buf));
									
	tristate_buffer MARMUX_GATE(
									.buf_in(MARMUX_buf), 
									.select(GateMARMUX), 
									.buf_out(Data));
									
	
	//IR UNIT
	reg16			regIR(.Clk, .Load(LD_IR), .Data_In(Data), .Reset(Reset_h), .Data_Out(IR));
	reg16			regMAR(.Clk, .Load(LD_MAR), .Data_In(Data), .Data_Out(MAR), .Reset(Reset_h));
	reg16			regMDR(.Clk, .Load(LD_MDR), .Data_In(Data), .Data_Out(MDR), .Reset(Reset_h));
	tristate_buffer MDR_gate(
									.buf_in(MDR), 
									.select(GateMDR), 
									.buf_out(Data));
	

	assign ADDR = {4'b0, MAR};
	
	assign LED[9:0] = PC_out[9:0];
	assign LED[10] = ADDR1MUX;

endmodule
