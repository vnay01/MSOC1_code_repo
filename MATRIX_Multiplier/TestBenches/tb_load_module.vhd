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

-- SIGNALS

signal tb_clk : std_logic;
signal tb_reset :std_logic;
signal tb_i_enable : std_logic;
signal tb_i_x : std_logic_vector( 7 downto 0);
signal tb_o_data_odd, tb_o_data_even : out_port;
signal tb_o_done : std_logic;

constant period : time := 10 ns;



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

tb_reset <= '1' after 1*period,
            '0' after 2*period;

tb_i_enable <= '1' after 5*period;        -- Signal remains HIGH after 5 clock cycles.

tb_i_x <= x"01" after 6*period;
--          x"02" after 7*period,
--          x"03" after 8*period,
--          x"04" after 9*period,
--          x"05" after 10*period,
--          x"06" after 11*period,
--          x"07" after 12*period,
--          x"08" after 13*period,
--          x"09" after 14*period,
--          x"0a" after 15*period,
--          x"0b" after 16*period,
--          x"0c" after 17*period,
--          x"0d" after 18*period,
--          x"0e" after 19*period,
--          x"0f" after 20*period,
--          x"10" after 21*period,
--          x"11" after 22*period,
--          x"12" after 23*period,
--          x"13" after 24*period,
--          x"14" after 25*period,
--          x"15" after 26*period,
--          x"16" after 27*period;

end Behavioral;
