module Multiplier(input logic   Clk,     		// Internal
                                Reset,   		// Push button 0
                                ClearA_LoadB,// Push button 1
                                Run,	  		// Push button 2
                  input  [7:0]  S,     		// input data from switches
						output logic  X,				// sign extend bit
										  M,				// DEBUG
						output [7:0]  Aval,    		// DEBUG
                                Bval,    		// DEBUG
                  output [6:0]  AhexL,			// output values for hex displays
                                AhexU,
										  BhexL,
										  BhexU);
										 

										  
	logic A_Out, B_Out;
	logic [7:0] A, B, New_A;
	logic [8:0] Sum;
	
	// control variables
	logic Shift_En, Clr_Ld, Reset_c, Add, Fn;
	
	logic Reset_h, ClearA_LoadB_h, Run_h; 
	always_comb
	begin
		Reset_h = ~Reset;
		ClearA_LoadB_h = ~ClearA_LoadB;
		Run_h = ~Run;
	end

	ADD_SUB9 Adder(.*,
						.A,
						.B(S),
						.Fn,
						.S(Sum));
						
	Control	control_unit(.*,
						.Reset(Reset_h),
						.ClearA_LoadB(ClearA_LoadB_h),
						.Run(Run_h),
						.M (B_Out),
						.Shift_En, 
						.Clr_Ld, 
						.Add, 
						.Fn, 
						.Reset_c);
						
	Dreg     dreg1(.*,
						.Clk,
						.Load(Add),
						.Reset(Reset_c | Clr_Ld),
						.D(Sum[8]),
						.Q(X));
						
	reg_8		Reg_A(.*,
						.Reset(Reset_c | Clr_Ld),
						.Shift_In(X),
						.Load(Add),
						.Data_In(Sum[7:0]),
						.Shift_Out(A_Out),
						.Data_Out(A));
					
	reg_8		Reg_B(.*,
						.Reset(Reset_c),
						.Shift_In(A_Out),
						.Load(Clr_Ld),
						.Data_In(S),
						.Shift_Out(B_Out),
						.Data_Out(B));	
						
	
	HexDriver HexAL (
						.In0(A[3:0]),
                  .Out0(AhexL));
	HexDriver HexAU (
                  .In0(A[7:4]),
                  .Out0(AhexU));
	HexDriver HexBL (
                  .In0(B[3:0]),
                  .Out0(BhexL));
	HexDriver HexBU (
                  .In0(B[7:4]),
                  .Out0(BhexU));
						
	assign Aval = A;
	assign Bval = B;
	assign M = B_Out;
						
endmodule
