module carry_select (input		Clk,
											Reset,
											Load_B,
											Run,
						input	[15:0]	Switches,
						output			Overflow,
						output[6:0]		Ahex0,
											Ahex1,
											Ahex2,
											Ahex3,
											Bhex0,
											Bhex1,
											Bhex2,
											Bhex3,
						output[15:0]   Sum);
						
						
	logic Reset_h, LoadB_h, Run_h;
	logic Ld_B;
	logic [16:0] R, nR;
	
	always_comb
	begin
		Reset_h = ~Reset;
		LoadB_h = ~Load_B;
		Run_h = ~Run;
	end
	
	
	reg_17			  Reg(
								.*,
								.Clk,
								.Reset(Reset_h),
								.Ld_B,
								.Of1(nR[16]),
								.Run(Run_h),
								.Data_In(Switches),
								.Data_Calc(nR[15:0]),
								.Overflow(R[16]),
								.Data_Out(R[15:0]));


	carry_select16		 csa(
								.*,
								.A(Switches[15:0]),
								.B(R[15:0]),
								.c_in(Overflow),
								.S(nR[15:0]),
								.c_out(nR[16]));

	control			  Ctrl(
								.*,
								.Clk,
								.Run(Run_h),
								.Reset(Reset_h),
								.Load_B(LoadB_h),
								.Ld_B);	

								
	HexDriver        HexA0 (
                        .In0(Switches[3:0]),
                        .Out0(Ahex0) );
	HexDriver        HexA1 (
                        .In0(Switches[7:4]),
                        .Out0(Ahex1) );
	HexDriver        HexA2 (
                        .In0(Switches[11:8]),
                        .Out0(Ahex2) );

	HexDriver        HexA3 (
                        .In0(Switches[15:12]),
                        .Out0(Ahex3) );
								
			
	
	HexDriver        HexB0 (
                        .In0(R[3:0]),
                        .Out0(Bhex0) );
	HexDriver        HexB1 (
                        .In0(R[7:4]),
                        .Out0(Bhex1) );
	HexDriver        HexB2 (
                        .In0(R[11:8]),
                        .Out0(Bhex2) );
	HexDriver        HexB3 (
                        .In0(R[15:12]),
                        .Out0(Bhex3) );
								
	always_comb
	begin
		Sum <= R[15:0];
		Overflow <= R[16];
	end	

						
endmodule
