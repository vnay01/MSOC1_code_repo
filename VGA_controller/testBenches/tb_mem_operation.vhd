-- test bench for memory read/ write operation --
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;


entity tb_mem_operation is

end tb_mem_operation;

architecture beh of tb_mem_operation is

-- component definitions


component mem_operations is
	port (  
	       clk : in std_logic;
	       reset : in std_logic;
	       control_signal: in std_logic_vector(1 downto 0); -- comes from memory controller module
	       data_in: in std_logic_vector(7 downto 0);   -- data from keyboard : 8-bits.
	       data_out: out std_logic_vector(7 downto 0)  -- data out from memory : 8-bits	       
		  );			
end component;



-- signals 
signal tb_clk: std_logic;
signal tb_reset: std_logic := '0';
signal tb_control_signal : std_logic_vector(1 downto 0);
signal tb_data_in, tb_data_out : std_logic_vector (7 downto 0);

constant period : time := 10 ns;


begin


------------------------------DUT ---------------------
DUT: mem_operations
port map(
            clk => tb_clk,
            reset => tb_reset,
            control_signal => tb_control_signal,
            data_in => tb_data_in,
            data_out => tb_data_out           
        );
        
        
----------- clock simulation---------------------
clock :process
    begin
        tb_clk <= '0';
      wait for period/2;
        tb_clk <= '1';
      wait for period/2;
   end process;
  
  
 
  
  
----------------------------------------
----------Stimulus ---------------------
tb_control_signal <= "00" after 2*period,
                     "01" after 5*period,       --- write    --- 231
                     "00" after 6*period,       
                     "01" after 7*period,       --- write   --- 001
                     "11" after 8*period,       
                     "01" after 9*period,       --- write    --- 130
                     
                     "10" after 11*period,      --- Read         001
                     "10" after 12*period,      --- Read        130
                     "10" after 13*period,      --- Read        231
                     "00" after 14*period;      --- No action



tb_data_in <= "11111111" after 5*period,        --- 255
              "11100111" after 7*period,        --- 231 
              "10000010" after 9*period,        --- 130---- to signify
              "00000001" after 10*period;        --- 001          


tb_reset <= '1' after 1*period,
            '0' after 2*period,
            '1' after 15*period;
end beh;
  
