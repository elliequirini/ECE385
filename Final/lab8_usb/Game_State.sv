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
					output logic [7:0] Sprite,
					output logic [5:0] debug_state,
					output int debug_h, debug_u, debug_a);
    

	 parameter [7:0] Q = 8'h14;
	 parameter [7:0] W = 8'h1a;
	 parameter [7:0] S = 8'h16;

	 int h, u, a;
	 int frame_count;
   
	 enum logic [5:0] {Start,  
							Check, 
							Dead, 
							Upset,
							IdleH1, IdleH2, IdleH3, IdleH4, IdleH5, IdleH6, IdleH7, IdleH8,
							 IdleS1, IdleS2, IdleS3, IdleS4, IdleS5, IdleS6, IdleS7, IdleS8,
							 Feed, Feed1, //Feed2, Feed3, Feed4, Feed5, Feed6, Feed7, Feed8, 
							 Pet, Pet1 //Pet2, Pet3, Pet4, Pet5, Pet6, Pet7, Pet8
							 } curr_state, next_state;
	 
 	 
	 
	 always_ff @ (posedge Reset or posedge frame_clk )
    begin
        if (Reset)
            curr_state = Start;
        else
            curr_state = next_state;
    end
	 
    always_ff @ (posedge frame_clk)
	 begin
		 //next_state = curr_state;
		
		 unique case (curr_state)
			Start:	next_state = Check;
			Check: 	begin
							if(h>=5 && u>=5 && a>=5)
								next_state = IdleH1;
							else if(h==0 || u==0 || a==0)
								next_state = Dead;
							else
								begin
								frame_count = 0;
								next_state = IdleS1;
								end
						end
							
			IdleH1: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH2;														
								end
							else
								frame_count = frame_count + 1;
							
						end
							
			IdleH2: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH3;														
								end
							else
								frame_count = frame_count + 1;
							
						end
							
			IdleH3: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH4;														
								end
							else
								frame_count = frame_count + 1;
							
						end
			
			IdleH4: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH5;														
								end
							else
								frame_count = frame_count + 1;
							
						end
			
			IdleH5: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH6;														
								end
							else
								frame_count = frame_count + 1;
							
						end
			
			IdleH6: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH7;														
								end
							else
								frame_count = frame_count + 1;
							
						end
			
			IdleH7: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleH8;														
								end
							else
								frame_count = frame_count + 1;
							
						end
			
			IdleH8: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = Check;														
								end
							else
								frame_count = frame_count + 1;
							
						end
							
			IdleS1: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS2;														
								end
							else
								frame_count = frame_count + 1;
							
						end
							
			IdleS2: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS3;														
								end
							else
								frame_count = frame_count + 1;
							
						end
						
			IdleS3: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS4;														
								end
							else
								frame_count = frame_count + 1;
							
						end
							
			IdleS4: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS5;														
								end
							else
								frame_count = frame_count + 1;
							
						end
						
			IdleS4: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS5;														
								end
							else
								frame_count = frame_count + 1;
							
						end
						
			IdleS5: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS6;														
								end
							else
								frame_count = frame_count + 1;
							
						end
						
			IdleS6: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS7;														
								end
							else
								frame_count = frame_count + 1;
							
						end
			
			IdleS7: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = IdleS8;														
								end
							else
								frame_count = frame_count + 1;
							
						end
						
			IdleS8: 	begin
						
							if(key == Q)
								next_state = Feed;
							else if (key == W)
								next_state = Pet;
							else if(frame_count >= 20)
								begin
								frame_count = 0;
								next_state = Check;														
								end
							else
								frame_count = frame_count + 1;
							
						end
							
			Feed: 	begin
							//if (key == W)
								//next_state = Pet;
							if(frame_count >= 20)
								begin
									if(u<=9)
										begin
										frame_count = 0;
										next_state = Feed1;
										end
									else
										begin
										frame_count = 0;
										next_state = Upset;
										end
								end
							else
								frame_count = frame_count + 1;
						end
						
			//Feed1:	begin
			//				if (key == W)
			//					next_state = Pet;
			//				else if(frame_count >= 20)
			//					begin
			//					frame_count = 0;
			//					next_state = Feed2;														
			//					end
			//				else
			//					frame_count = frame_count + 1;
			//			end
			//Feed2:	begin
			//			if (key == W)
			//				next_state = Pet;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Feed3;						
			//				end
			//			else
			//				if(key == Q)
			//					next_state = Feed;
			//				else if (key == W)
			//					next_state = Pet;
			//				else
			//					frame_count = frame_count + 1;
			//		end
			//Feed3:	begin
			//			if (key == W)
			//				next_state = Pet;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Feed4;						
			//				end
			//			else
			//				if(key == Q)
			//					next_state = Feed;
			//				else if (key == W)
			//					next_state = Pet;
			//				else
			//					frame_count = frame_count + 1;
			//		end
			//Feed4:	begin
			//			if (key == W)
			//				next_state = Pet;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Feed5;						
			//				end
			//			else
			//				if(key == Q)
			//					next_state = Feed;
			//				else if (key == W)
			//					next_state = Pet;
			//				else
			//					frame_count = frame_count + 1;
			//		end
			//Feed5:	begin
			//			if (key == W)
			//				next_state = Pet;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Feed6;						
			//				end
			//			else
			//				if(key == Q)
			//					next_state = Feed;
			//				else if (key == W)
			//					next_state = Pet;
			//				else
			//					frame_count = frame_count + 1;
			//		end
			//Feed6:	begin
			//			if (key == W)
			//				next_state = Pet;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Feed7;						
			//				end
			//			else
			//				if(key == Q)
			//					next_state = Feed;
			//				else if (key == W)
			//					next_state = Pet;
			//				else
			//					frame_count = frame_count + 1;
			//		end
			//Feed7:	begin
			//			if (key == W)
			//				next_state = Pet;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Feed8;						
			//				end
			//			else
			//				if(key == Q)
			//					next_state = Feed;
			//				else if (key == W)
			//					next_state = Pet;
			//				else
			//					frame_count = frame_count + 1;
			//		end
			Feed1:	begin
						//if (key == W)
							//next_state = Pet;
						if(frame_count >= 20)
							begin
							frame_count = 0;
							next_state = Check;						
							end
						else
							frame_count = frame_count + 1;
					end
			
			Pet:		begin
							//if(key == Q)
								//next_state = Feed;
							if(frame_count >= 20)
								begin
									if(a<=9)
										begin
										frame_count = 0;
										next_state = Pet1;
										end
									else
										begin
										frame_count = 0;
										next_state = Upset;
										end
								end
							else
								frame_count = frame_count + 1;
						
						end
			
			//Pet1:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet2;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			//Pet2:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet3;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			//Pet3:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet4;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			//Pet4:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet5;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			//Pet5:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet6;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			//Pet6:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet7;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			//Pet7:	begin
			//			if(key == Q)
			//				next_state = Feed;
			//			else if(frame_count >= 20)
			//				begin
			//				frame_count = 0;
			//				next_state = Pet8;						
			//				end
			//			else
			//				frame_count = frame_count + 1;
			//		end
			Pet1:	begin
						//if(key == Q)
							//next_state = Feed;
						if(frame_count >= 20)
							begin
							frame_count = 0;
							next_state = Check;						
							end
						else
							frame_count = frame_count + 1;
					end
			
			Upset: begin
						if(frame_count >= 20)
							begin
							frame_count = 0;
							next_state = Check;						
							end
						else
							frame_count = frame_count + 1;
					end
			
			Dead: begin	
						if(key == S)
							next_state = Start;
						else
							next_state = Dead;
					end
		endcase
	end


	always_ff @ (posedge frame_clk)
	begin 
		case (curr_state)
			Start:
				begin
					Sprite <= 8'h00; //ST (Neutral)
					h <= 5;
					u <= 5;
					//a <= 5;
				end
			Check:
				begin
					Sprite <= 8'h00; //ST (Neutral)
				end
			
			Upset:
				begin
					Sprite <= 8'h01; //D (Sad)
					if(frame_count == 0)
						h <= h-1;
				end
				
			Dead: Sprite <= 8'h01; //D (Sad)
			
			IdleH1: begin
					Sprite <= 8'ha1; //IH1;
					end
			IdleH2: begin
					Sprite <= 8'ha2; //IH2;
					end
			IdleH3: begin
					Sprite <= 8'ha3; //IH3;
					end
			IdleH4: begin
					Sprite <= 8'ha4; //IH4;
					end
			IdleH5: begin
					Sprite <= 8'ha5; //IH5;
					end
			IdleH6: begin
					Sprite <= 8'ha6; //IH6;
					end
			IdleH7: begin
					Sprite <= 8'ha7; //IH7;
					end
			IdleH8:
				begin
					Sprite <= 8'ha8; //IH8;
					if (frame_count == 0) begin
						h <= h-1;
						u <= u-1;
						//a <= a-1;
					end
				end
			
			IdleS1: begin
					Sprite <= 8'hb1; //IS1;
					end
			IdleS2: begin
					Sprite <= 8'hb2; //IS2;
					end
			IdleS3: begin
					Sprite <= 8'hb3; //IS3;
					end
			IdleS4: begin
					Sprite <= 8'hb4; //IS4;
					end
			IdleS5: begin
					Sprite <= 8'hb5; //IS5;
					end
			IdleS6: begin
					Sprite <= 8'hb6; //IS6;
					end
			IdleS7: begin
					Sprite <= 8'hb7; //IS7;
					end
			IdleS8: 
				begin
					Sprite <= 8'hb8; //IS4;
					if (frame_count == 0) begin
						h <= h-1;
						u <= u-1;
						//a <= a-1;
					end
				end
				
			Feed:  begin
					Sprite <= 8'h00;  //Neutral
					end
			//Feed1: begin
			//		Sprite <= 8'hc1; //F1;
			//		end
			//Feed2: begin
			//		Sprite <= 8'hc2; //F2;
			//		end
			//Feed3: begin
			//		Sprite <= 8'hc3; //F3;
			//		end
			//Feed4: begin
			//		Sprite <= 8'hc4; //F4;
			//		end
			//Feed5: begin
			//		Sprite <= 8'hc5; //F5;
			//		end
			//Feed6: begin
			//		Sprite <= 8'hc6; //F6;
			//		end
			//Feed7: begin
			//		Sprite <= 8'hc7; //F7;
			//		end
			Feed1: 
				begin
					Sprite <= 8'hc1; //F8;
					if (frame_count == 0) begin
						h <= h+1;
						u <= u+1;
					end
				end
				
			//Pet:  Sprite <= 8'h00; //Neutral
			//Pet1: begin
			//		Sprite <= 8'hd1; //P1;
			//		end
			//Pet2: begin
			//		Sprite <= 8'hd2; //P2;
			//		end
			//Pet3: begin
			//		Sprite <= 8'hd3; //P3;
			//		end
			//Pet4: begin
			//		Sprite <= 8'hd4; //P4;
			//		end
			//Pet5: begin
			//		Sprite <= 8'hd5; //P5;
			//		end
			//Pet6: begin
			//		Sprite <= 8'hd6; //P6;
			//		end
			//Pet7: begin
			//		Sprite <= 8'hd7; //P7;
			//		end
			//Pet1: 
			//	begin
			//		Sprite <= 8'hd1; //P8;
			//		if (frame_count == 0) begin
			//			h <= h+1;
			//			a <= a+1;
			//		end
			//	end
			
		endcase
	end

	assign debug_state = curr_state;
	assign debug_h = h;
	assign debug_u = u;
	assign debug_a = a;

	//assign Sprite = curr_sprite;
endmodule	
