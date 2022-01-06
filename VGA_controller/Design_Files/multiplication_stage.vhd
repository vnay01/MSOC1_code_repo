----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2022 12:13:03
-- Design Name: 
-- Module Name: multiplication_stage - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
package multiplication_stage_pkg is
	component multiplication_stage is
        port ( 
            shift_N : in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A : in std_logic;
            input_B : in std_logic_vector(7 downto 0);	
            input_of : in std_logic;
            output : out std_logic_vector(7 downto 0);
            output_of : out std_logic
        );
    end component;
end multiplication_stage_pkg;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity multiplication_stage is
    port ( 
        shift_N : in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
    	input_A : in std_logic;
        input_B : in std_logic_vector(7 downto 0);	
        input_of : in std_logic;
    	output : out std_logic_vector(7 downto 0);
        output_of : out std_logic
    );
end multiplication_stage;

architecture Behavioral of multiplication_stage is
-- Signals
    signal tmp: std_logic_vector(7 downto 0) := (others => '0');
    signal tmp_of: std_logic;--_vector(7 downto 0) := (others => '0');
    
    signal geq: std_logic_vector(8 downto 0) := (others => '0');
    --signal testing : std_logic_vector(14 downto 0) := (others => '0');
begin
    --tmp <= input_B sll unsigned(shift_N);
    --tmp <= input_B sll 3;
    --testing <= input_B((unsigned(shift_N)+unsigned(7)) downto unsigned(shift_N));


    
    --testing <= input_B(unsigned(unsigned(shift_N)+7) downto unsigned(shift_N));
    --testing(unsigned(unsigned(shift_N)+7) downto unsigned(shift_N)) <= input_B;
    
    --bp := std_logic_vector(unsigned(bp) sll 1);
    
  	--tmp <= std_logic_vector(unsigned(input_B) sll 1);
  	
    -- tmp <= std_logic_vector("sll"(unsigned(input_B), to_integer(unsigned(shift_N))));
    
    
    --testing(natural(summ) downto natural(NKUK)) <= input_B;
   -- tmp <= (input_B sll 1);
--    tmp_B <= input_B;


    comp : process(tmp, input_A, input_B, shift_N)
    begin
        tmp <= input_B;
        tmp_of <= '0';
        if input_A = '1' then
            
            tmp(7 downto 0) <= std_logic_vector("sll"(unsigned(input_B), to_integer(unsigned(shift_N))));
            -- tmp <= input_B;
            -- tmp <= tmp_B;
            -- for I in 0 to to_integer(unsigned(shift_N)) loop
            --     tmp <= tmp(6 downto 0) & '0';
                
            -- end loop;
            
            -- tmp_of <= ??
            -- geq <= std_logic_vector("sll"(to_unsigned(1,9), to_integer(8-unsigned(shift_N))));

            --geq <= std_logic_vector("sll"(to_unsigned(1,9), 8)); --Fungerar!
            geq <= std_logic_vector("sll"(to_unsigned(1,9), 8-to_integer(unsigned(shift_N)))); 

            --if unsigned(input_B) >= unsigned(std_logic_vector("sll"(unsigned(1), to_integer(8-unsigned(shift_N))))) then
            if unsigned(input_B) >= unsigned(std_logic_vector("sll"(to_unsigned(1,9), 8-to_integer(unsigned(shift_N))))) then
            
            -- geq <= std_logic_vector("sll"(to_unsigned(1,8), to_integer(unsigned(shift_N))));
            -- if unsigned(input_B) >= unsigned(geq) then
                tmp_of <= '1';
            end if;
        end if;
    end process;
    
    -- outputs
    	-- If last stage is overflowed, ir if B="0110..", when shift_N=2,
        -- ie we will shift outside if B(8-2)=B(6) == '1' GIVEN that we're actually
        -- performing a bit shift (that is, input_A is 1)
    --output_of <= input_of OR (input_B(to_integer(8-unsigned(shift_N))) AND input_A); 
    output_of <= input_of OR tmp_of; 


        -- The output will be the input_B to the next stage. If last stage, then it is 
        -- the resulting output of the N-bit multiplier
    output <= tmp;
    
end Behavioral;
