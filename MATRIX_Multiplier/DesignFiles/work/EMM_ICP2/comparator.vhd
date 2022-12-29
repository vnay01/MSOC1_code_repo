----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- Create Date: 12/20/2022 10:49:46 AM
-- Design Name: 16-bit Comparator 
-- Module Name: comparator - Behavioral
-- Project Name: DFT - EMM - ICP2
----------------------------------------------------------------------------------
-- This block will compare two 17-bit numbers and update the status bits
-- PSEUDO CODE: 
--              if num1 = num2 then
--                    status = '11'
--                    else
--                    status = '01'
--                all other cases: 
--                    status = '00'                  
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is
  Port ( 
         clk : in std_logic;
         reset : in std_logic; 
         enable : in std_logic;
         gold_num: in std_logic_vector(16 downto 0);
         matrix_num : in std_logic_vector(16 downto 0);
         status : out std_logic_vector(1 downto 0)
        );
end comparator;

architecture Behavioral of comparator is

-- SIGNALS
signal current_status_reg, next_status_reg : std_logic_vector(1 downto 0);
signal u_gold_num , u_matrix_num : unsigned(16 downto 0);
signal delay_reg_0, delay_reg_1 : unsigned(16 downto 0);

begin

-- Convert numbers for comparison
u_gold_num <= unsigned(gold_num); 
delay_reg_0 <= unsigned(matrix_num);
status <= current_status_reg;

  

seq: process(clk, reset)
    begin
     if reset = '1' then
        current_status_reg <= (others =>'0');
     elsif rising_edge(clk) then
        current_status_reg <= next_status_reg;
        u_matrix_num <= delay_reg_0;
        --u_gold_num <= delay_reg_1;
     end if;
     end process;
         
comb: process(enable, u_gold_num, u_matrix_num)
    begin
        if enable = '1' then
        if (u_gold_num = u_matrix_num) then
        next_status_reg <= "11";
        else
        next_status_reg <= "01";
        end if;
        else
        next_status_reg <= "00";        
        end if;
    end process;                    
            
end Behavioral;
