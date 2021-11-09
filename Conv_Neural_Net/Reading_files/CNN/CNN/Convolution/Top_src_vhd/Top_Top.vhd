----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2018 03:29:00 PM
-- Design Name: 
-- Module Name: TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created Shenbagaraman Ramakrishnan
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.ALL;
use std.textio.all;


entity Top_Top is
    port (
            clk             : in std_logic;
            rst             : in std_logic;
            start_ext       : in std_logic;
            output_ext      : out std_logic_vector(0 downto 0);
            valid_output_ext: out std_logic      
      );

end Top_Top;

architecture Top_Top_arch of Top_Top is

type state_type_start_sig is (idle,counter,finish); -- State machine for making the switch input into valid signal for one clock cycle
signal curr_state_start, next_state_start : state_type_start_sig;
 
    component TOP is
        port (
            clk             : in std_logic;
            rst             : in std_logic;
            start_in        : in std_logic;  -- The signal to start the memory reading           
            f_in            : in std_logic_vector(3 downto 0);            
            valid_in_f      : in std_logic;            
            k_FC1_in        : in std_logic_vector(3 downto 0);
            valid_k_FC1_in  : in std_logic;
            k_FC2_in        : in std_logic_vector(3 downto 0);
            valid_k_FC2_in  : in std_logic;
            output          : out std_logic_vector(0 downto 0);
            valid_output    : out std_logic
         );
    end component;

    component TOP_Initialize is
        port (
            clk             : in std_logic;
            rst             : in std_logic;
            start_in        : in std_logic; -- External start to enable the storing of only weights into buffers
            f_in            : out std_logic_vector(3 downto 0);        
            valid_in_f      : out std_logic;        
            k_FC1_in        : out std_logic_vector(3 downto 0);
            valid_k_FC1_in  : out std_logic;
            k_FC2_in        : out std_logic_vector(3 downto 0);
            valid_k_FC2_in  : out std_logic;
            start_read      : out std_logic
         );
    end component;   
   
   
    signal filter : std_logic_vector(3 downto 0);
    signal kernel_FC1,kernel_FC2 : std_logic_vector(3 downto 0);
    signal valid_data_k_FC1,valid_data_k_FC2,valid_data_f,start_read,start_ext_sig : std_logic;
    signal valid_output_sig, valid_output_sig_d, valid_output_sig_q : std_logic;
    signal output_sig, output_sig_d , output_sig_q: std_logic_vector(0 downto 0);
    signal counter_d,counter_q : std_logic_vector (23 downto 0);
    
    begin
    
output_ext       <=   output_sig_q       ;
valid_output_ext <=   valid_output_sig_q ;
    process(clk,rst)
    begin  
       if(rst = '1') then
            curr_state_start   <= idle;
            counter_q          <= (others => '0');
            valid_output_sig_q <= '0';
            output_sig_q       <=(others => '0');
       elsif(clk'event and clk='1') then
            curr_state_start   <= next_state_start;
            counter_q          <= counter_d ;
            valid_output_sig_q <= valid_output_sig_d;
            output_sig_q       <= output_sig_d;
      end if;
    end process;      
    
-- DUT
inst_TOP : TOP
    port map(
        clk             => clk,
        rst             => rst,
        start_in        => start_read,
        f_in            => filter,
        valid_in_f      => valid_data_f,
        K_FC1_in        => kernel_FC1,
        valid_k_FC1_in  => valid_data_k_FC1,
        K_FC2_in        => kernel_FC2,
        valid_k_FC2_in  => valid_data_k_FC2,
        output          => output_sig,
        valid_output    => valid_output_sig
        );
        
TOP_Initialize_inst : TOP_Initialize 
        port map (
        clk             =>  clk,
        rst             =>  rst,
        start_in        =>  start_ext_sig, 
        f_in            =>  filter,        
        valid_in_f      =>  valid_data_f,
        k_FC1_in        =>  kernel_FC1,
        valid_k_FC1_in  =>  valid_data_k_FC1,
        k_FC2_in        =>  kernel_FC2,
        valid_k_FC2_in  =>  valid_data_k_FC2,
        start_read      =>  start_read
        );
        
process(start_ext,curr_state_start)  -- to make the start high for one clock cycle
 begin
 next_state_start <= curr_state_start;
 start_ext_sig <= '0';
    
    case curr_state_start is
     when idle =>
                if(start_ext = '1') then
                    next_state_start <= counter;
                else
                    next_state_start <= idle;                 
                end if;
     when counter =>
                start_ext_sig <= '1';
                next_state_start <= finish;
     
     when others =>
                start_ext_sig <= '0';
     end case; 
     
    
 end process; 
 
 process(valid_output_sig, output_sig, valid_output_sig_q, output_sig_q)  --  To latch the outputs for long time
 begin
     if(valid_output_sig = '1')then
            valid_output_sig_d <= valid_output_sig;
            output_sig_d       <= output_sig;           
     else           
            valid_output_sig_d <= valid_output_sig_q;
            output_sig_d       <= output_sig_q;
     end if;
 end process;
        
end Top_Top_arch;