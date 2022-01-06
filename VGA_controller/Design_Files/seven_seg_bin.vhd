----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/06/2022 01:20:53 PM
-- Design Name: 
-- Module Name: seven_seg_bin - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity seven_seg_bin is
port (
        clk : in std_logic ;
        seven_seg :in unsigned(6 downto 0) ;    -- Comes from Keyboard module
        anode_ctrl : in unsigned(7 downto 0);   -- comes from keyboard module
        binary_out : out std_logic_vector( 7 downto 0)  -- number to be fed to RAM
            );
end seven_seg_bin;

architecture Behavioral of seven_seg_bin is

component b8Mult is
	 port ( 
			input_A : in std_logic_vector(7 downto 0);
			input_B : in std_logic_vector(7 downto 0);	
			result : out std_logic_vector(7 downto 0);
			overflow : out std_logic
		  );
end component;

signal next_anode_ctrl : unsigned(7 downto 0);
signal data_reg1, data_reg2, data_reg3 : unsigned(7 downto 0) ; -- used to store converted seven seg numbers in binary
signal data_out_reg, current_data_reg : unsigned( 7 downto 0);
signal binary_out_buff,current_binary_buff : unsigned (7 downto 0);

--signal shifted_data_reg2_1,shifted_data_reg2_2 : unsigned ( 7 downto 0);
signal data_reg2_mul_10, data_reg3_mul_100 : std_logic_vector (7 downto 0);

--signal mult_data_reg_2 : unsigned(7 downto 0);

--signal shifted_data_reg3_1, shifted_data_reg3_2, shifted_data_reg3_3 : unsigned(7 downto 0);
--signal mult_data_reg_3 : unsigned( 7 downto 0);

constant a : unsigned(7 downto 0) := "00001010";  --00001010
constant b : unsigned(7 downto 0) := "01100100";

--signal current_data_reg2_mul_10 , next_data_reg2_mul_10, current_data_reg3_mul_100, next_data_reg3_mul_100 : std_logic_vector(7 downto 0);

signal ovf1, ovf2 : std_logic;



begin

   
    mult10: b8Mult
        port map(
                    input_A =>std_logic_vector(data_reg2),
                    input_B => std_logic_vector(a),
                    result => data_reg2_mul_10,
                    overflow => ovf1
                    
                    );
     mult100: b8Mult
     port map(
        input_A =>std_logic_vector(data_reg3),
        input_B => std_logic_vector(b),
        result => data_reg3_mul_100,
        overflow => ovf2
        );
                    
--     process(clk)
--     begin
--     if rising_edge(clk) then
--     current_data_reg2_mul_10 <= next_data_reg2_mul_10;
--     current_data_reg3_mul_100 <= next_data_reg3_mul_100;
     
--     end if;             
--    end process;
    
seven_2bin:process(seven_seg, clk)              -- generates output binary number based on 7 seg
begin
if rising_edge(clk) then
    case seven_seg is
 
       when "1000000" =>               -- 0
       data_out_reg <= "00000000";
        
       when "1111001" =>               -- 1
       data_out_reg <= "00000001";
       
       when "0100100" =>
       data_out_reg <= "00000010";
       
       when "0110000" =>                --3
       data_out_reg <= "00000011";
       
       when "0011001" =>                 --4
       data_out_reg <=  "00000100";
       
       when "0010010"=>                --5
       data_out_reg <= "00000101";
       
       when "0000010" =>                 --6
       data_out_reg <="00000110";
       
       when "1111000" =>                 -- 7
       data_out_reg <= "00000111"; 
       
       when "0000000" =>                    --8
       data_out_reg <="00001000";
       
       when "0011000" =>                    --9
       data_out_reg <= "00001001";
       
       when "0000100" =>                        -- Enter key 134 
       data_out_reg <= "10000110";
       
       when "0111111" =>                        -- + key 130 
       data_out_reg <= "10000010";
       
       when "1100001" =>                    -- ( - )key 131
       data_out_reg <= "10000011";
       
       when "1100010" =>                -- mult key     132
       data_out_reg <= "10000100";
        
       when "1100100"=>                 -- mod3 key 133
       data_out_reg <= "10000101";
       
       when others => 
       data_out_reg <= "00000000";          --- generates 255
    end case;
end if;
end process;

---------------------------------------------------------------
------------------ Anode control Signal ------------------

process(anode_ctrl,clk)
begin
if rising_edge(clk) then
next_anode_ctrl <= anode_ctrl;
end if;
end process;


---------------------------------------------


register_update: process(next_anode_ctrl,clk)
begin

if rising_edge(clk) then         
            case next_anode_ctrl is
            
            when "00000001" =>                  
            data_reg1<= data_out_reg;           -- segment 1

            when "00000010" =>  
            data_reg2 <= data_out_reg;          -- segment 2
               

            
            when "00000011" =>
            data_reg3 <= data_out_reg;          -- segment 3
            binary_out_buff <= data_reg1 +unsigned(data_reg2_mul_10) + unsigned(data_reg3_mul_100);

            when others =>
            data_reg1 <= (others => '0');
            data_reg2 <= (others => '0');
            data_reg3 <= (others => '0');
            end case;
            end if;
end process;

   
    
    binary_out <= std_logic_vector(binary_out_buff);

 
end Behavioral;
