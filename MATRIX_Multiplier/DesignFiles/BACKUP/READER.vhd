

-- Module for loading input matrix elements into 32 number of 8 bit registers.
-- Assuming 8-bit parallel input to the system
-- How the Input Matrix is entered ... will effect product Matrix
-- Input Matrix is stored column-wise as 32 bit 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;


entity reader is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(31 downto 0);			--- comes from 1 RAM memory location... has 4 input matrix values
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(1) ]
            o_data :out out_port      -- refer array_pkg for type
--            o_done : out std_logic					---- goes HIGH when 8 shifts have been completed
  );
end reader;

architecture Behavioral of reader is

signal done_next : std_logic;
signal input_buffer : std_logic_vector(31 downto 0);
signal counter, counter_next : unsigned(4 downto 0);          -- will be used to count to 16
signal load_done : std_logic;                   -- goes to HIGH when 8 counts have been completed

--type reg_array is array (31 downto 0) of std_logic_vector(7 downto 0);
--signal X_reg : std_logic_vector(0 to 255);
--signal X_reg : std_logic_vector(255 downto 0);
signal X_reg : out_port;        
signal o_data_buffer : out_port;



begin

process(clk, i_enable, reset, input_buffer, i_x, o_data_buffer)

begin   
    
        if reset = '1' then
        X_reg <=(others =>(others =>'0'));
        input_buffer <= (others =>'0');
else
    if rising_edge(clk) then
        if i_enable = '1' then
            input_buffer <= i_x;
--            X_reg(0 to 31) <= input_buffer;         --- Bits reversed
--            X_reg(32 to 255) <= X_reg(0 to 223);            -- right shift
            
--            X_reg(31 downto 0) <= input_buffer;
--            X_reg( 255 downto 8 ) <= X_reg(7 downto 0);
            X_reg(0) <= input_buffer(7 downto 0);
            X_reg(1) <= input_buffer(15 downto 8);
            X_reg(2) <= input_buffer(23 downto 16);
            X_reg(3) <= input_buffer(31 downto 24);
            X_reg(31 downto 4) <= X_reg(27 downto 0);
            for i in 0 to 31 loop            
            o_data(i) <= o_data_buffer(i);
            end loop;
            end if;
        
        end if;
        end if;
end process;

output_assig : process(clk, X_reg)
begin
        if rising_edge(clk) then
        
       for i in 0 to 31 loop
        o_data_buffer(i) <= X_reg(i);
        end loop;

      end if;               
end process;



end Behavioral;
