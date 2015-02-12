module carry_ripple16(input [15:0]A,B input c_in, output [15:0] S, output c_out);

	wire [14:0] c;
	
		full_adder FA0(.x(A[0]), .y(B[0]),.z(c_in), .s(S[0]),.c(c[0]));
		full_adder FA1(.x(A[1]), .y(B[1]),.z(c[0]), .s(S[1]),.c(c[1]));
		full_adder FA2(.x(A[2]), .y(B[2]),.z(c[1]), .s(S[2]),.c(c[2]));
		full_adder FA3(.x(A[3]), .y(B[3]),.z(c[2]), .s(S[3]),.c(c[3]));
		full_adder FA4(.x(A[4]), .y(B[4]),.z(c[3]), .s(S[4]),.c(c[4]));
		full_adder FA5(.x(A[5]), .y(B[5]),.z(c[4]), .s(S[5]),.c(c[5]));
		full_adder FA6(.x(A[6]), .y(B[6]),.z(c[5]), .s(S[6]),.c(c[6]));
		full_adder FA7(.x(A[7]), .y(B[7]),.z(c[6]), .s(S[7]),.c(c[7]));
		full_adder FA8(.x(A[8]), .y(B[8]),.z(c[7]), .s(S[8]),.c(c[8]));
		full_adder FA9(.x(A[9]), .y(B[9]),.z(c[8]), .s(S[9]),.c(c[9]));
		full_adder FA10(.x(A[10]), .y(B[10]),.z(c[9]), .s(S[10]),.c(c[10]));
		full_adder FA11(.x(A[11]), .y(B[11]),.z(c[10]), .s(S[11]),.c(c[11]));
		full_adder FA12(.x(A[12]), .y(B[12]),.z(c[11]), .s(S[12]),.c(c[12]));
		full_adder FA13(.x(A[13]), .y(B[13]),.z(c[12]), .s(S[13]),.c(c[13]));
		full_adder FA14(.x(A[14]), .y(B[14]),.z(c[13]), .s(S[14]),.c(c[14]));
		full_adder FA15(.x(A[15]), .y(B[15]),.z(c[14]), .s(S[15]),.c(c_out));

endmodule