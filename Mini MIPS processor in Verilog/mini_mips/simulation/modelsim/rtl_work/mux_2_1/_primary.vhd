library verilog;
use verilog.vl_types.all;
entity mux_2_1 is
    port(
        R               : out    vl_logic;
        S               : in     vl_logic;
        I_0             : in     vl_logic;
        I_1             : in     vl_logic
    );
end mux_2_1;
