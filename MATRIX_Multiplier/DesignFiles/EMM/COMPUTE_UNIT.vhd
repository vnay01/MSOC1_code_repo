library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg.all;


entity COMPUTE_UNIT is
  Port (    
        clk : in std_logic;
        reset : in std_logic;
        clear: in std_logic;
        enable : in std_logic;
        operand_x1:  in std_logic_vector( 7 downto 0 );
        operand_x2:  in std_logic_vector( 7 downto 0 );
        operand_x3:  in std_logic_vector( 7 downto 0 );
        operand_x4:  in std_logic_vector( 7 downto 0 );
        operand_a1:  in std_logic_vector( 7 downto 0 );
        operand_a2:  in std_logic_vector( 7 downto 0 );
        operand_a3:  in std_logic_vector( 7 downto 0 );
        operand_a4:  in std_logic_vector( 7 downto 0 );
        prod_element : out std_logic_vector( 15 downto 0 )
        );

end COMPUTE_UNIT;

architecture Behavioral of COMPUTE_UNIT is

-- Signals
-- Multiplier interconnections
signal w_mul_out_1, w_mul_out_2, w_mul_out_3, w_mul_out_4 : unsigned( 15 downto 0 );
signal w_clear, w_enable : std_logic;

-- Adder interconnections
signal w_adder_out_1, w_adder_out_2, w_adder_out_3 : unsigned( 15 downto 0 );

begin

-- GLOBAL connections
w_clear <= clear;
w_enable <= enable;


-- Interconnections of multiplier and adder units

DUT_MUL1 : MUL 
  port map(
		clk => clk,
		clear => w_clear,
		enable => w_enable,
		operand_a => operand_x1,
		operand_b => operand_a1,
        mul_out => w_mul_out_1
	);
	
DUT_MUL2 : MUL 
  port map(
		clk => clk,
		clear => w_clear,
		enable => w_enable,
		operand_a => operand_x2,
		operand_b => operand_a2,
        mul_out => w_mul_out_2
	);	

DUT_MUL3 : MUL 
  port map(
		clk => clk,
		clear => w_clear,
		enable => w_enable,
		operand_a => operand_x3,
		operand_b => operand_a3,
        mul_out => w_mul_out_3
	);
	
DUT_MUL4 : MUL 
  port map(
		clk => clk,
		clear => w_clear,
		enable => w_enable,
		operand_a => operand_x4,
		operand_b => operand_a4,
        mul_out => w_mul_out_4
	);	

DUT_ADD_1 : ADDER_MODULE
port map ( 
        clk => clk,
        reset => reset,
        enable => w_enable,
        operand_a => w_mul_out_1, 
        operand_b => w_mul_out_2,
        adder_out => w_adder_out_1
        );

DUT_ADD_2 : ADDER_MODULE
port map ( 
        clk => clk,
        reset => reset,
        enable => w_enable,
        operand_a => w_mul_out_3, 
        operand_b => w_mul_out_4,
        adder_out => w_adder_out_2
        );

DUT_ADD_3 : ADDER_MODULE
port map ( 
        clk => clk,
        reset => reset,
        enable => w_enable,
        operand_a => w_adder_out_1, 
        operand_b => w_adder_out_2,
        adder_out => w_adder_out_3
        );

prod_element <=std_logic_vector( w_adder_out_3 );

end Behavioral;
