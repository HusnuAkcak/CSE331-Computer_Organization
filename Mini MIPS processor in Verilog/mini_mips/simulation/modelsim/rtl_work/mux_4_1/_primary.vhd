library verilog;
use verilog.vl_types.all;
entity mux_4_1 is
    port(
        R               : out    vl_logic;
        S_0             : in     vl_logic;
        S_1             : in     vl_logic;
        I_0             : in     vl_logic;
        I_1             : in     vl_logic;
        I_2             : in     vl_logic;
        I_3             : in     vl_logic
    );
end mux_4_1;
