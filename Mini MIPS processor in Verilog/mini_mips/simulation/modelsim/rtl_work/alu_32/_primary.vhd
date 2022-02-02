library verilog;
use verilog.vl_types.all;
entity alu_32 is
    port(
        R               : out    vl_logic_vector(31 downto 0);
        C_O             : out    vl_logic;
        ZERO            : out    vl_logic;
        ALU_OP          : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        C_I             : in     vl_logic
    );
end alu_32;
