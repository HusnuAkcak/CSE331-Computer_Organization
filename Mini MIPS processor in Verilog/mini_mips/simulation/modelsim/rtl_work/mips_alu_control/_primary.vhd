library verilog;
use verilog.vl_types.all;
entity mips_alu_control is
    port(
        alu_control     : out    vl_logic_vector(2 downto 0);
        alu_op          : in     vl_logic_vector(2 downto 0);
        func            : in     vl_logic_vector(2 downto 0)
    );
end mips_alu_control;
