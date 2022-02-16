----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vinay Singh
-- 
-- Create Date: 09.02.2022 10:05:28
-- Design Name: 
-- Module Name: Matrix_Multiplier_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.components_pkg.all;
use work.controller_pkg.all;
use work.ram_control_pkg.all;
--use work.array_pkg.all;


entity Matrix_Multiplier_top is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : std_logic;
        X : in std_logic_vector(7 downto 0);        -- Input Matrix -- User input
        A : in std_logic_vector(6 downto 0);        -- Co-efficient matrix comes from ROM
        busy : out std_logic;                       -- remains HIGH when system is calculating
        ready : out std_logic                       -- goes HIGH when the system is ready for next input
        );
end Matrix_Multiplier_top;

architecture Behavioral of Matrix_Multiplier_top is

-- COMPONENT

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


-- SIGNALS to connect components and outputs
signal done : std_logic;            -- connects datapath : done to controller : done
signal datapath_ctrl : std_logic_vector(6 downto 0);
signal reg_X_odd, reg_X_odd_next  : std_logic_vector(7 downto 0);  
signal reg_X_even, reg_X_even_next : std_logic_vector(7 downto 0);        -- will hold 8 bits of X
signal reg_A_odd, reg_A_even : std_logic_vector(6 downto 0);        -- will hold 7 bits of A
signal elem_prod_mat : std_logic_vector(16 downto 0);               -- goes to RAM 

signal i_mat_count, i_mat_count_next: unsigned(3 downto 0);             -- counters
signal data_out : std_logic_vector(16 downto 0);
signal ram_full : std_logic;
signal write_down : std_logic;
signal ram_en : std_logic;

signal load_done : std_logic;
signal X_odd, X_even : out_port;        -- will be used to store one element of input matrix 
                                                            -- which will be fed to next stage

begin


-- Controller
controller : MM_controller
port map(
            clk => clk,
            reset => reset,
            done => done,           -- comes from DATAPATH
            datapath_ctrl => datapath_ctrl
            );

-- Load elements
-- 
load: load_module
port map(
            clk => clk,
            reset => reset,
            i_x => X,
            i_enable => datapath_ctrl(3),
            o_data_odd => X_odd ,
            o_data_even =>X_even ,
            o_done =>load_done
  );

-- register update
process(i_mat_count, load_done, clk)
begin
        if load_done = '1' then
        if rising_edge(clk) then
        i_mat_count_next <= i_mat_count + 1;
        reg_X_odd_next <= X_odd(to_integer(i_mat_count));
        reg_X_even_next <= X_even(to_integer(i_mat_count));
        end if;
        else
        i_mat_count_next <= i_mat_count;
        reg_X_odd_next <= (others => '0');
        reg_X_even_next <= (others => '0');
        end if;        
            
end process;

counter_process:process(clk, reset, i_mat_count_next,reg_X_odd_next, reg_X_even_next )
begin
   if reset = '1' then
   i_mat_count<= (others =>'0');
   reg_X_odd <= (others =>'0');
   reg_X_even <= (others =>'0');
   else
   if rising_edge(clk) then
    i_mat_count <= i_mat_count_next;
    reg_X_odd <= reg_X_odd_next;
    reg_X_even <= reg_X_even_next;
    end if;
    end if;
end process;


-- DataPath
dataPath : PE_module
port map (
            clk => clk,
            reset => reset,
            enable => datapath_ctrl,           -- comes from datapath_ctrl
            in_X_odd => reg_X_odd,
            in_X_even=> reg_X_even,
            in_A_odd => reg_A_odd,
            in_A_even => reg_A_even,
            out_elem => elem_prod_mat,         -- goes to RAM
            done => done
            );

ram_en <= datapath_ctrl(2) and datapath_ctrl(1) and (not datapath_ctrl(0));

ram_module : ram_store
port map (
            clk => clk,
            reset => reset,
            data_in => elem_prod_mat,
            ram_en => ram_en,
            write_done => write_down,
            data_out => data_out,
            ram_mat_done => busy,
            ram_full => ram_full
            );
-- GLUE logic goes here

end Behavioral;
