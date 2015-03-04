module CPU(input logic		Clk,     		// Internal
									Reset,   		// Push button 0
									Run,				// Push button 1
									Continue,		// Push button 2

						output logic  CE, UB, LB, OE, WE,
						output [3:0]  HEX0, HEX1, HEX2, HEX3,
                  output [11:0] LED,
						output [19:0] ADDR,
						inout wire [15:0]  Data);
			
						
	logic Reset_h, Run_h, Continue_h; 
	logic n, z, p;
	always_comb
	begin
		Reset_h = ~Reset;
		Continue_h = ~Continue;
		Run_h = ~Run;
	end
	
	//logic for ISDU
	logic [15:0] IR, MAR, MDR, PC_out, PC_inc;
	logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC;
	logic GatePC, GateMDR, GateALU, GateMARMUX;
	logic [1:0] PCMUX, DRMUX, SR1MUX;
	logic SR2MUX, ADDR1MUX,MARMUX;
	logic [1:0] ADDR2MUX, ALUK;
	logic Mem_CE, Mem_UB, Mem_LB, Mem_OE, Mem_WE;	            
	

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
						.GateMARMUX
						
						.PCMUX,
						.DRMUX,
						.SR1MUX,
						.SR2MUX,
						.ADDR1MUX,
						.ADDR2MUX,
						.MARMUX,
						.ALUK,
			
						.Mem_CE,
						.Mem_UB,
						.Mem_LB,
						.Mem_OE,
						.Mem_WE);

	NZP_Reg		NZP(.*, .Reset(Reset_h), .Load(0), .LV(0 /* regfile DR */ ));


	/******PC UNIT********** 
	CONDITIONS: PCMUX, LD_PC
	INPUTS: PC <- Data 
			  PC <- ALT_ADDR
			  PC <- PC+1
	OUTPUT: Data Bus <- PC
	***********************/
	MUX_16b31		PCMUX(	 .IN_0(Data), 
									 .IN_1(ALT_ADDR), 
									 .IN_2(PC_inc), 
									 .SEL(PCMUX), 
									 .OUT(PC_mux));
	
	reg16				regPC(	 .Clk, 
									 .Load(LD_PC), 
									 .Data_In(PC_mux), 
									 .Data_Out(PC_out), 
									 .Reset(Reset_h));
								
	IncPC 			NextPC(	 .PC(PC_out),
									 .PC_out(PC_inc));
					
	tristate_buffer PC_gate( .buf_in(PC_inc), 
									 .select(GatePC), 
									 .buf_out(Data));
	
	
	/******REGISTER & ARITHMETIC UNIT********** 
	CONDITIONS: LD_REG, IR[5], ALUK, GateALU
	INPUTS: DR <- Data 
			  SR1, SR2, SEXT(IR[4:0])
	OUTPUT: Data Bus <- ALU
	******************************************/
	wire [15:0] SR1, SR2, SR2_mux ALU_out;
	
	REG_FILE			Reg_File( .*
									 .BUS(Data), 
									 .DR(IR[11:9]), 
									 .SR1(IR[8:6]), 
									 .SR2(IR[2:0]), 
									 .LD_REG,
									 .SR1_OUT(SR1), 
									 .SR2_OUT(SR2));
									 
	MUX_16b21		SR2MUX(	 .IN_0(SR2),
									 .IN_1(IMM),
									 .SEL(IR[5]),
									 .OUT(SR2_mux));
									 
	ALU_16			ALU(		 .A_in(SR1), 
									 .B_in(SR2_mux), 
									 .F(ALUK),
									 .F_A_B(ALU_out));
			
	tristate_buffer ALU_gate(
									.buf_in(ALU_out), 
									.select(GateALU), 
									.buf_out(Data));
	
	
	//IR UNIT
	reg16			regIR(.Clk, .Load(LD_IR), .Data_In(Data), .Reset(Reset_h), .Data_Out(IR));
	
	
	
	
	
	
	
	
	
//?
	reg16			regMAR(.Clk, .Load(LD_MAR), .Data_In(PC_out), .Data_Out(MAR), .Reset(Reset_h));
	reg16			regMDR(.Clk, .Load(LD_MDR), .Data_In(Data), .Data_Out(MDR), .Reset(Reset_h));
	tristate_buffer MDR_gate(
									.buf_in(MDR), 
									.select(GateMDR), 
									.buf_out(Data));
	

	assign ADDR = {4'b0, MAR};
	assign HEX0 = IR[3:0];
	assign HEX1 = IR[7:4];
	assign HEX2 = IR[11:8];
	assign HEX3 = IR[15:12];
	
	assign LED = PC_out[11:0];

endmodule
