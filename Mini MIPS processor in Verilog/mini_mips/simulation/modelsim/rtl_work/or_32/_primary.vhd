library verilog;
use verilog.vl_types.all;
entity or_32 is
    port(
        R               : out    vl_logic_vector(31 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0)
    );
end or_32;
