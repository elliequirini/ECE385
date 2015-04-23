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

logic [9:0] BallX, BallY, BallS, DrawX, DrawY;
logic [7:0] R,G,B;
logic frame_clk, pixel_clk;

	
ball 					myBall( .Reset,
								  .frame_clk,
								  .key(keycode),
								  .BallX,
								  .BallY, 
								  .BallS);

color_mapper 	 myMapper( .BallX,
								  .BallY,
								  .DrawX, 
								  .DrawY, 
								  .Ball_size(BallS),
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