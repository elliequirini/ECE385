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


module  ball ( input Reset, frame_clk,
					input [7:0] key,
					output logic [7:0] Sprite
               //output [9:0]  BallX, BallY, BallS 
					);
    
    /*logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis*/
	 parameter [7:0] Q = 8'h14;
	 parameter [7:0] W = 8'h1a;
	 parameter [7:0] S = 8'h16;

	 logic [5:0] h, u, a;
    //assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
	 enum logic [4:0] {Start, Check, IdleH1, IdleH2, IdleH3, IdleH4, IdleS1, IdleS2, IdleS3, IdleS4, Feed1, Feed2, Feed3, Feed4, Pet1, Pet2, Pet3, Pet4, Dead} curr_state, next_state;
	 //enum logic [4:0] {ST, IH1, IH2, IH3, IH4, IH5, IS1, IS2, IS3, IS4, IS5, F1, F2, F3, F4, P1, P2, P3, P4, D} curr_sprite;
	 
    always_ff @ (posedge Reset or posedge frame_clk )
    begin
        if (Reset)
            curr_state = Start;
        else 
            curr_state = next_state;
    end
    always_comb
	 begin
	 next_state = curr_state;
	
	 unique case (curr_state)
		Start:	next_state = Check;
		Check: 	if(h > 1'd5)
						next_state = IdleH1;
					else if(h == 0)
						next_state = Dead;
					else
						next_state = IdleS1;
						
		IdleH1: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = IdleH2;
						
		IdleH2: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = IdleH3;
						
		IdleH3: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = IdleH4;
		
		IdleH4: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = Check;
						
		IdleS1: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = IdleS2;
						
		IdleS2: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = IdleS3;
						
		IdleS3: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = IdleS4;
						
		IdleS4: 	if(key == Q)
						next_state = Feed1;
					else if(key == W)
						next_state = Pet1;
					else
						next_state = Check;
						
		Feed1:	next_state = Feed2;
		Feed2:	next_state = Feed3;
		Feed3:	next_state = Feed4;
		Feed4:	next_state = Check;
		
		Pet1:	next_state = Pet2;
		Pet2:	next_state = Pet3;
		Pet3:	next_state = Pet4;
		Pet4:	next_state = Check;
						
		Dead: 	if(key == S)
						next_state = Start;
	endcase

end

always_ff 
begin 
	case (curr_state)
		Start:
			begin
				Sprite <= 8'h00; //ST;
				h <= 1'd5;
				u <= 1'd5;
				a <= 1'd5;
			end
		Check:
			begin
				if(h > 5)
					Sprite <= 8'h06; //IH5;
				else
					Sprite <= 8'h0b; //IS5;
			end
		
		IdleH1: Sprite <= 8'h02; //IH1;
		IdleH2: Sprite <= 8'h03; //IH2;
		IdleH3: Sprite <= 8'h04; //IH3;
		IdleH4:
			begin
				Sprite <= 8'h05; //IH4;
				h <= h-1;
				u <= u-1;
				a <= a-1;
			end
		
		IdleS1: Sprite <= 8'h07; //IS1;
		IdleS2: Sprite <= 8'h08; //IS2;
		IdleS3: Sprite <= 8'h09; //IS3;
		IdleS4: 
			begin
				Sprite <= 8'ha; //IS4;
				h <= h-1;
				u <= u-1;
				a <= a-1;
			end
		
		Feed1: Sprite <= 8'h0c; //F1;
		Feed2: Sprite <= 8'h0d; //F2;
		Feed3: Sprite <= 8'h0e; //F3;
		Feed4: Sprite <= 8'h0f; //F4;
		
		Pet1: Sprite <= 8'h10; //P1;
		Pet2: Sprite <= 8'h11; //P2;
		Pet3: Sprite <= 8'h12; //P3;
		Pet4: Sprite <= 8'h13; //P4;
		
		Dead: Sprite <= 8'h14; //D;
		
	endcase
end
//assign Sprite = curr_sprite;
endmodule	
		  