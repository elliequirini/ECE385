library verilog;
use verilog.vl_types.all;
entity HexDriver is
    port(
        In0             : in     vl_logic_vector(3 downto 0);
        Out0            : out    vl_logic_vector(6 downto 0)
    );
end HexDriver;
