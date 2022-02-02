library verilog;
use verilog.vl_types.all;
entity full_adder is
    port(
        S               : out    vl_logic;
        C_O             : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        C_I             : in     vl_logic
    );
end full_adder;
