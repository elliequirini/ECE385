//-------------------------------------------------------------------------
//      Mem2IO.vhd                                                       --
//      Stephen Kempf                                                    --
//      Spring 2006                                                      --
//                                                                       --
//      Revised 03-15-2006                                               --
//              03-22-2007                                               --
//              07-26-2013                                               --
//              03-04-2014                                               --
//      Spring 2015 Distribution                                         --
//                                                                       --
//      For use with ECE 385 Experiment 6                                --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  Mem2IO ( 	input Clk, Reset,
					input [19:0]  A, 
					input CE, UB, LB, OE, WE,
					input [15:0]  Switches,
					inout [15:0] Data_CPU, Data_Mem,
					output [3:0]  HEX0, HEX1, HEX2, HEX3 );

	logic [15:0] hex_data;
   
	// You can either use the always block to assign Data_CPU using a signal
	logic  [15:0] Data_CPU_signal; 
	always_comb
    begin 
        Data_CPU_signal = 16'bZZZZZZZZZZZZZZZZ;
        if (WE  && ~OE) 
			if (A[15:0] == 16'hFFFF) 
				Data_CPU_signal = Switches;
			else 
				Data_CPU_signal = Data_Mem;
    end

	assign Data_CPU = Data_CPU_signal;
	
	// or simply assign Data_CPU using direct wire assignment
	// wire [15:0] Data_CPU_wire;
	// assign Data_CPU_wire = (A[15:0] == 16'hFFFF) ? Switches : Data_Mem;
	// assign Data_CPU = (WE && ~OE) ? Data_CPU_wire : 16'bZZZZZZZZZZZZZZZZ;
	
	assign Data_Mem = (~WE) ? Data_CPU : 16'bZZZZZZZZZZZZZZZZ;
   
	always_ff @ (posedge Clk or posedge Reset ) begin 
		if (Reset) 
			hex_data <= 16'h0000;
		else 
			if ( ~WE & (A[15:0] == 16'hFFFF) ) 
				hex_data <= Data_CPU;
    end
       
	assign HEX0 = hex_data[3:0];
	assign HEX1 = hex_data[7:4];
	assign HEX2 = hex_data[11:8];
	assign HEX3 = hex_data[15:12];

endmodule
