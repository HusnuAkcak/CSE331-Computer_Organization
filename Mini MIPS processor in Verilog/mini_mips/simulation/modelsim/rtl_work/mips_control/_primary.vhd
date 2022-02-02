library verilog;
use verilog.vl_types.all;
entity mips_control is
    port(
        reg_dest        : out    vl_logic;
        branch_eq       : out    vl_logic;
        branch_not_eq   : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_to_reg      : out    vl_logic;
        alu_op          : out    vl_logic_vector(2 downto 0);
        mem_write       : out    vl_logic;
        alu_src         : out    vl_logic;
        reg_write       : out    vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0)
    );
end mips_control;
