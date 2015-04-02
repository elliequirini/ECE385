/*---------------------------------------------------------------------------
  --      aes_controller.sv                                                --
  --      Christine Chen                                                   --
  --      10/29/2013                                                       --
  --                                                                       --
  --      For use with ECE 298 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
// AES controller module

module aes_controller(
				input			 		clk,
				input					reset_n,
				input	[127:0]			msg_en,
				input	[127:0]			key,
				output  [127:0]			msg_de,
				input					io_ready,
				output					aes_ready
			    );

enum logic [1:0] {WAIT, COMPUTE, READY} state, next_state;
logic [15:0] counter;

AES aes0(clk, key[127:96], key[95:64], key[63:32], key[31:0], msg_de[127:96], msg_de[95:64], msg_de[63:32], msg_de[31:0]);
			  
always_ff @ (posedge clk, negedge reset_n) begin
	if (reset_n == 1'b0) begin
		state <= WAIT;
		counter <= 16'd0;
	end else begin
		state <= next_state;
		if (state == COMPUTE)
			counter <= counter + 1'b1;
	end
end

always_comb begin
	next_state = state;
	case (state)
		WAIT: begin
			if (io_ready)
				next_state = COMPUTE;
		end
		
		COMPUTE: begin
			if (counter == 16'd65535)
				next_state = READY;
		end
		
		READY: begin
		end
	endcase
end

always_comb begin
	aes_ready = 1'b0;
	case (state)
		WAIT: begin
			aes_ready = 1'b0;
		end
		
		COMPUTE: begin
			aes_ready = 1'b0;
		end
		
		READY: begin
			aes_ready = 1'b1;
		end
	endcase
end
			  
endmodule