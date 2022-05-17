library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.reg_pkg.all;

entity TOP_DESIGN is
  Port ( 
         clk : in std_logic;
         reset : in std_logic;
         start: in std_logic;
         input : in std_logic_vector( 7 downto 0 );
         status : out std_logic;
         output: out std_logic_vector( 7 downto 0 )    
            );
end TOP_DESIGN;

architecture Behavioral of TOP_DESIGN is

begin


end Behavioral;
