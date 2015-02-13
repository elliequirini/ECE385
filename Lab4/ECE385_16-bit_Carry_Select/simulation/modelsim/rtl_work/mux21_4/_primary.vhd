library verilog;
use verilog.vl_types.all;
entity mux21_4 is
    port(
        \select\        : in     vl_logic;
        n               : in     vl_logic_vector(3 downto 0);
        c               : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(3 downto 0)
    );
end mux21_4;
