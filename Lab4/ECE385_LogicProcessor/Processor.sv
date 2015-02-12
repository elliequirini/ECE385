module Processor (input         Clk,     // Internal
                                Reset,   // Push button 0
                                LoadA,   // Push button 1
                                LoadB,   // Push button 2
                                Execute, // Push button 3
                  input  [7:0]  Din,     // input data
                  input  [2:0]  F,       // Function select
                  input  [1:0]  R,       // Routing select
                  output [3:0]  LED,     // DEBUG
                  output [7:0]  Aval,    // DEBUG
                                Bval,    // DEBUG
                  output [6:0]  AhexL,
                                AhexU,
                                BhexL,
                                BhexU);

    logic Reset_h, LoadA_h, LoadB_h, Execute_h;
    logic Ld_A, Ld_B, newA, newB, opA, opB, bitA, bitB, Shift_En,
	       F_A_B;
	 logic [7:0] A, B;
	 
    always_comb
    begin
        Reset_h = ~Reset;  // The push buttons are active low,
        LoadA_h = ~LoadA;  // but active-high logic is easier
        LoadB_h = ~LoadB;  // to work with
        Execute_h = ~Execute;
    end
	 
    register_unit    reg_unit (
                        .*, 
                        .Reset(Reset_h),
                        .Ld_A,
                        .Ld_B,
                        .Shift_En,
                        .D(Din),
                        .A_In(newA),
                        .B_In(newB),
                        .A_out(opA),
                        .B_out(opB),
                        .A(A),
                        .B(B) );
    compute          compute_unit (
                        .*,
                        .A_In(opA),
                        .B_In(opB),
                        .A_Out(bitA),
                        .B_Out(bitB),
                        .F_A_B );
    router           router (.*,
                        .A_In(bitA),
                        .B_In(bitB),
                        .A_Out(newA),
                        .B_Out(newB),
                        .F_A_B );
	 control          control_unit (
                        .*,
                        .Reset(Reset_h),
                        .LoadA(LoadA_h),
                        .LoadB(LoadB_h),
                        .Execute(Execute_h),
                        .Shift_En,
                        .Ld_A,
                        .Ld_B );
	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(AhexU) );
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(BhexL) );
	 HexDriver        HexBU (
                        .In0(B[7:4]),
                        .Out0(BhexU) );

	 assign Aval = A;
	 assign Bval = B;
	 assign LED = {Execute_h,LoadA_h,LoadB_h,Reset_h};
	 
endmodule
