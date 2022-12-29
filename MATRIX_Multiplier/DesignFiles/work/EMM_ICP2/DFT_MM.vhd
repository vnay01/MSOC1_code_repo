----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- Create Date: 12/04/2022 04:05:09 PM
-- Design Name: 
-- Module Name: DFT_MM - Behavioral
-- Project Name: ICP2
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.pkg.all;




entity DFT_MM is
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
end DFT_MM;


architecture Behavioral of DFT_MM is

-- COMPONENTS --

component MATRIX_MULTIPLIER is
 Port ( 
       clk : in std_logic;
       reset : in std_logic;
       start: in std_logic;
       read: in std_logic;
       input_matrix : in std_logic_vector( 7 downto 0 );        -- Can be combined with output port LSB
       status : out std_logic;                              -- controller will update this
       output_matrix : out std_logic_vector( 16 downto 0 );  -- Goes to RAM store controller 
       mem_flag : out std_logic;
       data_hold : out std_logic;
       gold_read_en: out std_logic                              --- ADDING test signals to enable reading from Golden Data RAM
       );
end component;

component input_matrix_read is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;  -- use this signal to start reading
        output : out std_logic_vector(15 downto 0)
        );
end component;


component golden_data_read is
  Port (
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        output : out std_logic_vector(16 downto 0) 
        );
end component;

-- COMPARATOR
component comparator is
  Port ( 
         clk : in std_logic;
         reset : in std_logic; 
         enable : in std_logic;
         gold_num: in std_logic_vector(16 downto 0);
         matrix_num : in std_logic_vector(16 downto 0);
         status : out std_logic_vector(1 downto 0)
        );
end component;

COMPONENT FIFO_BUFF
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC 
  );
END COMPONENT;

-- BLOCK RAM BASED FIFO --
COMPONENT FIFO_BUFF_ram
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC 
  );
END COMPONENT;


-- SIGNALS
---- IP Golden Data Matrix signals begin here ----
--signal w_gold_read : std_logic;
signal w_gold_output: std_logic_vector(16 downto 0);
signal w_comp_status : std_logic_vector(1 downto 0);
signal w_matrix_num : std_logic_vector(16 downto 0);

---- IP Golden Data Matrix signals end here ----

---- IP Matrix Read Signals begin here ----
signal w_input_reg : std_logic_vector(7 downto 0);
signal w_output_reg : std_logic_vector(15 downto 0);
signal w_enable : std_logic;
---- IP Matrix Read Signals end here ----


---- EMM Signals begin here ----
signal w_mem_flag : std_logic;
signal w_status : std_logic;
signal w_read : std_logic;
signal w_init : std_logic; 
signal w_output_matrix: std_logic_vector(16 downto 0);
signal w_gold_en : std_logic;
signal w_data_hold : std_logic;

---- EMM Signals end here ----

---- FIFO signals ----
signal wr_en, rd_en : std_logic;
signal fifo_dout : std_logic_vector(15 downto 0);   
signal fifo_full : std_logic;
signal fifo_empty : std_logic;

---- FIFO signals end here ----

---- Internal connections ----
signal count, count_next : unsigned(1 downto 0);
signal w_data_reg : std_logic_vector(15 downto 0);
signal delay_reg : std_logic_vector(5 downto 0);

begin


------ MODULE_CONNECTIONS ------
Unit_GoldenData:golden_data_read
        Port map( 
                clk => clk,
                reset => reset,
                enable => w_gold_en,
                output => w_gold_output
                );

Unit_COMP : comparator
        Port map( 
               clk => clk,
               reset => reset,
               enable => w_gold_en,
               gold_num => w_gold_output,
               matrix_num => w_matrix_num,
               status => w_comp_status
               );
                 
Unit_IN_matrix: input_matrix_read 
    Port map( 
        clk => clk,
        reset => reset,
        enable => w_enable,
        output => w_output_reg
        );


--fifo_buffer: FIFO_BUFF_ram
--          PORT MAP (
--                clk => clk,
--                srst => reset,
--                din => w_output_reg,
--                wr_en => w_enable,
--                rd_en => w_init,
--                dout => fifo_dout,
--                full => fifo_full,
--                empty => fifo_empty
--              );
      


--w_input_reg <= fifo_dout(7 downto 0);

Unit_MM: MATRIX_MULTIPLIER 
 Port map( 
       clk => clk,
       reset=> reset,
       start => w_init,
       read => w_read,
       input_matrix => w_input_reg,
       status => w_status,
       output_matrix => w_output_matrix,
       mem_flag => w_mem_flag,
       data_hold => w_data_hold,
       gold_read_en => w_gold_en
       );
       
-- Wiring connections --
clock_delay : process(clk)
begin
if rising_edge(clk) then
delay_reg(0) <= start_test;
for i in 0 to 4 loop
delay_reg(i + 1) <= delay_reg(i);
end loop;

w_init <= delay_reg(5);   -- TEST CONTROLLER PROVIDES A NEW SIGNAL HERE
end if;
end process;

dft_status <= w_comp_status;
dut_status <= w_status;
dut_mem_flag <= w_mem_flag;
test_output <= w_matrix_num;
w_enable <= w_data_hold;       -- cannot use it since the main controller generates register bank selection!!

w_read <= read_test;
w_input_reg <= w_output_reg(7 downto 0);
w_matrix_num <= (w_output_matrix) ;
gold_output <= w_gold_output;
       
end Behavioral;


