

-- Module for loading input matrix elements into 32 number of 8 bit registers.
-- Assuming 8-bit parallel input to the system

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
            i_enable : in std_logic;
            o_data_odd, o_data_even :out out_port;      -- refer array_pkg for type
            o_done : out std_logic
  );
end load_module;

architecture Behavioral of load_module is

signal done_next : std_logic;
signal input_buffer : std_logic_vector(7 downto 0);
signal counter, counter_next : unsigned(4 downto 0);          -- will be used to count to 16
signal load_done : std_logic;                   -- goes to HIGH when 32 clock cycles have been completed

type reg_array is array (0 to 31) of std_logic_vector(7 downto 0);
signal X_reg, X_reg_next : reg_array;



begin

input_buffer <= i_x;
--process(i_enable)
--begin
--if i_enable = '1' then
--input_buffer <= i_x;
--else
--input_buffer <= (others => '0');
--end if;

--end process;

reg_update: process(clk, reset, i_enable, input_buffer, counter_next)
begin

   if rising_edge(clk) then
    if reset = '1' then
        counter <= (others =>'0');
--        X_reg(0) <= (others =>'0');
        else
   
        counter <= counter_next;
        X_reg(0) <= input_buffer;
        if i_enable = '1' then
        for i in 31 downto 1 loop
            X_reg(i) <= X_reg(i-1);     -- takes care of shifting data into registers.
        end loop;
        for i in 0 to 15 loop
            o_data_odd(i) <= X_reg(2*i);
            o_data_even(i) <= X_reg(2*i+1);
        end loop;
        end if;
     end if;
    end if;
end process;

data_store: process(clk, counter)
begin
    if rising_edge(clk) then
    if i_enable = '1' then 
        counter_next <= counter + 1;
        else
        counter_next <= (others =>'0');
      end if;
     if counter /= 17 then
     load_done <= '0';
     else
     load_done <= '1';
     end if;
   end if;
end process;


process(clk, load_done)
begin
    if rising_edge(clk) then
        if load_done = '1' then
--           for i in 0 to 15 loop
--            o_data_odd(i) <= X_reg(2*i);
--            o_data_even(i) <= X_reg(2*i+1);
--            end loop;
            o_done <= '1';
        else
--              for i in 0 to 15 loop
--              o_data_odd(i) <= (others=>'0');
--              o_data_even(i) <= (others=>'0');
--                end loop;
            o_done <= '0';
        end if;
      end if;
        
        end process;
end Behavioral;
