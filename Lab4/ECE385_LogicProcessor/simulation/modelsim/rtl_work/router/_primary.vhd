library verilog;
use verilog.vl_types.all;
entity router is
    port(
        R               : in     vl_logic_vector(1 downto 0);
        A_In            : in     vl_logic;
        B_In            : in     vl_logic;
        F_A_B           : in     vl_logic;
        A_Out           : out    vl_logic;
        B_Out           : out    vl_logic
    );
end router;
