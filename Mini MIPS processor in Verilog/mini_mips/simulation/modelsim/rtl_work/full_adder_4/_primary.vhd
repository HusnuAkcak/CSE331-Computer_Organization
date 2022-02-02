library verilog;
use verilog.vl_types.all;
entity full_adder_4 is
    port(
        S               : out    vl_logic_vector(3 downto 0);
        C_O             : out    vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        C_I             : in     vl_logic
    );
end full_adder_4;
