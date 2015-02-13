module carry_ripple16 (input
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
						output[15:0]	Sum);
						
	logic Reset_h, LoadB_h, Run_h;
	logic Ld_B, Ofl, c;
	logic [15:0] new_Data, old_Data;
	
	always_comb
	begin
		Reset_h = ~Reset;
		LoadB_h = ~Load_B;
		Run_h = ~Run;
	end
	
	reg_17 				reg_unit (
									.*, 
									.Reset(Reset_h), 
									.Ld_B, 
									.Ofl(c),
									.Run(Run_h),
									.Data_In(new_Data),
									.Overflow(Overflow), 
									.Data_Out(old_Data));
			
	carry_ripple_unit	compute_unit (
									.*,
									.A(Switches),
									.B(old_Data),
									.c_in(Ofl),
									.S(Sum),
									.c_out(c));
									
	control         	control_unit (
									.*,
									.Reset(Reset_h),
									.Load_B(LoadB_h),
									.Run(Run_h),
									.Ld_B );														
									
	HexDriver        	HexA0 (
									.In0(new_Data[3:0]),
									.Out0(Ahex0) );
	HexDriver        	HexA1 (
									.In0(new_Data[7:4]),
									.Out0(Ahex1) );
	HexDriver        	HexA2 (
									.In0(new_Data[11:8]),
									.Out0(Ahex2) );
	HexDriver        	HexA3 (
									.In0(new_Data[15:12]),
									.Out0(Ahex3) );
	HexDriver        	HexB0 (
									.In0(old_Data[3:0]),
									.Out0(Bhex0) );
	HexDriver        	HexB1 (
									.In0(old_Data[7:4]),
									.Out0(Bhex1) );
	HexDriver        	HexB2 (
									.In0(old_Data[11:8]),
									.Out0(Bhex2) );
	HexDriver        	HexB3 (
									.In0(old_Data[15:12]),
									.Out0(Bhex3) );
									
	
	
endmodule