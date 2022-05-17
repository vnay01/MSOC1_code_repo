library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

package test_pkg is

-- Clock
component CLOCKGENERATOR is
  generic( clkhalfperiod :time := 100 ns );
  port( clk : out std_logic);
end component;

----- File Read 
component FILE_READ is
  generic (file_name : string; width : positive; datadelay : time);
  port (CLK, RESET :  in std_logic;
                 Q : out std_logic_vector(width-1 downto 0));
end component;

end test_pkg;


package body test_pkg is

end test_pkg;

------------------------------------------------------------------------------------
--- Clock Definition
library IEEE;
  use IEEE.std_logic_1164.all;


entity CLOCKGENERATOR is
  generic( clkhalfperiod :time := 100 ns );
  port( clk : out std_logic);
end CLOCKGENERATOR;


architecture BEHAVIORAL of CLOCKGENERATOR is 
signal dummyclk : std_logic := '0';
begin
  process
  begin
    wait for clkhalfperiod;
    dummyclk <= not dummyclk;
    clk <= dummyclk;
  end process;
end BEHAVIORAL;

--------------------------------------------------------------------------------------
--- File Read
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE std.textio.all;
USE std.standard.all;

-- New version 991203 abn

entity FILE_READ is
  generic (file_name : string; width : positive; datadelay : time);
  port (CLK, RESET :  in std_logic;
                 Q : out std_logic_vector(width-1 downto 0));
end FILE_READ;

architecture BEHAVE of FILE_READ is
begin
  process(clk)
    file INFILE : text is in FILE_NAME;
    variable IN_LINE : line;
    variable QDATA : integer;
  begin
    if (clk = '1') and (clk'event) then
      if (not(endfile(INFILE))) and (RESET='1') then
	readline(INFILE, IN_LINE);
	read(IN_LINE, QDATA);
	Q <= conv_std_logic_vector(QDATA,width) after datadelay;
      else
	Q <= conv_std_logic_vector(    0,width);
      end if;
    end if;
  end process;
end BEHAVE;
-----------------------------------------------------------------------------------------

