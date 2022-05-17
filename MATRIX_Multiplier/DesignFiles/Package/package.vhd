library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package pkg is

type out_port is array(15 downto 0) of std_logic_vector(7 downto 0);
type rom_out is array( 7 downto 0) of std_logic_vector( 7 downto 0);   -- use it for ROM read out
type dat_8 is array( 7 downto 0) of std_logic_vector( 7 downto 0);
type delay_8 is array( 3 downto 0) of std_logic_vector( 7 downto 0);
type delay_4 is array( 2 downto 0) of std_logic_vector( 7 downto 0);

-- Components
-- Multiplier
component MUL is
	port 
	(
		clk    : in std_logic;
		clear  : in std_logic;
		enable : in std_logic;                            -- controller enables multiplication
		operand_a : in std_logic_vector(7 downto 0);        -- input matrix
		operand_b : in std_logic_vector (7 downto 0);       -- coefficiet elem
        mul_out	: out unsigned (15 downto 0)
	);
	
end component;

-- Adder
component ADDER_MODULE is
 Port ( 
        clk : in std_logic;
        reset: in std_logic;
        enable : in std_logic;
        operand_a: in unsigned(15 downto 0);
        operand_b: in unsigned(15 downto 0);
        adder_out: out unsigned( 15 downto 0 )
        );
end component;

-- COMPUTE UNIT
component COMPUTE_UNIT is
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

end component;


end package;

package body pkg is

end pkg;


-------------- MULTIPLIER -------------
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
-----------------------------------------------------
------------------- MULTIPLIER ENDS HERE ------------
-----------------------------------------------------



-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
-- ADDER STARTS HERE 

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

-----------------------------------------------------
-- ADDER ENDS HERE ----------------------------------
-----------------------------------------------------


-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
-- COMPUTE UNIT STARTS HERE 
-----------------------------------------------------
-----------------------------------------------------
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


-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
-- COMPUTE UNIT ENDS HERE 
-----------------------------------------------------
-----------------------------------------------------



