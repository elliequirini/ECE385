library verilog;
use verilog.vl_types.all;
entity control is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        LoadA           : in     vl_logic;
        LoadB           : in     vl_logic;
        Execute         : in     vl_logic;
        Shift_En        : out    vl_logic;
        Ld_A            : out    vl_logic;
        Ld_B            : out    vl_logic
    );
end control;
