----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2022 13:08:08
-- Design Name: 
-- Module Name: b8Multiplication - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package b8Multiplication_pkg is
   
   component b8Mult is
       port ( 
       	input_A : in std_logic_vector(7 downto 0);
       	input_B : in std_logic_vector(7 downto 0);	
       	result : out std_logic_vector(7 downto 0);
       	overflow : out std_logic
       );
   end component;
   
end b8Multiplication_pkg;

package body b8Multiplication_pkg is

end b8Multiplication_pkg;


----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------REMOVE?
--entity b8Multiplication is
--  Port ( );
--end b8Multiplication;
---------------------------

------------------------------------------------------------------------------
-- BEHAVORIAL OF THE ADDED COMPONENETS HERE
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.modulo_stage_pack.all;
use work.multiplication_stage_pkg.all;

entity b8Mult is
	 port ( 
			input_A : in std_logic_vector(7 downto 0);
			input_B : in std_logic_vector(7 downto 0);	
			result : out std_logic_vector(7 downto 0);
			overflow : out std_logic
		  );
end b8Mult;




architecture Behavioral of b8Mult is
	
	signal stage1 , stage2, stage3, stage4, stage5, stage6 : std_logic_vector(7 downto 0) := (others => '0'); 	
	
   signal stage_0_out, stage_1_out, stage_2_out, stage_3_out, stage_4_out, stage_5_out, stage_6_out, stage_7_out : std_logic_vector(7 downto 0) := (others => '0'); 
   signal s0_out_of, s1_out_of, s2_out_of, s3_out_of, s4_out_of, s5_out_of, s6_out_of, s7_out_of : std_logic;

   begin

	--stage_1 : modulo_stage PORT MAP(	);
	
	 --  stage_1 : multiplication_stage
     --    port map (
     --       input => input_x,
     --       output => stage1
     --    ); 
         
        stage_0 : multiplication_stage
        port map(
            shift_N   => "000",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(0),-- in std_logic;
            input_B   => input_B,-- in std_logic_vector(7 downto 0);	
            input_of  => '0',-- in std_logic;
            output    => stage_0_out,-- out std_logic_vector(7 downto 0);
            output_of => s0_out_of-- out std_logic
        );
	

        stage_1 : multiplication_stage
        port map(
            shift_N   => "001",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(1),-- in std_logic;
            input_B   => stage_0_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s0_out_of,-- in std_logic;
            output    => stage_1_out,-- out std_logic_vector(7 downto 0);
            output_of => s1_out_of-- out std_logic
        );

        stage_2 : multiplication_stage
        port map(
            shift_N   => "010",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(2),-- in std_logic;
            input_B   => stage_1_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s1_out_of,-- in std_logic;
            output    => stage_2_out,-- out std_logic_vector(7 downto 0);
            output_of => s2_out_of-- out std_logic
        );


        stage_3 : multiplication_stage
        port map(
            shift_N   => "011",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(3),-- in std_logic;
            input_B   => stage_2_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s2_out_of,-- in std_logic;
            output    => stage_3_out,-- out std_logic_vector(7 downto 0);
            output_of => s3_out_of-- out std_logic
        );


        stage_4 : multiplication_stage
        port map(
            shift_N   => "100",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(4),-- in std_logic;
            input_B   => stage_3_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s3_out_of,-- in std_logic;
            output    => stage_4_out,-- out std_logic_vector(7 downto 0);
            output_of => s4_out_of-- out std_logic
        );

        stage_5 : multiplication_stage
        port map(
            shift_N   => "101",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(5),-- in std_logic;
            input_B   => stage_4_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s4_out_of,-- in std_logic;
            output    => stage_5_out,-- out std_logic_vector(7 downto 0);
            output_of => s5_out_of-- out std_logic
        );

        stage_6 : multiplication_stage
        port map(
            shift_N   => "110",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(6),-- in std_logic;
            input_B   => stage_5_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s5_out_of,-- in std_logic;
            output    => stage_6_out,-- out std_logic_vector(7 downto 0);
            output_of => s6_out_of-- out std_logic
        );

        stage_7 : multiplication_stage
        port map(
            shift_N   => "111",-- in std_logic_vector(2 downto 0); -- eventually longer? For 8 bit this is just fine
            input_A   => input_A(7),-- in std_logic;
            input_B   => stage_6_out,-- in std_logic_vector(7 downto 0);	
            input_of  => s6_out_of,-- in std_logic;
            output    => stage_7_out,-- out std_logic_vector(7 downto 0);
            output_of => s7_out_of-- out std_logic
        );

process(stage_7_out)
begin
        if (input_A = "00000000") then
                    result <= "00000000";
                   overflow <= '0';
            
        else
                    result <= stage_7_out;
                    overflow <= s7_out_of;
        end if;
            end process;
end Behavioral;
