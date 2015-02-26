module LC3_Processor(input logic   Clk,     	// Internal
                                Reset,   		// Push button 0
                                Run,			// Push button 1
                                Continue,		// Push button 2
                  input  [15:0] S,     		// input data from switches
						output logic  CE, UB, LB, OE, WE,
                  output [11:0] LED,
                  output [6:0]  HEX0,
										  HEX1,
										  HEX2,
										  HEX3,
						output [19:0] ADDR,
						inout [15:0]  Data);
						

	logic Reset_h, Run_h, Continue_h; 
	always_comb
	begin
		Reset_h = ~Reset;
		Continue_h = ~Continue;
		Run_h = ~Run;
	end
	
	logic [15:0] IR;
	
	reg16			regMAR();
	reg16			regMDR();
	reg16			regIR(
						.Data_Out(IR));
	reg16			regPC();
	
	ISDU			Ctrl(.Clk,
							.Reset(Reset_h),
							.Run(Run_h),
							.Continue(Continue_h),
							.ContinueIR(),
							);
							
	HexDriver HexAL (
						.In0(IR[3:0]),
                  .Out0(HEX0));
	HexDriver HexAU (
                  .In0(IR[7:4]),
                  .Out0(HEX1));
	HexDriver HexBL (
                  .In0(IR[11:8]),
                  .Out0(HEX2));
	HexDriver HexBU (
                  .In0(IR[15:12]),
                  .Out0(HEX3));
						
endmodule 