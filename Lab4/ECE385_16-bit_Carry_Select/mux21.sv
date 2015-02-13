module mux21 (input select, output q, input [1:0] d);

assign q = d[select];

endmodule

