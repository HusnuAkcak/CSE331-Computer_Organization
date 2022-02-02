library verilog;
use verilog.vl_types.all;
entity sign_extender is
    port(
        extended        : out    vl_logic_vector(31 downto 0);
        imm             : in     vl_logic_vector(5 downto 0)
    );
end sign_extender;
