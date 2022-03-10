library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;

entity tb_MM_top is
--  Port ( );
end tb_MM_top;

architecture Behavioral of tb_MM_top is

-- Component
component ROM_simulate is
    port (
            clk : std_logic;
--            reset : std_logic;
            enable : in std_logic;
            data_in : in std_logic_vector( 31 downto 0);    -- Data is generated in chunks of 7 bits 
--            addr : in std_logic_vector( 3 downto 0);
            ram_addr : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector( 31 downto 0)   -- Data is STORED and READ as 14 bit word            
            );

end component;

component reader is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(31 downto 0);			--- comes from 1 RAM memory location... has 4 input matrix values
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(0) ]
            o_data :out out_port      -- refer array_pkg for type
--            o_done : out std_logic					---- goes HIGH when 8 shifts have been completed
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
      datapath_ctrl : out std_logic_vector( 5 downto 0)       -- this signal will activate section of datapath     
      );
end component;



-- Signals
signal tb_enable : std_logic;
signal tb_addr : std_logic_vector( 7 downto 0);
signal tb_data_out, tb_data_in : std_logic_vector( 31 downto 0);

-------------- GENERAL SIGNALS ------------
 signal tb_reset : std_logic;
 signal tb_clk : std_logic;
 constant period : time := 10 ns;
----- Signals for MM_controller -----
signal tb_done : std_logic_vector(5 downto 0);
signal tb_colum, tb_row :unsigned( 1 downto 0);
signal tb_MAC_clear : std_logic;
signal tb_ready     : std_logic;
signal tb_datapath_ctrl : std_logic_vector( 5 downto 0);
signal tb_SWITCH : unsigned( 1 downto 0);

----------- READER signals
signal tb_o_data: out_port;

---
--- SIGNALS end here ------
------------------- Metrics data ----------
signal CLEAR_COUNT : integer;         --Expect 80 clear counts
signal MACC_STATE_COUNT : integer;
signal RAM_STORE_STATE_COUNT : integer;
---------


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
            enable => tb_datapath_ctrl(1),
            data_in => tb_data_in,
            ram_addr => tb_addr,
            data_out => tb_data_out
            
        );

read_input: reader
port map(
        clk => tb_clk,
        reset => tb_reset,
        i_x => tb_data_out,
        i_enable => tb_datapath_ctrl(1),
        o_data => tb_o_data
            );
UUT_MMcontrol: MM_controller
  Port map ( 
        clk => tb_clk,
        reset => tb_reset,
        done =>tb_done,                 --- For simulating Load -> MACC (done <= 000100)
        colum => tb_colum,
        row => tb_row,
        SWITCH => tb_SWITCH,
        MAC_clear => tb_MAC_clear,
        ready => tb_ready,                                -- Shows status of the system
        ram_addr => tb_addr,
        datapath_ctrl => tb_datapath_ctrl      -- this signal will activate section of datapath     
        );


-- Stimulus
tb_enable <= '0' after 1*period,
             '1' after 2*period;
             


--tb_done <= "000001" after 2*period,                 --- START -> READ
--           "000100" after 50*period,                --- READ -> 
--           "010000" after 66*period;                --- LOAD -> MACC
 PROCESS
          
          begin
           for i in 1 to 10 loop
            wait for period;  
tb_done <="000001" ;                ---- START -> READ
            wait for i*period;
--tb_done<="000100";                   --- LOAD -> MACC
--           wait for i*period;
--tb_done<= "010000";                  
--           wait for i*period;

           
         end loop;
end process;


tb_reset <= '1' after 1*period,
            '0' after 2*period;
 
 -- Address : Generator
 
-- tb_addr <= x"00" after 2*period,
--            x"01" after 3*period,
--            x"02" after 4*period,
--            x"03" after 5*period,
--            x"04" after 6*period,
--            x"05" after 7*period,
--            x"06" after 8*period,
--            x"07" after 9*period,
--            x"08" after 10*period,
--            x"09" after 11*period,
--            x"0a" after 12*period,
--            x"0b" after 13*period,
--            x"0c" after 14*period,
--            x"0d" after 15*period,
--            x"0e" after 16*period,
--            x"0f" after 17*period,
--            x"07" after 18*period;
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
        RAM_STORE_STATE_COUNT <= 0;
        else
        if tb_datapath_ctrl = "001000" then
         MACC_STATE_COUNT <=  MACC_STATE_COUNT + 1;
         end if;
       if  tb_datapath_ctrl ="010000" then
       RAM_STORE_STATE_COUNT <= RAM_STORE_STATE_COUNT + 1;
        end if;
        
      end if;
    end process;

 
 
end Behavioral;
