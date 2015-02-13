library verilog;
use verilog.vl_types.all;
entity carry_lookahead is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Load_B          : in     vl_logic;
        Run             : in     vl_logic;
        Switches        : in     vl_logic_vector(15 downto 0);
        Overflow        : out    vl_logic;
        Ahex0           : out    vl_logic_vector(6 downto 0);
        Ahex1           : out    vl_logic_vector(6 downto 0);
        Ahex2           : out    vl_logic_vector(6 downto 0);
        Ahex3           : out    vl_logic_vector(6 downto 0);
        Bhex0           : out    vl_logic_vector(6 downto 0);
        Bhex1           : out    vl_logic_vector(6 downto 0);
        Bhex2           : out    vl_logic_vector(6 downto 0);
        Bhex3           : out    vl_logic_vector(6 downto 0);
        Sum             : out    vl_logic_vector(15 downto 0)
    );
end carry_lookahead;
