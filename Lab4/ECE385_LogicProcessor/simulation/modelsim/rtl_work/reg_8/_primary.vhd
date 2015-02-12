library verilog;
use verilog.vl_types.all;
entity reg_8 is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Shift_In        : in     vl_logic;
        Load            : in     vl_logic;
        Shift_En        : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        Shift_Out       : out    vl_logic;
        Data_Out        : out    vl_logic_vector(7 downto 0)
    );
end reg_8;
