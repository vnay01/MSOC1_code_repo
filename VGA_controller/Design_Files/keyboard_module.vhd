----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/06/2022 07:39:30 PM
-- Design Name: 
-- Module Name: keyboard_module - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keyboard_module is
port (
	        clk          : in std_logic;
            reset          : in std_logic;
            kb_data      : in std_logic;
            kb_clk      : in std_logic;
            sc: out std_logic_vector( 7 downto 0);  -- number to be fed to RAM
            enter : out std_logic
    );
end keyboard_module;

architecture Behavioral of keyboard_module is


----------------- Components ------------------
------------------------------------------------
component keyboard_top is
    port (
	     clk          : in std_logic;
	     reset          : in std_logic;
	     kb_data	  : in std_logic;
	     kb_clk	  : in std_logic;
	     LED		  : out unsigned(7 downto 0);
	     seven_seg	  : out unsigned(6 downto 0);
	     anode	  : out unsigned(7 downto 0)	-- Uncomment for NEXYS4  -- Originally 	seg_en	  : out unsigned(3 downto 0)
--	     anode	  : out unsigned(3 downto 0)    -- uncomment for Basys3
	 );
end component;

component seven_seg_bin is
port (
        clk : in std_logic ;
        seven_seg :in unsigned(6 downto 0) ;    -- Comes from Keyboard module
        anode_ctrl : in unsigned(7 downto 0);   -- comes from keyboard module
        binary_out : out std_logic_vector( 7 downto 0)  -- number to be fed to RAM
            );
end component;
------------------------ Components END here ------------------------

------------------------ Signals start here ------------------------

signal kb_sevSeg_seven_seg : unsigned(6 downto 0);
signal anode_ctrl : unsigned(7 downto 0);
signal LED : unsigned(7 downto 0);
signal enter_enable : std_logic;
signal binary_out_buf : std_logic_vector(7 downto 0);
signal reset_low : std_logic;



begin

reset_low <= not reset;

keyboard_module: keyboard_top
port map (
            clk => clk,
            reset => reset_low,
            kb_data => kb_data,
            kb_clk => kb_clk,
            LED => LED,
            seven_seg => kb_sevSeg_seven_seg,
            anode => anode_ctrl
         );
   
binary_convert_module: seven_seg_bin
port map (
            clk => clk,
            seven_seg => kb_sevSeg_seven_seg,
            anode_ctrl =>anode_ctrl,
            binary_out =>binary_out_buf
            );

process(binary_out_buf)
    begin
    if binary_out_buf = "10000110" then
    enter_enable <= '1';
    else
    enter_enable <= '0';
    end if;
    end process;
  enter <= enter_enable;
  sc <= binary_out_buf;
  
end Behavioral;
