library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity input_matrix_read is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;  -- use this signal to start reading
        output : out std_logic_vector(15 downto 0)
        );
end input_matrix_read;

architecture Behavioral of input_matrix_read is

-- COMPONENTS --
component input_matrix IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END component;

component MEM_READER is
  Port ( 
         clk :in std_logic;
         reset : in std_logic;
         enable : std_logic;
         address : out std_logic_vector(5 downto 0)   
           );
end component;

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


-- SIGNALS --

signal w_enable : std_logic;
signal w_read : std_logic_vector(0 downto 0);
signal w_address : std_logic_vector(5 downto 0);
signal w_data_in : std_logic_vector(15 downto 0);
signal w_output : std_logic_vector(15 downto 0);


signal w_read_enable, w_write_enable : std_logic;
signal w_ack, w_ack_detected : std_logic;
signal w_ack_ram0, w_ack_ram1 : std_logic;
signal w_ram_bank_select : std_logic_vector( 1 downto 0 );
signal W_BANK : std_logic;
signal w_write_en : std_logic;
signal w_memory_full : std_logic; 



begin

--- Pay special attention here -----
w_read_enable <= '1';   -- always read
w_write_enable <= '0';

w_read(0) <= '0'; -- Force read

-------- Current address starts from 0. An offset is needed to change current address to the top of RAM
-------- which in this particular case is 64

DU_MEMORY_READER: MEM_READER 
  Port map( 
         clk => clk,
         reset => reset,
         enable => enable,
         address => w_address   
           );

           
DUT_input_ram: input_matrix
  port map (
    clka => clk,
    ena => enable,              -- here
    wea => w_read,
    addra => w_address,
    dina => w_data_in,
    douta => w_output
  );
  
  
output <= w_output;



end Behavioral;
