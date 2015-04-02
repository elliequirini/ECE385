/*---------------------------------------------------------------------------
  --      AES.sv                                                           --
  --      Joe Meng                                                         --
  --      Fall 2013                                                        --
  --                                                                       --
  --      For use with ECE 298 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

// AES module interface with all ports, commented for Week 1
// module  AES ( input  [127:0]  Plaintext,
//                               Cipherkey,
//               input           Clk, 
//                               Reset,
//		 	  				     Run,
//               output [127:0]  Ciphertext,
//               output          Ready  );

// Partial interface for Week 1
// Splitting the signals into 32-bit ones for compatibility with ModelSim
	module  AES ( input clk,
			  input  [0:31]  Cipherkey_0, Cipherkey_1, Cipherkey_2, Cipherkey_3,
              output [0:31]  keyschedule_out_0, keyschedule_out_1, keyschedule_out_2, keyschedule_out_3 );					 
					 
	logic [0:1407] keyschedule;	 
					 
	KeyExpansion keyexpansion_0(
	.*, .Cipherkey({Cipherkey_0, Cipherkey_1, Cipherkey_2, Cipherkey_3}),
	.KeySchedule(keyschedule));
	
	assign {keyschedule_out_0, keyschedule_out_1, keyschedule_out_2, keyschedule_out_3} = keyschedule[1280:1407];				 
					 				 
endmodule