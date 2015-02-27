module IncPC(input[15:0] PC, output logic[15:0] PC_out);
assign PC_out = PC + 1'b1; 
endmodule
