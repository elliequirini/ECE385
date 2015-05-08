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
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
    parameter [9:0] Ball_X_Center=400;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=250;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=270;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=600;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=50;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=400;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
	 //var [15:0] last_key_press = 0;

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; 
				Ball_X_Motion <= 10'd0; 
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
        
		  else
			begin 
				 case (key)
						8'h52: //up
							begin
								Ball_X_Motion <= 10'd0;
								if(Ball_Y_Motion > 0)
									Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1); 
								else
									Ball_Y_Motion <= Ball_Y_Step;
							end
						8'h51: //down
							begin
								Ball_X_Motion <= 10'd0;
								if(Ball_Y_Motion < 0)
									Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1); 
								else
									Ball_Y_Motion <= Ball_Y_Step;
							end
						8'h50: //left
							begin
								Ball_Y_Motion <= 10'd0;
								if(Ball_X_Motion > 0)
									Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1); 
								else
									Ball_X_Motion <= Ball_X_Step;
							end
						8'h4f: //right
							begin
								Ball_Y_Motion <= 10'd0;
								if(Ball_X_Motion < 0)
									Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1); 
								else
									Ball_X_Motion <= Ball_X_Step;
							end
				endcase
				
				 if ( ((Ball_Y_Pos + Ball_Size) >= Ball_Y_Max) )
				 begin
						Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.	
						Ball_X_Motion <= 10'd0;
				 end
				 else if(((Ball_Y_Pos - Ball_Size) <= Ball_Y_Min))
				 begin
					   Ball_Y_Motion <= Ball_Y_Step;
						Ball_X_Motion <= 10'd0;
				 end
				 if ( ((Ball_X_Pos + Ball_Size) >= Ball_X_Max) )
				 begin
						Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.	
						Ball_Y_Motion <= 10'd0;
				 end
				 else if(((Ball_X_Pos - Ball_Size) <= Ball_X_Min))
				 begin
					   Ball_X_Motion <= Ball_X_Step;
						Ball_Y_Motion <= 10'd0;
				 end
				 
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
