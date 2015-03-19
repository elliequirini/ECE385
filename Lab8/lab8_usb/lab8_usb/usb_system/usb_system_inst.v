	usb_system u0 (
		.clk_clk           (<connected-to-clk_clk>),           //           clk.clk
		.reset_reset_n     (<connected-to-reset_reset_n>),     //         reset.reset_n
		.sdram_wire_addr   (<connected-to-sdram_wire_addr>),   //    sdram_wire.addr
		.sdram_wire_ba     (<connected-to-sdram_wire_ba>),     //              .ba
		.sdram_wire_cas_n  (<connected-to-sdram_wire_cas_n>),  //              .cas_n
		.sdram_wire_cke    (<connected-to-sdram_wire_cke>),    //              .cke
		.sdram_wire_cs_n   (<connected-to-sdram_wire_cs_n>),   //              .cs_n
		.sdram_wire_dq     (<connected-to-sdram_wire_dq>),     //              .dq
		.sdram_wire_dqm    (<connected-to-sdram_wire_dqm>),    //              .dqm
		.sdram_wire_ras_n  (<connected-to-sdram_wire_ras_n>),  //              .ras_n
		.sdram_wire_we_n   (<connected-to-sdram_wire_we_n>),   //              .we_n
		.keycode_export    (<connected-to-keycode_export>),    //       keycode.export
		.usb_DATA          (<connected-to-usb_DATA>),          //           usb.DATA
		.usb_ADDR          (<connected-to-usb_ADDR>),          //              .ADDR
		.usb_RD_N          (<connected-to-usb_RD_N>),          //              .RD_N
		.usb_WR_N          (<connected-to-usb_WR_N>),          //              .WR_N
		.usb_CS_N          (<connected-to-usb_CS_N>),          //              .CS_N
		.usb_RST_N         (<connected-to-usb_RST_N>),         //              .RST_N
		.usb_INT           (<connected-to-usb_INT>),           //              .INT
		.sdram_out_clk_clk (<connected-to-sdram_out_clk_clk>), // sdram_out_clk.clk
		.usb_out_clk_clk   (<connected-to-usb_out_clk_clk>)    //   usb_out_clk.clk
	);

