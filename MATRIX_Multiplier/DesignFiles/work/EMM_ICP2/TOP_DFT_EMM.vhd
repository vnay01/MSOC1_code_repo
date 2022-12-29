----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- Create Date: 12/28/2022 09:15:07 PM
-- Module Name: TOP_DFT_EMM - Behavioral
-- Project Name: ICP2 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;


entity TOP_DFT_EMM is
  Port ( 
         clk : in std_logic;
         reset : in std_logic;
         test_init : in std_logic;
         seven_seg : out std_logic_vector(6 downto 0);
         anode : out std_logic_vector(3 downto 0);
         matrix_output : out std_logic_vector(16 downto 0);
         gold_data : out std_logic_vector(16 downto 0)
        );
end TOP_DFT_EMM;

architecture Behavioral of TOP_DFT_EMM is

-- COMPONENTS
component seven_seg_driver is
   port ( 
		  clk           : in  std_logic;
          reset         : in  std_logic;
          status_flag   : in std_logic_vector(1 downto 0);
          DIGIT_ANODE   : out std_logic_vector(3 downto 0);
          SEGMENT       : out std_logic_vector(6 downto 0)
        );
end component;

component Debounce_Switch is
  port (
  clk    : in  std_logic;
  button_in : in  std_logic;
  button_out : out std_logic
  );
end component;

component edge_detector is
    port (
	     clk : in std_logic;
	     reset : in std_logic;
	     button_in : in std_logic;
	     button_out : out std_logic
	 );
end component;

component DFT_MM is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        start_test : in std_logic;
        read_test : in std_logic;
        dut_status : out std_logic;
        dut_mem_flag: out std_logic;        
        dft_status : out std_logic_vector(1 downto 0);
        test_output : out std_logic_vector(16 downto 0);
        gold_output: out std_logic_vector(16 downto 0)
        );
end component;

component DFT_CONTROLLER is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        test_init : in std_logic;       -- Will start the test sequence
        dut_status : in std_logic;
        dut_mem_flag : in std_logic;
        dft_status : in std_logic_vector(1 downto 0);
        start_test : out std_logic;
        read_test : out std_logic
  );
end component;

-- SIGNALS
signal w_init : std_logic;
signal w_dut_status : std_logic;
signal w_dut_mem_flag : std_logic;
signal w_dft_status : std_logic_vector(1 downto 0);
signal w_start_test : std_logic;
signal w_read_test : std_logic;

signal w_data_out : std_logic_vector(16 downto 0);
signal w_gold_output : std_logic_vector(16 downto 0); 

begin

w_init <= test_init;
matrix_output <= w_data_out;
gold_data <= w_gold_output;


-- MODULE CONNECTIOSN

--debounce:  Debounce_Switch 
--  port map(
--  clk  => clk,
--  button_in => test_init,
--  button_out => w_init
--  );
 
-- debounce: edge_detector 
--      port map (
--           clk => clk,
--           reset => reset,
--           button_in => test_init,
--           button_out => w_init
--       );

DU_DFT_CONTROLLER: DFT_CONTROLLER
  Port map( 
        clk => clk,
        reset => reset,
        test_init => w_init,
        dut_status => w_dut_status,
        dut_mem_flag => w_dut_mem_flag,
        dft_status => w_dft_status,
        start_test => w_start_test,
        read_test => w_read_test
  );
  
  

DU_DFT_MM:DFT_MM
        Port map (
                clk => clk,
                reset => reset,
                start_test => w_start_test,
                read_test => w_read_test,
                dft_status => w_dft_status,
                dut_status => w_dut_status,
                dut_mem_flag => w_dut_mem_flag,                
                test_output => w_data_out,
                gold_output => w_gold_output                                               
                );

DU_Seg: seven_seg_driver
       port map ( 
              clk => clk,
              reset => reset,
              status_flag => w_dft_status,
              DIGIT_ANODE => anode,
              SEGMENT     => seven_seg
                );            

end Behavioral;
