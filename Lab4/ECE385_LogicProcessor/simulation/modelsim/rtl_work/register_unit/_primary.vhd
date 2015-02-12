library verilog;
use verilog.vl_types.all;
entity register_unit is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        A_In            : in     vl_logic;
        B_In            : in     vl_logic;
        Ld_A            : in     vl_logic;
        Ld_B            : in     vl_logic;
        Shift_En        : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        A_out           : out    vl_logic;
        B_out           : out    vl_logic;
        A               : out    vl_logic_vector(7 downto 0);
        B               : out    vl_logic_vector(7 downto 0)
    );
end register_unit;
