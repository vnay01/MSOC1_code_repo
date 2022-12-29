-- 25 ms debouncer
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity Debounce_Switch is
  port (
    clk    : in  std_logic;
    button_in : in  std_logic;
    button_out : out std_logic
    );
end entity Debounce_Switch;
 
architecture RTL of Debounce_Switch is
 
  -- Set for 1000000 clock ticks of 100 MHz clock (10 ms)
  constant DEBOUNCE_LIMIT : integer := 100000;
 
  signal count : integer range 0 to DEBOUNCE_LIMIT := 0;
  signal state : std_logic := '0';
 
begin
 
  proc_debounce : process (clk)
  begin
    if rising_edge(clk) then
 
      -- Switch input is different than internal switch value, so an input is
      -- changing.  Increase counter until it is stable for c_DEBOUNCE_LIMIT.
      if (button_in /= state and count < DEBOUNCE_LIMIT) then
        count <= count + 1;
 
      -- End of counter reached, switch is stable, register it, reset counter
      elsif count = DEBOUNCE_LIMIT then
        state <= button_in;
        count <= 0;
 
      -- Switches are the same state, reset the counter
      else
        count <= 0;
 
      end if;
    end if;
  end process;
 
  -- Assign internal register to output (debounced!)
  button_out <= state;
 
end architecture RTL;