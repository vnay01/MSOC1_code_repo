

-- Module for loading input matrix elements into 32 number of 8 bit registers.
-- Assuming 8-bit parallel input to the system
-- How the Input Matrix is entered ... will effect product Matrix
-- Input Matrix must be entered in row-wise order.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;


entity load_module is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(7 downto 0);
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(0) ]
            o_data_odd, o_data_even :out out_port;      -- refer array_pkg for type
            o_done : out std_logic
  );
end load_module;

architecture Behavioral of load_module is

signal done_next : std_logic;
signal input_buffer : std_logic_vector(7 downto 0);
signal counter, counter_next : unsigned(4 downto 0);          -- will be used to count to 16
--signal load_done : std_logic;                   -- goes to HIGH when 32 clock cycles have been completed

type reg_array is array (0 to 31) of std_logic_vector(7 downto 0);
signal X_reg : reg_array;
signal o_data_buffer1, o_data_buffer1_next , o_data_buffer2, o_data_buffer2_next : out_port;



begin



reg_update: process(clk, reset, i_enable, i_x,input_buffer, counter_next, o_data_buffer1, o_data_buffer2)
begin


    if reset = '1' then
        counter <= (others =>'0');
        o_data_buffer1_next <= (others=>(others =>'0'));
        o_data_buffer2_next <= (others=>(others =>'0'));
        X_reg(0)<=(others =>'0');
    elsif rising_edge(clk) then    
        o_data_buffer1_next <= o_data_buffer1;
        o_data_buffer2_next <= o_data_buffer2;
        counter <= counter_next;
        if i_enable = '1' then
        X_reg(1 to 31) <= X_reg( 0 to 30);
        end if;
        X_reg(0) <= i_x;
--    end if;
         for i in 0 to 15 loop
            o_data_buffer1(i) <= X_reg(2*i);
            o_data_buffer2(i) <= X_reg(2*i+1);
         end loop;
         end if;
end process;

DATA_Assign: process(clk, o_data_buffer1, o_data_buffer2 )
begin
        if rising_edge(clk) then
        for i in 0 to 15 loop 
        o_data_odd(i) <= o_data_buffer1(i);
        o_data_even(i) <= o_data_buffer2(i); 
        end loop;
        end if;
end process;


data_store: process(clk, counter)
begin
    if rising_edge(clk) then
    counter_next <= counter;    
    if i_enable = '1' then 
        counter_next <= counter + 1;

      end if;
   
   if counter /= 16 then
     o_done <= '0';
     
     else
     counter_next <= (others=>'0');
     o_done <= '1';
     end if;
   end if;
end process;


end Behavioral;
