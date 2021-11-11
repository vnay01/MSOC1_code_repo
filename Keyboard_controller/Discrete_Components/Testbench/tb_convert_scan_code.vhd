---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_convert_scan_code is
--  Port ( );
end tb_convert_scan_code;

architecture Behavioral of tb_convert_scan_code is

component convert_scan_code is
	port (
			clk: in std_logic;
			data_in : in std_logic;
			shift_trigger: in std_logic;
			data_out: out std_logic_vector(9 downto 0);
			valid_code : out std_logic
			);
	end component;
	
---- signals
signal tb_clk, tb_data_in: std_logic;
signal tb_data_out : std_logic_vector(9 downto 0);
--signal tb_shift_register: std_logic_vector(9 downto 0);
signal tb_valid_code : std_logic ;
signal tb_shift_trigger : std_logic;
constant period :time := 10 ns;
constant data_period :time := 3 ns;
constant N : integer := 1;



begin

DUT_convert_scan_code: convert_scan_code
    port map(
               clk => tb_clk,
               data_in => tb_data_in,
               shift_trigger => tb_shift_trigger,
               data_out => tb_data_out,
               valid_code => tb_valid_code
               );

clock_process : process
    begin
    tb_clk <= '0';
    wait for period;
    tb_clk <= '1';
    wait for period;
    end process;



---- ###### User data ##### -----
   tb_data_in <= '0',
                 '1' after 2*N*period,
                 '0' after 3*N*period,
                 '1' after 4*N*period,
                 '0' after 6*N*period,
                 '1' after 7*N*period,
                 '0' after 10*N*period,
                 '1' after 11*N*period,
                 '1' after 12*N*period,
                 '0' after 13*N*period,
                 '0' after 14*N*period,
                 '1' after 15*N*period;
                 
    tb_shift_trigger <= '0',
                        '1' after 4*period;
end Behavioral;
