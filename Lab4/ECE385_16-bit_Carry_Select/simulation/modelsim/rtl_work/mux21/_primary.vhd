library verilog;
use verilog.vl_types.all;
entity mux21 is
    port(
        \select\        : in     vl_logic;
        q               : out    vl_logic;
        d               : in     vl_logic_vector(1 downto 0)
    );
end mux21;
