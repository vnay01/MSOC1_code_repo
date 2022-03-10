library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use STD.textio.all;
use ieee.std_logic_textio.all;
LIBRARY WORK;
use work.COMPONENT_PKG.ALL;


entity tb_MACC_module is
--  Port ( );
end tb_MACC_module;

architecture Behavioral of tb_MACC_module is

component MAC is
	port 
	(
		x			: in unsigned(7 downto 0);        -- input matrix
		a			: in unsigned (6 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;
--		done		: out std_logic;	-- gets active when 8 multiply and 7 accumulate are done
		accum_out	: out unsigned (15 downto 0)
	);
	
end component;

component MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in  std_logic_vector(5 downto 0);
        colum : out unsigned( 1 downto 0);    -- used to select the element to load
        row : out unsigned(1 downto 0);
        SWITCH : out unsigned( 1 downto 0);             -- Used for switching positions of ROM coefficient
        MAC_clear : out std_logic;
        ready: out std_logic;                                   -- Shows status of the system
        ram_addr : out std_logic_vector(7 downto 0);        -- addresses external RAM 
        datapath_ctrl : out std_logic_vector( 5 downto 0);       -- this signal will activate section of datapath     
        write_enable :out std_logic
		);
end component;

--COMPONENT perf_module is
--	port 
--	(
--		x			: in unsigned(7 downto 0);        -- input matrix
----		a			: in unsigned (7 downto 0);       -- coefficiet elem
--		clk			: in std_logic;
--		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
--		enable      : in std_logic;            -- MM_controller / datapath_ctrl(3)
--		accum_out	: out unsigned (7 downto 0)
--	);
	
--end COMPONENT;

component max_value is
	port (
			clk : in std_logic;
			reset : in std_logic;
			enable : in std_logic;
			d_in : in std_logic_vector(31 downto 0);
			max_val_out : out std_logic_vector(31 downto 0)
			);
end component;

-------------- GENERAL SIGNALS ------------
 signal tb_reset : std_logic;
 signal tb_clk : std_logic;
 constant period : time := 10 ns;
 

-- Signals for MAC unit -----
signal tb_x : unsigned(7 downto 0);
signal tb_a : unsigned( 6 downto 0);
--signal tb_enable: std_logic;
--signal tb_clear : std_logic;
signal tb_accum_out: unsigned( 15 downto 0);

----- Signals for MM_controller -----
signal tb_done : std_logic_vector(5 downto 0);
signal tb_col, tb_row, tb_SWITCH :unsigned( 1 downto 0);
signal tb_MAC_clear : std_logic;
signal tb_ready     : std_logic;
signal tb_datapath_ctrl : std_logic_vector( 5 downto 0);
signal tb_ram_addr :std_logic_vector(7 downto 0);
signal tb_write_enable : std_logic; 

--- SIGNALS end here ------
------------------- Metrics data ----------
signal CLEAR_COUNT : integer;         --Expect 80 clear counts
signal MACC_STATE_COUNT : integer;

--------- PERF_MODULE ----------------------
signal tb_mean : unsigned(31 downto 0);
signal tb_a_pad : unsigned(7 downto 0);
signal tb_data_in : std_logic_vector(31 downto 0);
signal tb_max : std_logic_vector(31 downto 0);

begin
-- Clock process
clock_sim:process
    begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
end process;

UUT_control: MM_controller
  Port map ( 
        clk => tb_clk,
        reset => tb_reset,
        done =>tb_done,                 --- For simulating Load -> MACC (done <= 000100)
        colum => tb_col,
        row => tb_row,
        SWITCH => tb_SWITCH,
        MAC_clear => tb_MAC_clear,
        ready => tb_ready,                                -- Shows status of the system
        ram_addr => tb_ram_addr,
        datapath_ctrl => tb_datapath_ctrl,      -- this signal will activate section of datapath
        write_enable => tb_write_enable     
        );

UUT_MACC : MAC
    port map (
		      x => tb_x,
		      a => tb_a,
		      clk => tb_clk,
		      clear => tb_MAC_clear,
		      enable => tb_datapath_ctrl(3),
--		      done => tb_done,
		      accum_out => tb_accum_out  
                );
 
-- tb_a_pad <= "0"& tb_a;
 
PERF : perf_module
    port map (
            x =>unsigned(tb_data_in),
            clk => tb_clk,
            clear => tb_MAC_clear,
            enable => tb_datapath_ctrl(5),
            accum_out => tb_mean
            );

tb_data_in <= x"0000" & std_logic_vector(tb_accum_out);
MAX: max_value
	port map (
			clk => tb_clk,
			reset => tb_reset,
			enable => tb_datapath_ctrl(5),
			d_in => tb_data_in,
			max_val_out => tb_max
			);

-------------- STIMULUS -----------------


--end process;
PROCESS
begin
for i in 1 to 10 loop
tb_done <= "000001";
            wait for period;  
tb_done <="000010" ;
            wait for i*period;
         tb_done<="000100";
           wait for i*period;
          tb_done<= "010000";
           wait for i*period;
--           i <= i+1;
           end loop;
end process;
tb_reset <= '1' after 1*period,
            '0' after 2*period;

--tb_clear <=    '1' after 1*period,
--              '0' after 3*period;
----end process;

tb_x <= x"00" after 1*period,
        x"01" after 21*period,            -- 1
        x"02" after 24*period,            -- 2
        x"03" after 25*period,            -- 3
        x"04" after 26*period,            -- 4
        x"05" after 27*period;            -- 5

tb_a <= "0000000" after 1*period,
        "0001010" after 21*period,           -- 10
        "0001011" after 23*period,           -- 11
        "0001111" after 24*period;           -- 15
 
----- Data from signals
--- CLEAR COUNT

process(tb_MAC_clear, tb_reset)
begin
    if tb_reset = '1' then
        CLEAR_COUNT <= 0;
        else
    if tb_MAC_clear = '1' then
        CLEAR_COUNT <= CLEAR_COUNT + 1;
        end if;
        end if;
end process;

process(tb_datapath_ctrl)
begin
    if tb_reset = '1' then
        MACC_STATE_COUNT <= 0;
        else
        if tb_datapath_ctrl = "001000" then
         MACC_STATE_COUNT <=  MACC_STATE_COUNT + 1;
         end if;
        end if;
    end process;

end Behavioral;
