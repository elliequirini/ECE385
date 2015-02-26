module reg16 (input Clk, Reset, Shift_In, Load, Shift_En,
              input  [15:0]  Data_In,
              output        Shift_Out,
              output logic [15:0]  Data_Out);

    always_ff @ (posedge Clk)
    begin
	 
    if (Reset) 
        Data_Out <= 16'h0;
	 else if (Load)
        Data_Out <= Data_In;
    else if (Shift_En)
        Data_Out <= { Shift_In, Data_Out[15:1] };
    end
	
    assign Shift_Out = Data_Out[0];

endmodule
