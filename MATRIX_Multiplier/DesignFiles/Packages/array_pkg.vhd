library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package array_pkg is

type out_port is array(15 downto 0) of std_logic_vector(7 downto 0);
type rom_out is array( 15 downto 0) of std_logic_vector( 6 downto 0);   -- use it for ROM read out

end package;

package body array_pkg is

end array_pkg;
