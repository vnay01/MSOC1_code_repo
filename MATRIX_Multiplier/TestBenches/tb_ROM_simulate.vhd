library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_ROM_simulate is
--  Port ( );
end tb_ROM_simulate;

architecture Behavioral of tb_ROM_simulate is

-- Component
component ROM_simulate is

    port (
            clk : std_logic;
--            reset : std_logic;
            enable : in std_logic;
--            data_in : in std_logic_vector( 6 downto 0);    -- Data is generated in chunks of 7 bits 
            addr : in std_logic_vector( 3 downto 0);
            data_out : out std_logic_vector( 13 downto 0)   -- Data is STORED and READ as 14 bit word            
            );
end component;



-- Signals
signal tb_enable : std_logic;
signal tb_addr : std_logic_vector( 3 downto 0);
signal tb_data_out : std_logic_vector( 13 downto 0);
signal tb_clk : std_logic;
constant period : time := 10 ns;


begin


-- Clock Simulation
CLOCK_sim : process
    begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
end process;

UUT_ROM : ROM_simulate
port map (
            clk => tb_clk,
            enable => tb_enable,
            addr => tb_addr,
            data_out => tb_data_out
            
        );


-- Stimulus
tb_enable <= '0' after 1*period,
             '1' after 2*period;
             
             
--READ_Proc : process( tb_clk, tb_addr )
--begin
--    for i in 0 to 15 loop
--        tb_addr <= x"1" after (i+2)*period;
--        end loop;
--    end process;
 
 -- Address : Generator
 
 tb_addr <= x"0" after 2*period,
            x"1" after 3*period,
            x"2" after 4*period,
            x"3" after 5*period,
            x"4" after 6*period,
            x"5" after 7*period,
            x"6" after 8*period,
            x"7" after 9*period,
            x"8" after 10*period,
            x"9" after 11*period,
            x"a" after 12*period,
            x"b" after 13*period,
            x"c" after 14*period,
            x"d" after 15*period,
            x"e" after 16*period,
            x"f" after 17*period,
            x"7" after 18*period;
 
 
end Behavioral;
