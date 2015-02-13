library verilog;
use verilog.vl_types.all;
entity reg_17 is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Ld_B            : in     vl_logic;
        Of1             : in     vl_logic;
        Run             : in     vl_logic;
        Data_In         : in     vl_logic_vector(15 downto 0);
        Data_Calc       : in     vl_logic_vector(15 downto 0);
        Overflow        : out    vl_logic;
        Data_Out        : out    vl_logic_vector(15 downto 0)
    );
end reg_17;
