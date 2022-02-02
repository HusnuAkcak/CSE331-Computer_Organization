library verilog;
use verilog.vl_types.all;
entity MiniMIPS is
    port(
        pc_next         : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        pc_new          : in     vl_logic_vector(31 downto 0)
    );
end MiniMIPS;
