library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ADDER_MODULE is
 Port ( 
        clk : in std_logic;
        reset: in std_logic;
        enable : in std_logic;
        operand_a: in unsigned(15 downto 0);
        operand_b: in unsigned(15 downto 0);
        adder_out: out unsigned( 15 downto 0 )
        );
end ADDER_MODULE;

architecture Behavioral of ADDER_MODULE is

signal reg_operand_a, reg_operand_b : unsigned( 15 downto 0 );
signal reg_adder_out : unsigned( 15 downto 0 );


begin

reg_operand_a <= operand_a;
reg_operand_b <= operand_b;


process(clk, reset)
 begin
    if reset = '1' then
        reg_adder_out <= (others => '0');
        elsif rising_edge(clk) then
        if enable = '1' then
        reg_adder_out <= reg_operand_a + reg_operand_b;
        end if;
        end if;
 end process;

adder_out <= reg_adder_out;

end Behavioral;
