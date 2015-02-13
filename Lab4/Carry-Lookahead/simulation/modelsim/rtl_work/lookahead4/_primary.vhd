library verilog;
use verilog.vl_types.all;
entity lookahead4 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        c_in            : in     vl_logic;
        S               : out    vl_logic_vector(3 downto 0);
        c_out           : out    vl_logic
    );
end lookahead4;
