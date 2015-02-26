module LC3_Processor(input logic   	Clk,     	// Internal
												Reset,   	// Push button 0
												Run,			// Push button 1
												Continue,	// Push button 2
												ContinueIR,
                  //input wire [15:0]	S,     		// input data from switches
                  output [11:0] 		LED,
                  output logic [6:0] HEX0,
												HEX1,
												HEX2,
												HEX3,
						output logic [15:0] IR);
						

	logic Reset_h, Run_h, Continue_h, ContinueIR_h;
	logic l1,l2,l3,l4,l5,l6,l7,l8,l9,l10;
	wire [19:0] S;
	wire [15:0] IO;
	wire [15:0] IR_out;
	
	
	always_comb
	begin
		Reset_h = ~Reset;
		Continue_h = ~Continue;
		ContinueIR_h = ~ContinueIR;
		Run_h = ~Run;
	end
	
	LC3_CPU		cpu(	.Clk(Clk),
							.Reset(Reset_h),
							.Run(l1),
							.Continue(Continue_h),
							.ContinueIR(ContinueIR_h),
							.ADDR(S[15:0]),
							.Data_in(IO),
							.Data_out(IR_out),
							.CE(l5),
							.UB(l6),
							.LB(l7),
							.OE(l8),
							.WE(l9));
							
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
						
	assign IR = IR_out;
						
endmodule 