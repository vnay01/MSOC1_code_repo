---- STORES calculated products into RAM -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.COMPONENT_PKG.all;
--

entity RAM_STORE is
 Port ( 
		clk : in std_logic;
		reset : in std_logic;
		enable : in std_logic;
		write_enable :  in std_logic;
		address : in std_logic_vector(7 downto 0);
		din : in std_logic_vector( 31 downto 0);
		dout : out std_logic_vector( 31 downto 0)

       );
end RAM_STORE;

architecture Behavioral of perf_module is


component Input_Matrix IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;


-- SIGNALS

-- signal addr : std_logic_vector( 7 downto 0);


begin

----------- for Simulation  -- Insert RAM WRAPPER HERE -----

------------- Using xilinx Block RAM for testing---------
PROD_STORE : Input_Matrix
	port map (
			clka => clk,
			ena => enable,
			wea => write_enable,
			addra => address,
			dina => din,
			douta => dout
			);


end Behavioral;
