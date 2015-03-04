module LC3_Processor(input logic Clk, Reset, Run, Continue,
							input logic [15:0] S,
							output logic CE, UB, LB, OE, WE,
							output logic[11:0] LED,
							output logic [6:0]  HEX0, HEX1, HEX2, HEX3,
							output logic[19:0] ADDR,
							inout wire [15:0]  Data);

	wire [15:0] BUS, Data_CPU, Data_Mem;
	logic [3:0] X0, X1, X2, X3;
	
	
							
	Mem2IO	Bridge(.*, .A(BUS), .Switches(S), .Data_CPU, .Data_Mem, .HEX0(X0), .HEX1(X1), .HEX2(X2), .HEX3(X3));
	
	tristate_buffer CPU_gate(
									.buf_in(MDR), 
									.select(GateMDR), 
									.buf_out(MDR_buf));
	
	
	CPU		mCPU(.*, .Data(Data_CPU));

	
	HexDriver HexAL (
						.In0(X0),
                  .Out0(HEX0));
	HexDriver HexAU (
                  .In0(X1),
                  .Out0(HEX1));
	HexDriver HexBL (
                  .In0(X2),
                  .Out0(HEX2));
	HexDriver HexBU (
                  .In0(X3),
                  .Out0(HEX3));

	//assign LED[9:0] = PC_out[9:0];
						
endmodule 









