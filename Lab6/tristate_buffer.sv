module tristate_buffer(input [15:0] MDR_Data, input select, output [15:0] data);

assign data = select ? MDR_Data : 16'bz;
endmodule