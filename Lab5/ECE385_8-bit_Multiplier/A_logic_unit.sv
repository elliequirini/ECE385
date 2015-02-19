module A_logic (input Clr_Ld, input [8:0] A_In, output logic [8:0] New_A);

always_comb
begin
if(Clr_Ld)
	New_A <= 9'b000000000;
else
	New_A <= A_In;
end

endmodule