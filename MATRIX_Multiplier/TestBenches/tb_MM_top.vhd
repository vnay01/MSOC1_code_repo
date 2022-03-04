
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;


entity tb_MM_top is
--  Port ( );
end tb_MM_top;

architecture Behavioral of tb_MM_top is


-- components
component MM_top is
    Port (
            clk : in std_logic;
            reset : in std_logic;
            Input_Mat : std_logic_vector( 7 downto 0);
            prod_elem : out std_logic_vector( 15 downto 0) ;            -- This will hold 2 elements of product matrix
            status : out std_logic                                      -- Goes HIGH when the system is computing 
                                                                         -- ( i.e till RAM is filled with product elements)
            );
end component;


-- signals
signal tb_Input_Mat : std_logic_vector( 7 downto 0 );
signal tb_prod_elem : std_logic_vector( 15 downto 0);
signal tb_status : std_logic;
signal tb_reset : std_logic; 
signal tb_clk : std_logic;

constant period : time := 10 ns;



begin

-- Clock Simulation
clock: process           
        begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
        end process;

UUT_MM: MM_top
    port map(
                clk => tb_clk,
                reset => tb_reset,
                Input_Mat => tb_Input_Mat,
                prod_elem => tb_prod_elem,
                status => tb_status
                );

-- STIMULUS


tb_reset <= '1' after 1*period,
            '0' after 2*period;

--tb_i_enable <= '1' after 5*period,
--                '0' after 39*period,
--                '1' after 50*period,
--                '0' after 84*period;        -- Signal remains HIGH after 5 clock cycles.

tb_Input_Mat <= x"01" after 6*period,
          x"02" after 7*period,
          x"03" after 8*period,
          x"04" after 9*period,
          x"05" after 10*period,
          x"06" after 11*period,
          x"07" after 12*period,
          x"08" after 13*period,
          x"09" after 14*period,
          x"0a" after 15*period,
          x"0b" after 16*period,
          x"0c" after 17*period,
          x"0d" after 18*period,
          x"0e" after 19*period,
          x"0f" after 20*period,
          x"10" after 21*period,
          x"11" after 22*period,
          x"12" after 23*period,
          x"13" after 24*period,
          x"14" after 25*period,
          x"15" after 26*period,
          x"16" after 27*period,
          x"17" after 28*period,
          x"18" after 29*period,
          x"19" after 30*period,
          x"1a" after 31*period,
          x"1b" after 32*period,
          x"1c" after 33*period,
          x"1d" after 34*period,
          x"1e" after 35*period;

end Behavioral;
