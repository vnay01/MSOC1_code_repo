library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUL is
	port 
	(
		clk    : in std_logic;
		clear  : in std_logic;
		enable : in std_logic;                            -- controller enables multiplication
		operand_a : in std_logic_vector(7 downto 0);        -- input matrix
		operand_b : in std_logic_vector (7 downto 0);       -- coefficiet elem
        mul_out	: out unsigned (15 downto 0)
	);
	
end MUL;

architecture beh of MUL is

-- Declare registers for intermediate values
signal reg_operand_a, reg_operand_b : unsigned( 7 downto 0 );
signal reg_mul_out : unsigned(15 downto 0);


begin
            reg_operand_a <= unsigned(operand_a);
            reg_operand_b <= unsigned(operand_b);
process(clk, clear)
    begin
    if clear = '1' then
        reg_mul_out <= (others =>'0');
        --mul_out <= ( others => '0' );
        elsif rising_edge(clk) then
            if enable = '1' then 
            reg_mul_out <= reg_operand_a * reg_operand_b;
          end if;
        end if;
    end process;
      mul_out <= reg_mul_out;    

end beh;