module NZP_Reg(input Clk, Reset, Load,
					input [15:0] LV,
					input [2:0] NZP,
					output logic n, z, p, BEN);
					
always_ff @ (posedge Clk or posedge Reset)
begin	
	if (Reset) begin
		 n <= 0;
		 z <= 0;
		 p <= 0;
		end
		
	else if (Load)	begin
			if(LV == 16'b0) begin
				n <= 0;
				z <= 1;
				p <= 0;
			end else if (LV[15] == 1) begin
				n <= 1;
				z <= 0;
				p <= 0;
			end else if (LV[15] == 0) begin
				n <= 0;
				z <= 0;
				p <= 1;
			end
		end
	else
		begin
			n <= n;
			z <= z;
			p <= p;
		end
end	

always_comb
begin
	if ((NZP & {n, z, p}) != 0)
		BEN <= 1;
	else
		BEN <= 0;
end

endmodule
