module tristate_buffer(input logic [15:0] buf_in, input logic select, output logic [15:0] buf_out);

assign buf_out = select ? buf_in : 16'bz;
endmodule