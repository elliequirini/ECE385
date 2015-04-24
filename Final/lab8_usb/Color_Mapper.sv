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


module  color_mapper ( input        [9:0]  DrawX, DrawY, //Ball_size, BallX, BallY,
							  input 	logic	[7:0]	 Sprite,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 assign DistX = DrawX - 320;
    assign DistY = DrawY - 240;
    assign Size = 4;
	 
	 //enum logic [4:0] {ST, IH1, IH2, IH3, IH4, IH5, IS1, IS2, IS3, IS4, IS5, F1, F2, F3, F4, P1, P2, P3, P4, D} curr_Sprite;
	  
	 //assign curr_Sprite = Sprite;
	 
    always_comb
    begin:Ball_on_proc
        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 1'b1)) 
        begin 
        unique case (Sprite)
				8'h01: begin //ST
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
					end
				8'h02: begin //IH1
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h03: begin //IH2
					Red = 8'h55;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h04: begin //IH3
					Red = 8'haa;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h05: begin //IH4
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h06: begin //IH5
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
					end
				8'h07: begin //IS1
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
					end
				8'h08: begin //IS2
					Red = 8'h55;
					Green = 8'h00;
					Blue = 8'hff;
					end
				8'h09: begin //Is3
					Red = 8'haa;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h0a: begin //IS4
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h0b: begin //IS5
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
					end
				8'h0c: begin //F1
					Red = 8'h33;
					Green = 8'h33;
					Blue = 8'h00;
					end
				8'h0d: begin //F2
					Red = 8'h77;
					Green = 8'h77;
					Blue = 8'h00;
					end
				8'h0e: begin //F3
					Red = 8'hcc;
					Green = 8'hcc;
					Blue = 8'h00;
					end
				8'h0f: begin //F4
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
					end
				8'h10: begin //P1
					Red = 8'h00;
					Green = 8'h33;
					Blue = 8'h33;
					end
				8'h11: begin //P2
					Red = 8'h00;
					Green = 8'h77;
					Blue = 8'h77;
					end
				8'h12: begin //P3
					Red = 8'h00;
					Green = 8'hcc;
					Blue = 8'hcc;
					end
				8'h13: begin //P4
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'hff;
					end
				8'h14: begin //D
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
					end
			endcase
        end       
        else 
        begin 
            Red = 8'h4f - DrawX[9:3];
            Green = 8'h00;
            Blue = 8'h44; 
        end      
    end 
    
endmodule
