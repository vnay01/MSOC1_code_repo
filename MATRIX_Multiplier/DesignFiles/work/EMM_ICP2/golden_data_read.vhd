----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 02:16:05 PM
-- Design Name: 
-- Module Name: golden_data_read - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;
use ieee.STD_LOGIC_ARITH.all;


entity golden_data_read is
  Port (
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        output : out std_logic_vector(16 downto 0) 
        );
end golden_data_read;

architecture Behavioral of golden_data_read is

component MEMORY_CONTROLLER is
    Port (
           clk : in std_logic;
           reset : in std_logic;
           enable : in std_logic;       -- enable signal from CONTROLLER connects to CSN
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
	       write_enable : in std_logic;
           ack : in std_logic;  -- Each RAM block ( RY signal is read and then connected to ack )
           ram_bank_select : out std_logic_vector( 1 downto 0 );  -- Since we have 4 separate RAM block, each block can be selected exclusively.
           address : out std_logic_vector( 9 downto 0 );
           memory_full : out std_logic;
           write_en : out std_logic           
           );
end component;

component gold_data is
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
  );
END component;



signal w_enable : std_logic;
signal w_read : std_logic_vector(0 downto 0);
signal w_address : std_logic_vector(9 downto 0);
signal w_data_in : std_logic_vector(15 downto 0);
signal w_output : std_logic_vector(15 downto 0);


signal w_read_enable, w_write_enable : std_logic;
signal w_ack, w_ack_detected : std_logic;
signal w_ack_ram0, w_ack_ram1 : std_logic;
signal w_ram_bank_select : std_logic_vector( 1 downto 0 );
signal W_BANK : std_logic;
signal w_write_en : std_logic;
signal w_memory_full : std_logic; 


-- golden_data_ RAM signals
signal w_data_in_gold : std_logic_vector(16 downto 0);  -- UNUSED
signal w_data_out_gold : std_logic_vector(16 downto 0);

-- OFFSET signals
signal offset : unsigned(9 downto 0);
signal off_address : std_logic_vector(9 downto 0);
signal enable_delay_reg : std_logic;

begin

--- PAY SPECIAL ATTENTION HERE -----
w_read_enable <= '1';   -- always read
w_write_enable <= '0';
w_read(0) <= '0'; -- Force read

-- OFFSETTING generated address with 832 in order to maintain the generality of the MEMORY_CONTROLLER design
-- A lag of 192 clock cycles is not avoidable at this moment because the internal RAM address rolling over to 255 from 0
-- Will come back to this later. 
offset <= "11"& x"40"; 
off_address <= unsigned(w_address) - (offset);

DU_MEMORY_CONTROLLER_GD :entity work.MEMORY_CONTROLLER(Behavioral)
port map (
           clk => clk,
           reset => reset,
           enable => enable_delay_reg,        -- enable goes here &  
           read_enable => w_read_enable, 
	       write_enable => w_write_enable,   
           ack => w_ack_detected,
           ram_bank_select => w_ram_bank_select,
           address => w_address,
           memory_full => w_memory_full,
           write_en => w_write_en       
           );

          

DUT_golden_data: gold_data
  PORT map(
        clka => clk,
        ena => enable_delay_reg,
        wea => w_read,
        addra => off_address(7 downto 0),
        dina => w_data_in_gold,
        douta => w_data_out_gold
  );


output <= w_data_out_gold;

process(clk)
begin
    if rising_edge(clk) then
    enable_delay_reg <= enable;
    end if;
end process;

end Behavioral;
