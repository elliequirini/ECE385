//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module game_state( input Reset, frame_clk,
					input [7:0] key,
					output logic [7:0] Sprite);
    

	 parameter [7:0] Q = 8'h14;
	 parameter [7:0] W = 8'h1a;
	 parameter [7:0] S = 8'h16;

	 logic [5:0] h, u, a;
   
	 enum logic [5:0] {Start, Check, Dead, Upset,
							 IdleH1, IdleH2, IdleH3, IdleH4, IdleH5, IdleH6, IdleH7, IdleH8,
							 IdleS1, IdleS2, IdleS3, IdleS4, IdleS5, IdleS6, IdleS7, IdleS8,
							 Feed, Feed1, Feed2, Feed3, Feed4, Feed5, Feed6, Feed7, Feed8, 
							 Pet, Pet1, Pet2, Pet3, Pet4, Pet5, Pet6, Pet7, Pet8} curr_state, next_state;
	 
    logic delay;
	 
	 
	 always_ff @ (posedge Reset or posedge frame_clk )
    begin
        if (Reset)
            curr_state = Start;
        else if(delay) 
            curr_state = next_state;
			else
				delay <= ~delay;
    end
    always_comb
	 begin
	 next_state = curr_state;
	
	 unique case (curr_state)
		Start:	next_state = Check;
		Check: 	begin
					if(h>=5 && u>=5 && a>=5)
						next_state = IdleH1;
					else if(h==0 || u==0 || a==0)
						next_state = Dead;
					else
						next_state = IdleS1;
					end
						
		IdleH1: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH2;
					end
						
		IdleH2: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH3;
					end
						
		IdleH3: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH4;
					end
		
		IdleH4: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH5;
					end
		
		IdleH5: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH6;
					end
		
		IdleH6: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH7;
					end
		
		IdleH7: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleH8;
					end
		
		IdleH8: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = Check;
					end
						
		IdleS1: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS2;
					end
						
		IdleS2: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS3;
					end
					
		IdleS3: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS4;
					end
						
		IdleS4: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS5;
					end
					
		IdleS4: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS5;
					end
					
		IdleS5: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS6;
					end
					
		IdleS6: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS7;
					end
		
		IdleS7: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = IdleS8;
					end
					
		IdleS8: 	begin
					if(key == Q)
						next_state = Feed;
					else if(key == W)
						next_state = Pet;
					else
						next_state = Check;
					end
						
		Feed: 	begin
					if(u<10)
						next_state = Feed1;
					else
						next_state = Upset;
					end
					
		Feed1:	next_state = Feed2;
		Feed2:	next_state = Feed3;
		Feed3:	next_state = Feed4;
		Feed4:	next_state = Feed5;
		Feed5:	next_state = Feed6;
		Feed6:	next_state = Feed7;
		Feed7:	next_state = Feed8;
		Feed8:	next_state = Check;
		
		Pet:		begin
					if(a<10)
						next_state = Pet1;
					else
						next_state = Upset;
					end
		
		Pet1:	next_state = Pet2;
		Pet2:	next_state = Pet3;
		Pet3:	next_state = Pet4;
		Pet4:	next_state = Pet5;
		Pet5:	next_state = Pet6;
		Pet6:	next_state = Pet7;
		Pet7:	next_state = Pet8;
		Pet8:	next_state = Check;
		
		Upset: next_state = Check;
		
		Dead: begin	
					if(key == S)
						next_state = Start;
					else
						next_state = Dead;
				end
	endcase
end

always_ff
begin 
	case (curr_state)
		Start:
			begin
				Sprite <= 8'h00; //ST (Neutral)
				h <= 1'd5;
				u <= 1'd5;
				a <= 1'd5;
			end
		Check:
			begin
				Sprite <= 8'h00; //ST (Neutral)
			end
		
		Upset:
			begin
				Sprite <= 8'h01; //D (Sad)
				h <= h-1;
			end
			
		Dead: Sprite <= 8'h01; //D (Sad)
		
		IdleH1: Sprite <= 8'ha1; //IH1;
		IdleH2: Sprite <= 8'ha2; //IH2;
		IdleH3: Sprite <= 8'ha3; //IH3;
		IdleH4: Sprite <= 8'ha4; //IH4;
		IdleH5: Sprite <= 8'ha5; //IH5;
		IdleH6: Sprite <= 8'ha6; //IH6;
		IdleH7: Sprite <= 8'ha7; //IH7;
		IdleH8:
			begin
				Sprite <= 8'ha8; //IH8;
				h <= h-1;
				u <= u-1;
				a <= a-1;
			end
		
		IdleS1: Sprite <= 8'hb1; //IS1;
		IdleS2: Sprite <= 8'hb2; //IS2;
		IdleS3: Sprite <= 8'hb3; //IS3;
		IdleS4: Sprite <= 8'hb4; //IS4;
		IdleS5: Sprite <= 8'hb5; //IS5;
		IdleS6: Sprite <= 8'hb6; //IS6;
		IdleS7: Sprite <= 8'hb7; //IS7;
		IdleS8: 
			begin
				Sprite <= 8'hb8; //IS4;
				h <= h-1;
				u <= u-1;
				a <= a-1;
			end
			
		Feed:  Sprite <= 8'h00;  //Neutral
		Feed1: Sprite <= 8'hc1; //F1;
		Feed2: Sprite <= 8'hc2; //F2;
		Feed3: Sprite <= 8'hc3; //F3;
		Feed4: Sprite <= 8'hc4; //F4;
		Feed5: Sprite <= 8'hc5; //F5;
		Feed6: Sprite <= 8'hc6; //F6;
		Feed7: Sprite <= 8'hc7; //F7;
		Feed8: 
			begin
				Sprite <= 8'hc8; //F8;
				if(h<10)
					h <= h+1;
				else
					h <= h-1;
				u <= u+1;
				a <= a-1;
			end
			
		Pet:  Sprite <= 8'h00; //Neutral
		Pet1: Sprite <= 8'hd1; //P1;
		Pet2: Sprite <= 8'hd2; //P2;
		Pet3: Sprite <= 8'hd3; //P3;
		Pet4: Sprite <= 8'hd4; //P4;
		Pet5: Sprite <= 8'hd5; //P5;
		Pet6: Sprite <= 8'hd6; //P6;
		Pet7: Sprite <= 8'hd7; //P7;
		Pet8: 
			begin
				Sprite <= 8'hd8; //P8;
				if(h<10)
					h <= h+1;
				else
					h <= h-1;
				a <= a+1;
				u <= u-1;
			end
		
	endcase
end
//assign Sprite = curr_sprite;
endmodule	
		  