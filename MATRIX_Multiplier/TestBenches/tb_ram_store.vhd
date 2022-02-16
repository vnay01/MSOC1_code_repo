library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library work;
--use work.components_pkg.all;


entity tb_ram_store is
--  Port ( );
end tb_ram_store;

architecture Behavioral of tb_ram_store is

-- Component

component ram_store is
Port ( 
        clk : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(16 downto 0);
        write_done: out std_logic;
        data_out : out std_logic_vector(16 downto 0);
        ram_en : in std_logic;              -- comes from control Unit - datapath_ctrl enable(7)
        ram_mat_done : out std_logic;       -- goes to HIGH when product matrix if filled
        ram_full : out std_logic            -- goes to HIGH when RAM is full
        );
end component;


-- Signals
signal tb_data_in , tb_data_out: std_logic_vector(16 downto 0);
signal tb_write_done : std_logic;
signal tb_ram_en : std_logic;
signal tb_ram_mat_done : std_logic;
signal tb_ram_full : std_logic;

signal tb_reset , tb_clk : std_logic; 

constant period : time := 10 ns;

begin

UUT6: ram_store
port map (
            clk => tb_clk,
            reset => tb_reset,
            data_in => tb_data_in,
            write_done => tb_write_done,
            data_out => tb_data_out,
            ram_en => tb_ram_en,
            ram_mat_done => tb_ram_mat_done,
            ram_full => tb_ram_full
            );
 
clock: process
    begin
    tb_clk <= '0';
    wait for period/2;
    tb_clk <= '1';
    wait for period/2;
    end process;
    
-- STIMULUS 
    tb_reset <= '1' after 1*period,
                '0' after 2*period;
 

process
begin
for i in 1 to 5 loop
tb_ram_en <= '0' ;
wait for (i)*period;
tb_ram_en <= '1';
wait for (i+1)*period;
end loop;
end process; 

-- process               
  
--   begin  
--    tb_ram_en <= '0';
--   for i in 0 to 5 loop      
--    tb_ram_en <= '1' after (i+1)*period;
----    tb_ram_en <= '0' after (i+2)*period;
----                  '1' after 7*period,
----                  '0' after 9*period;
--                  end loop;
--    end process;
--    tb_ram_write <= '1' after 4*period,
--                    '0' after 6*period;
                    
    tb_data_in <= "0" & x"0001" after 3*period,
                  "0" & x"0010" after 6*period,
                   "0" & x"0ff1" after 7*period;
    
end Behavioral;
