library verilog;
use verilog.vl_types.all;
entity mux_8_1 is
    port(
        R               : out    vl_logic;
        S_0             : in     vl_logic;
        S_1             : in     vl_logic;
        S_2             : in     vl_logic;
        I_0             : in     vl_logic;
        I_1             : in     vl_logic;
        I_2             : in     vl_logic;
        I_3             : in     vl_logic;
        I_4             : in     vl_logic;
        I_5             : in     vl_logic;
        I_6             : in     vl_logic;
        I_7             : in     vl_logic
    );
end mux_8_1;
