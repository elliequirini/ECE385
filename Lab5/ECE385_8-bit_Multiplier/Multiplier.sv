module Multiplier( input logic  Clk,     		// Internal
                                Reset,   		// Push button 0
                                ClearA_LoadB,// Push button 1
                                Run,	  		// Push button 2
                  input  [7:0]  S,     		// input data from switches
                  
						output logic  X,				// sign extend bit
						output [7:0]  Aval,			// value of A
										  Bval,			// value of B
                  output [6:0]  AhexL,			// output values for hex displays
                                AhexU,
										  BhexL,
										  BhexU);

										 
	logic Reset_h, ClearA_LoadB_h, Run_h; 
	logic Shift_En, Add, Sub, fn; 
	logic Add_Out, X_Out, A_Out, B_Out;
	logic Clr_Ld, Reset_c;
	logic [7:0] A, B;
	logic [8:0] Sum, New_A;
	
	always_comb
    begin
        Reset_h = ~Reset;
        ClearA_LoadB_h = ~ClearA_LoadB;
        Run_h = ~Run;
    end

	ADD_SUB9 Adder(.*,
						.fn(Sub),
						.S(Sum));
	
	A_logic 		A1(.*,
						.A_In(Sum),
						.New_A);
	
	Dreg	  X_unit(.*,
						.Load(Shift_En),
						.Reset(Reset_c),
						.D(New_A[8]),
						.Q(X_Out));
						
	reg_8		Reg_A(.*,
						.Reset(Reset_c),
						.Shift_In(X_Out),
						.Load(Clr_Ld),
						.Data_In(New_A[7:0]),
						.Shift_Out(A_Out),
						.Data_Out(A));
					
	reg_8		Reg_B(.*,
						.Reset(Reset_c),
						.Shift_In(A_Out),
						.Load(Clr_Ld),
						.Data_In(S),
						.Shift_Out(B_Out),
						.Data_Out(B));	
						
	Control	control_unit(.*,
						.Reset(Reset_h),
						.ClearA_LoadB(ClearA_LoadB_h),
						.Run(Run_h),
						.M (B_Out),
						.Shift_En, 
						.Clr_Ld, 
						.Add, 
						.Sub, 
						.Reset_c);

	HexDriver HexAL (
                  .In0(A[3:0]),
                  .Out0(AhexL) );
	 HexDriver HexAU (
                  .In0(A[7:4]),
                  .Out0(AhexU) );
	 HexDriver HexBL (
                  .In0(B[3:0]),
                  .Out0(BhexL) );
	 HexDriver HexBU (
                  .In0(B[7:4]),
                  .Out0(BhexU) );

endmodule