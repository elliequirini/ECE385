module PetGame(input logic Clk,
					 				Reset,
					input [7:0] keycode,
					output logic [7:0] Red, 
											 Green, 
											 Blue,
					output vs,
							 hs,
							 VGA_clk,
							 blank,
							 sync,
					output [5:0] debug,
					output int h,u,a);

logic [9:0] DrawX, DrawY,BallX,BallY,BallS;
logic [7:0] R,G,B;
logic frame_clk, pixel_clk;
logic [7:0] Sprite;
logic [5:0] debug_state;
int debug_h, debug_u, debug_a;

	
game_state 			myGame( .Reset,
								  .frame_clk,
								  .key(keycode),
								  .Sprite,
								  .debug_state,
								  .debug_h,
								  .debug_u,
								  .debug_a);

color_mapper 	 myMapper( .BallX,
								  .BallY,
								  .DrawX, 
								  .DrawY,
								  .Ball_size(BallS),
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
								  
ball 					myBall( .Reset,
								  .frame_clk,
								  .key(keycode),
								  .BallX,
								  .BallY, 
								  .BallS);

assign vs = frame_clk;
assign Red = R;
assign Green = G;
assign Blue = B;
assign VGA_clk = pixel_clk;
assign debug = debug_state;
assign h = debug_h;
assign u = debug_u;
assign a = debug_a;
												  
endmodule