module tristate_buffer(input [15:0] MDR_Data, input select, output [15:0] data);

always_comb
begin
	if(select)
		data <= MDR_Data;
	else
		data <= 16'bz;
end	
endmodule