module Processor (input				Clk,
											Reset,
											Load_B,
											Run,
						input	[15:0]	Switches,
						output			Overflow,
						output[6:0]		AhexL,
											AhexU,
											BhexL,
											BhexU,
						output[15:0]	Sum);
						
	logic Reset_h, LoadB_h, Run_h;
	logic Ld_B, Ofl;
	logic [15:0] new_Data;
	
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
									.Ofl, 
									.Data_In(New_Data),
									.Overflow(ofl), 
									.Data_Out(new_Data));
			
	carry_ripple16		compute_unit (
									.*,
									)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
