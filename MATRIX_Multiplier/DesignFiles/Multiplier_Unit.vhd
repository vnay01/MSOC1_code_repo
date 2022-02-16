----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vinay Singh
-- 
-- Create Date: 07.02.2022 17:52:49
-- Design Name: Multiplier Unit
-- Module Name: Multiplier_Unit - Behavioral
-- Project Name: IC Project
-- Dependencies:
--              1) CL_adder
--              2) multiplier
-- Revision: V0.1
-- Revision 0.01 - File Created
-- Additional Comments:
--                  Unoptimized design for initial synthesis flow
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.components_pkg.all;


entity Multiplier_Unit is
  Port (
        reset : in std_logic;
        clk : in std_logic;
        in_mult_en : in std_logic;
        in_X : in std_logic_vector(7 downto 0);
        in_A : in std_logic_vector(6 downto 0);
        prod_elem: out std_logic_vector(15 downto 0) );
end Multiplier_Unit;

architecture Behavioral of Multiplier_Unit is

-- COMPONENTS -- needs to be made more structured
--component multiplier is
--generic (
--            N : integer := 7
--            );
--  port (
--        reset : std_logic;
--        in_X : in std_logic_vector(N downto 0);
--        in_A : in std_logic_vector(N-1 downto 0);
--        mult_en : in std_logic; -- may be redundant
--        out_P : out std_logic_vector(2*N downto 0)
--  );
--end component;

--component CL_adder is
--generic ( 
--         N : integer := 15 
--         );
--  Port (    
--            reset : in std_logic;
--            in_A: in std_logic_vector(N-1 downto 0);
--            in_B : in std_logic_vector(N-1 downto 0);
--            out_sum : out std_logic_vector( N downto 0)
--            );
--end component;

-- SIGNALS
signal mult_out : std_logic_vector(14 downto 0);
signal sum_elem, sum_elem_next,sum_elem_next_2,  in_B_reg : std_logic_vector(15 downto 0);
signal mult_en_sig : std_logic;

begin
    
 multiplier_unit : multiplier
 generic map (
            N => 7
            )
  port map(  
            reset => reset,
            in_X => in_X,
            in_A =>in_A,
            mult_en => '1',
            out_P => mult_out
            );


add_unit: CL_adder 
    generic map( 
         N => 15 
         )
  Port map ( 
            reset => reset,
            in_A => mult_out,
            in_B => in_B_reg(14 downto 0),
            add_en => '1' ,
            out_sum => sum_elem,
            add_done => mult_en_sig         
            );
            
  mult_en_sig <= in_mult_en;
        
   process(clk, sum_elem, sum_elem_next ,mult_en_sig, reset)
   begin
   
    
        if reset = '1' then
        sum_elem_next <= (others => '0');
--        in_B_reg <= (others => '0');
        elsif rising_edge(clk) then
        
        if mult_en_sig = '1' then
        sum_elem_next <= sum_elem;     -- register to store sum from CLA
        in_B_reg <= sum_elem_next;
        else
        sum_elem_next <= (others => '0');
        in_B_reg <= (others => '0');
        end if;
        end if;
   end process;
   
prod_elem <= sum_elem_next;

end Behavioral;