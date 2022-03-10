library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;


entity tb_LOADER is
--  Port ( );
end tb_LOADER;

architecture Behavioral of tb_LOADER is

---------------- COMPONENTS -----------
component LOADER is
    Port (  
            clk : in std_logic;
            enable : in std_logic;                  ------ comes from datapath_ctrl(2)
            load_signal: in unsigned( 1 downto 0);
            in_x_odd: in out_port;                  ----- array of ODD elements of Input Matrix 
            in_x_even : in out_port;                ----- array of even elements of Input Matrix
            out_x_odd: out std_logic_vector( 7 downto 0);       ----individual element of Input Matrix for calculation
            out_x_even: out std_logic_vector( 7 downto 0);      ----individual element of Input Matrix for calculation
            out_a_odd : out std_logic_vector( 6 downto 0);      ---- individual element of co-efficient matrix for calculation
            out_a_even : out std_logic_vector( 6 downto 0);     ---- individual element of co-efficient matrix for calculation
            done : out std_logic                                ---- goes HIGH when loading is done...... will be useful when timing has to be met!!!
            
             );
end component;

component load_module is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(7 downto 0);
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(0) ]
            o_data_odd, o_data_even :out out_port;      -- refer array_pkg for type
            o_done : out std_logic
  );
end component;


------ SIGNAL -------
signal tb_clk : std_logic;
signal tb_reset :std_logic;
signal tb_i_enable, tb_load_en : std_logic;
signal tb_i_x : std_logic_vector( 7 downto 0);
--signal tb_count,tb_count_next: unsigned( 4 downto 0 );
signal tb_o_data_odd, tb_o_data_even : out_port;
signal tb_loader_done, tb_reader_done : std_logic;
signal tb_x_od, tb_x_ev : std_logic_vector(7 downto 0);
signal tb_a_od, tb_a_ev : std_logic_vector(6 downto 0);
signal tb_load_signal : unsigned(1 downto 0);           -- simulate signals coming from MM_controller

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


----- Connections ----
reader : load_module
port map (
            clk => tb_clk,
            reset => tb_reset,
            i_x => tb_i_x,
            i_enable => tb_i_enable,
            o_data_odd => tb_o_data_odd,
            o_data_even => tb_o_data_even,
            o_done => tb_reader_done
            );


tb_load_en <= not(tb_i_enable);
load: LOADER
port map (

            clk =>  tb_clk,
            enable =>tb_load_en,                ------ comes from datapath_ctrl(2)
            load_signal => tb_load_signal,
            in_x_odd  => tb_o_data_odd, 
            in_x_even => tb_o_data_even,
            out_x_odd=> tb_x_od,
            out_x_even=> tb_x_ev,
            out_a_odd => tb_a_od,
            out_a_even => tb_a_ev,
            done => tb_loader_done
            
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

tb_load_signal <= "00" after 80*period,
                  "01" after 90*period;
                  
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
