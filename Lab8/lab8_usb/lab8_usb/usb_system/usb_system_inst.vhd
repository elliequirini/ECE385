	component usb_system is
		port (
			clk_clk           : in    std_logic                     := 'X';             -- clk
			reset_reset_n     : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr   : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba     : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n  : out   std_logic;                                        -- cas_n
			sdram_wire_cke    : out   std_logic;                                        -- cke
			sdram_wire_cs_n   : out   std_logic;                                        -- cs_n
			sdram_wire_dq     : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm    : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n  : out   std_logic;                                        -- ras_n
			sdram_wire_we_n   : out   std_logic;                                        -- we_n
			keycode_export    : out   std_logic_vector(7 downto 0);                     -- export
			usb_DATA          : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DATA
			usb_ADDR          : out   std_logic_vector(1 downto 0);                     -- ADDR
			usb_RD_N          : out   std_logic;                                        -- RD_N
			usb_WR_N          : out   std_logic;                                        -- WR_N
			usb_CS_N          : out   std_logic;                                        -- CS_N
			usb_RST_N         : out   std_logic;                                        -- RST_N
			usb_INT           : in    std_logic                     := 'X';             -- INT
			sdram_out_clk_clk : out   std_logic;                                        -- clk
			usb_out_clk_clk   : out   std_logic                                         -- clk
		);
	end component usb_system;

	u0 : component usb_system
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --           clk.clk
			reset_reset_n     => CONNECTED_TO_reset_reset_n,     --         reset.reset_n
			sdram_wire_addr   => CONNECTED_TO_sdram_wire_addr,   --    sdram_wire.addr
			sdram_wire_ba     => CONNECTED_TO_sdram_wire_ba,     --              .ba
			sdram_wire_cas_n  => CONNECTED_TO_sdram_wire_cas_n,  --              .cas_n
			sdram_wire_cke    => CONNECTED_TO_sdram_wire_cke,    --              .cke
			sdram_wire_cs_n   => CONNECTED_TO_sdram_wire_cs_n,   --              .cs_n
			sdram_wire_dq     => CONNECTED_TO_sdram_wire_dq,     --              .dq
			sdram_wire_dqm    => CONNECTED_TO_sdram_wire_dqm,    --              .dqm
			sdram_wire_ras_n  => CONNECTED_TO_sdram_wire_ras_n,  --              .ras_n
			sdram_wire_we_n   => CONNECTED_TO_sdram_wire_we_n,   --              .we_n
			keycode_export    => CONNECTED_TO_keycode_export,    --       keycode.export
			usb_DATA          => CONNECTED_TO_usb_DATA,          --           usb.DATA
			usb_ADDR          => CONNECTED_TO_usb_ADDR,          --              .ADDR
			usb_RD_N          => CONNECTED_TO_usb_RD_N,          --              .RD_N
			usb_WR_N          => CONNECTED_TO_usb_WR_N,          --              .WR_N
			usb_CS_N          => CONNECTED_TO_usb_CS_N,          --              .CS_N
			usb_RST_N         => CONNECTED_TO_usb_RST_N,         --              .RST_N
			usb_INT           => CONNECTED_TO_usb_INT,           --              .INT
			sdram_out_clk_clk => CONNECTED_TO_sdram_out_clk_clk, -- sdram_out_clk.clk
			usb_out_clk_clk   => CONNECTED_TO_usb_out_clk_clk    --   usb_out_clk.clk
		);

