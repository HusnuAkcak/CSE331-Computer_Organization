library verilog;
use verilog.vl_types.all;
entity mips_instruction_memory is
    port(
        instruction     : out    vl_logic_vector(15 downto 0);
        read_address    : in     vl_logic_vector(31 downto 0)
    );
end mips_instruction_memory;
