
module usb_system (
	clk_clk,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	keycode_export,
	usb_DATA,
	usb_ADDR,
	usb_RD_N,
	usb_WR_N,
	usb_CS_N,
	usb_RST_N,
	usb_INT,
	sdram_out_clk_clk,
	usb_out_clk_clk);	

	input		clk_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[7:0]	keycode_export;
	inout	[15:0]	usb_DATA;
	output	[1:0]	usb_ADDR;
	output		usb_RD_N;
	output		usb_WR_N;
	output		usb_CS_N;
	output		usb_RST_N;
	input		usb_INT;
	output		sdram_out_clk_clk;
	output		usb_out_clk_clk;
endmodule
