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


module  color_mapper ( input Reset, frame_clk,
							  input        [9:0]  BallX, BallY, DrawX, DrawY, Ball_size, 
							  input 	logic	[7:0]	 Sprite,
							  input int hunger, happiness,
                       output logic [7:0]  Red, Green, Blue, 
							  output logic eaten, hurt);
    
    logic sprite_on;
	 logic ball_on;
	 logic Enemy_on;
	 logic Food_on;
	 logic bar1_on,bar2_on;
	 //int hunger, happiness;
	 //logic bell_on;
	 logic [7:0] TLX, TLY, BRX, BRY, color_number, R, G, B;
	 logic [7:0] SpriteX, SpriteY;
	 logic [9:0] Entity;
	 logic [7:0] S;
	 
	 int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	 
	 game_entity_table 	g_table (.Reset,
											.frame_clk,
										   .Entity,
											.BallX, 
											.BallY,
											.eaten,
											.hurt,
											.TLX, 
											.TLY, 
											.BRX, 
											.BRY);
	 
	 color_table 			c_table (.color(color_number),
											.DrawX,
											.R, 
											.G, 
											.B);
								  
	 sprite_table 			s_table (.Sprite(S),
											.DX(DrawX), 
											.DY(DrawY),
											.hunger,
											.happiness,
											.color(color_number));
	 
    always_ff
    begin
        if ( DrawX >= 500 && DrawX < 549 && DrawY >= 187 && DrawY < 240 )
            begin
				sprite_on = 1'b1;
				S = Sprite;
				end
        else 
            sprite_on = 1'b0;
		  if ( DrawX >= 500 && DrawX < 599 && DrawY >= 250 && DrawY < 274 )
            begin
				S = 8'haa;
				bar1_on = 1'b1;
				
				end
        else 
            bar1_on = 1'b0;
		  if ( DrawX >= 500 && DrawX < 599 && DrawY >= 300 && DrawY < 324 )
            begin
				S = 8'hbb;
				bar2_on = 1'b1;
				
				end
        else 
            bar2_on = 1'b0;
		  if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
		  Entity = 0;
		  if( DrawX >= 400 && DrawX < 405 && DrawY >= 100 && DrawY < 105 )
				Food_on = 1'b1;
		  else
				Food_on = 1'b0;
		  //Entity = 1;
		  //if( DrawX >= TLX && DrawX < BRX && DrawY >= TLY && DrawY < BRY )
			//	Bell_on = 1'b1;
		  //else
			//	Bell_on = 1'b0;
		  //Entity = 2;
		 // if( DrawX >= TLX && DrawX < BRX && DrawY >= TLY && DrawY < BRY )
			//	Enemy_on = 1'b1;
		  //else
			//	Enemy_on = 1'b0;
     end 
       
    always_ff
    begin:RGB_Display
        if (sprite_on == 1'b1 || bar1_on == 1'b1 || bar2_on == 1'b1) 
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
		  if(Food_on == 1'b1)
		  begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'hff;
		  end
		  if(Enemy_on == 1'b1)
		  begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
		  end
		  else if(sprite_on == 1'b0 && ball_on == 1'b0 && Food_on == 1'b0 && Enemy_on == 1'b0 && bar1_on == 1'b0 && bar2_on == 1'b0) 
        begin 
            Red = 8'h00;
            Green = 8'hff - DrawX[9:3];
            Blue = 8'h00 + DrawX[9:3]; 
        end      
    end 
    
endmodule
