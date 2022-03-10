library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;


entity tb_load_module is
--  Port ( );
end tb_load_module;

architecture Behavioral of tb_load_module is

-- Component

component load_module is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(7 downto 0);
            i_enable : in std_logic;
            o_data_odd, o_data_even :out out_port;      -- refer array_pkg for type
            o_done : out std_logic
  );
end component;

component load_module_v2 is
  Port (
        clk: in std_logic;
        reset : in std_logic;
        in_x : in std_logic_vector(7 downto 0);
        i_enable : in std_logic;                --  datapath_ctrl(0) of MM_controller
        o_data_odd, o_data_even :out out_port;      -- refer array_pkg for type
        o_done : out std_logic
             );
end component;




-- SIGNALS

signal tb_clk : std_logic;
signal tb_reset :std_logic;
signal tb_i_enable : std_logic;
signal tb_i_x : std_logic_vector( 7 downto 0);
--signal tb_count,tb_count_next: unsigned( 4 downto 0 );
signal tb_o_data_odd, tb_o_data_even : out_port;
signal tb_o_done : std_logic;

constant period : time := 10 ns;

signal start : std_logic;



begin
-- Clock process
clock_sim:process
    begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
end process;


UUT_load : load_module
port map (
            clk => tb_clk,
            reset => tb_reset,
            i_x => tb_i_x,
            i_enable => tb_i_enable,
            o_data_odd => tb_o_data_odd,
            o_data_even => tb_o_data_even,
            o_done => tb_o_done
  );

-- STIMULUS
--tb_stim_enb <= tb_i_enable;

tb_reset <= '1' after 1*period,
            '0' after 2*period;





--process(tb_clk)
--begin
--if tb_stim_enb = '1' then
start <= '0' after 1*period,
         '1' after 2*period;

process(start)
begin
if start = '1' then

for i in 1 to 2 loop
tb_i_enable <= '1' after 5*i*period,
                '0' after 38*i*period;            -- to Simulate whether values are still available after enable signal has been disabled

tb_i_x <= x"01" after 6*i*period,
          x"02" after 7*i*period,
          x"03" after 8*i*period,
          x"04" after 9*i*period,
          x"05" after 10*i*period,
          x"06" after 11*i*period,
          x"07" after 12*i*period,
          x"08" after 13*i*period,
          x"09" after 14*i*period,
          x"0a" after 15*i*period,
          x"0b" after 16*i*period,
          x"0c" after 17*i*period,
          x"0d" after 18*i*period,
          x"0e" after 19*i*period,
          x"0f" after 20*i*period,
          x"10" after 21*i*period,
          x"11" after 22*i*period,
          x"12" after 23*i*period,
          x"13" after 24*i*period,
          x"14" after 25*i*period,
          x"15" after 26*i*period,
          x"16" after 27*i*period,
          x"17" after 28*i*period,
          x"18" after 29*i*period,
          x"19" after 30*i*period,
          x"1a" after 31*i*period,
          x"1b" after 32*i*period,
          x"1c" after 33*i*period,
          x"1d" after 34*i*period,
          x"1e" after 35*i*period,
          x"20" after 36*i*period,
          x"21" after 37*i*period;
          end loop;
          end if;
end process;
end Behavioral;
