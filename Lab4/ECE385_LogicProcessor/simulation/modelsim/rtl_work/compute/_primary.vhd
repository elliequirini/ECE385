library verilog;
use verilog.vl_types.all;
entity compute is
    port(
        F               : in     vl_logic_vector(2 downto 0);
        A_In            : in     vl_logic;
        B_In            : in     vl_logic;
        A_Out           : out    vl_logic;
        B_Out           : out    vl_logic;
        F_A_B           : out    vl_logic
    );
end compute;
