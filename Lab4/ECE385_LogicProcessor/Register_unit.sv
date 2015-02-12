module register_unit (input Clk, Reset, A_In, B_In, Ld_A, Ld_B, 
                            Shift_En,
                      input    [7:0]  D, 
                      output A_out, B_out, 
                      output  [7:0]  A,
                      output  [7:0]  B);


    reg_8  reg_A (.*, .Shift_In(A_In), .Load(Ld_A),
	               .Shift_Out(A_out), .Data_Out(A));
    reg_8  reg_B (.*, .Shift_In(B_In), .Load(Ld_B),
	               .Shift_Out(B_out), .Data_Out(B));

endmodule
