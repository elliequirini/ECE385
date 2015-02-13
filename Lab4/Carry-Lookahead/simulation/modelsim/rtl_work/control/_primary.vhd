library verilog;
use verilog.vl_types.all;
entity control is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Load_B          : in     vl_logic;
        Run             : in     vl_logic;
        Ld_B            : out    vl_logic
    );
end control;
