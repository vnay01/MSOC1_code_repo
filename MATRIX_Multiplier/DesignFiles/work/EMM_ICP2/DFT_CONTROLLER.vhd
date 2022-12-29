----------------------------------------------------------------------------------
-- Engineer:    Vinay Singh
-- Create Date: 12/27/2022 07:45:27 PM
-- Module Name: DFT_CONTROLLER - Behavioral
-- Project Name: ICP 2
-- Additional Comments:
-- TEST CONTROLLER - Manages the sequences of steps during the test 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity DFT_CONTROLLER is
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
end DFT_CONTROLLER;

architecture Behavioral of DFT_CONTROLLER is

component edge_detector is
    port (
	     clk : in std_logic;
	     reset : in std_logic;
	     button_in : in std_logic;
	     button_out : out std_logic
	 );
end component;

type state is ( IDLE, START, TEST_DUT, READ_RESULT, FINISH );
signal current_state, next_state : state;

-- internal counters
-- Use these to count total number of comparisons which were equal and not equal 
signal eq_count, eq_count_next : unsigned(9 downto 0);
signal neq_count, neq_count_next : unsigned(9 downto 0);
signal count_up, count_up_next : unsigned(3 downto 0);
signal edge_dut_status : std_logic;

begin

EDGE: edge_detector 
    port map (
	     clk => clk,
	     reset => reset,
	     button_in => dut_status,
	     button_out => edge_dut_status
	 );

reg_update:process(clk, reset)
begin
    if reset = '1' then
        current_state <= IDLE;
        eq_count <= (others =>'0');
        neq_count <= (others =>'0');
        count_up <= (others =>'0');
        elsif rising_edge(clk) then
        current_state <= next_state;
        eq_count <= eq_count_next;
        neq_count <= neq_count_next;
        count_up <= count_up_next;
    end if;
end process;


comb: process(current_state, test_init, edge_dut_status, dft_status, eq_count, neq_count, count_up)

    begin
    -- Default
       next_state <= current_state;
       start_test <= '0';
       read_test <= '0';
       eq_count_next <= eq_count;
       neq_count_next <= neq_count;
       count_up_next <= count_up;
   
       case current_state is
    
    
       when IDLE =>
       eq_count_next <= (others =>'0');
       neq_count_next <= (others =>'0');
       
       if test_init = '1' then
       next_state <= START;
       end if;
       
       when START =>
       
       count_up_next <= count_up + 1;
       
       if count_up = x"2" then
       count_up_next <= (others =>'0'); -- RESET counter
       start_test <= '1';               -- Check Status signal from DUT. If STATUS = '0' Activate DUT
       next_state <= TEST_DUT;
       end if;
       
       when TEST_DUT =>
       --start_test <= '1';    
       if edge_dut_status = '1' then         -- Wait for DUT Status to go LOW ( indicates completion of matrix multiplication )
--       read_test <= '1';                -- Start reading from RAM and Golden data
       next_state <= READ_RESULT;       
       end if;
       
       when READ_RESULT =>              -- What should this state do, if anything at all ?
       
       read_test <= '1';
       
       if edge_dut_status = '1' then
       next_state <= IDLE;
       end if;
       
       case dft_status is
       when "11" =>
       eq_count_next <= eq_count + 1;
       when "01" =>
       neq_count_next <= neq_count + 1;
       
       when others =>
       NULL;
       end case;
                  
       when others =>
       NULL;   
       end case;

    end process;

end Behavioral;
