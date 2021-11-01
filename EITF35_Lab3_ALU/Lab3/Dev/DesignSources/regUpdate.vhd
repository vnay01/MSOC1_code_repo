library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regUpdate is
   port ( clk        : in  std_logic;
          reset      : in  std_logic;
          RegCtrl    : in  std_logic_vector (1 downto 0);   -- Register update control from ALU controller
          input      : in  std_logic_vector (7 downto 0);   -- Switch inputs
          A          : out std_logic_vector (7 downto 0) ;   -- Input A
          B          : out std_logic_vector (7 downto 0)    -- Input B
        );
end regUpdate;

architecture behavioral of regUpdate is

-- SIGNAL DEFINITIONS HERE IF NEEDED

begin

   -- DEVELOPE YOUR CODE HERE
   -- process to determine which registers needs to be updated based on RegCtrl signal.
   process( clk, RegCtrl, reset )
   begin
   if reset = '1' then
	A <= "00000000";
	B <= "00000000";
	elsif rising_edge(clk) then
			case RegCtrl is
			when "00" =>
		--	if RegCtrl = "00" then
			A <= input;
		--	elsif RegCtrl = "01" then
			when "01" =>
			B <= input;
		--	end if;
			when others =>
				null;
			end case;
		 end if;
	end process;
end behavioral;
