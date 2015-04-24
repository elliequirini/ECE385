module BouncingBall( input logic Clk,
											Reset,
							input [7:0] keycode,
							output logic [7:0] Red, 
													 Green, 
													 Blue,
							output vs,
									 hs,
									 VGA_clk,
									 blank,
									 sync
							);

logic [9:0] DrawX, DrawY; //BallX, BallY, BallS;
logic [7:0] R,G,B;
logic frame_clk, pixel_clk;
//enum logic [4:0] {ST, IH1, IH2, IH3, IH4, IH5, IS1, IS2, IS3, IS4, IS5, F1, F2, F3, F4, P1, P2, P3, P4, D} curr_sprite;
logic [7:0] Sprite;

	
ball 					myBall( .Reset,
								  .frame_clk,
								  .key(keycode),
								  .Sprite
								  //.BallX,
								  //.BallY, 
								  //.BallS
								  );

color_mapper 	 myMapper( //.BallX,
								  //.BallY,
								  .DrawX, 
								  .DrawY, 
								  //.Ball_size(BallS),
								  .Sprite,
								  .Red(R), 
								  .Green(G), 
								  .Blue(B));

vga_controller myControl( .Clk,
								  .Reset,
								  .hs,       
								  .vs(frame_clk),       
								  .pixel_clk, // 25 MHz pixel clock output
								  .blank,     // Blanking interval indicator.  Active low.
								  .sync,      // Composite Sync signal.  Active low.  We don't use it in this lab,
								  .DrawX,     // horizontal coordinate
								  .DrawY);

assign vs = frame_clk;
assign Red = R;
assign Green = G;
assign Blue = B;
assign VGA_clk = pixel_clk;
												  
endmodule