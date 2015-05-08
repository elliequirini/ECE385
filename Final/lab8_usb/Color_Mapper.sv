//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0]  BallX, BallY, DrawX, DrawY, Ball_size, 
							  input 	logic	[7:0]	 Sprite,
                       output logic [7:0]  Red, Green, Blue );
    
    logic sprite_on;
	 logic ball_on;
	 logic [7:0] TLX, TLY, BRX, BRY, color_number, R, G, B;
	 logic [7:0] SpriteX, SpriteY;
	 
	 int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	 
	 game_entity_table 	g_table (.Sprite,
											.TLX, 
											.TLY, 
											.BRX, 
											.BRY);
	 
	 color_table 			c_table (.color(color_number),
											.R, 
											.G, 
											.B);
								  
	 sprite_table 			s_table (.Sprite,
											.DX(DrawX), 
											.DY(DrawY),
											.color(color_number));
	 
    always_comb
    begin
        if ( DrawX >= TLX && DrawX < BRX && DrawY >= TLY && DrawY < BRY ) 
            sprite_on = 1'b1;
        else 
            sprite_on = 1'b0;
		  if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
       
    always_ff
    begin:RGB_Display
        if (sprite_on == 1'b1) 
        begin 
				Red = R;
				Green = G;
				Blue = B;
        end       
        if(ball_on == 1'b1)
		  begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
		  end
		  else if(sprite_on == 1'b0 && ball_on == 1'b0) 
        begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff; 
        end      
    end 
    
endmodule
