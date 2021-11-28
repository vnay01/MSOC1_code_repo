----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2018 11:12:22 PM
-- Design Name: 
-- Module Name: Top_Initialize - Behavioral
-- Project Name: Initialize the coefficients
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
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_unsigned.ALL;
use std.textio.all;
use std.standard.all;


entity TOP is
    port (
        clk             : in std_logic;
        rst             : in std_logic;
        start_in        : in std_logic;        
        f_in            : in std_logic_vector(3 downto 0);
        valid_in_f      : in std_logic;
        k_FC1_in        : in std_logic_vector(3 downto 0);
        valid_k_FC1_in  : in std_logic;
        k_FC2_in        : in std_logic_vector(3 downto 0);
        valid_k_FC2_in  : in std_logic;
        output          : out std_logic_vector(0 downto 0);
        valid_output    : out std_logic
	 );
end TOP;

architecture TOP_arch of TOP is

    component CONV_TOP is
        port (
            clk         : in std_logic;
            rst         : in std_logic;
            start_in    : in std_logic;
            f_in        : in std_logic_vector(3 downto 0);
            valid_in_f  : in std_logic;
            ofmap       : out std_logic_vector(3 downto 0);
            valid_ofmap : out std_logic
         );
    end component;
    
    component Pooling_TOP is
        port (
            clk             : in std_logic;
            rst             : in std_logic;
            ofmap_RELU      : in std_logic_vector(3 downto 0);
            valid_data      : in std_logic;
            pooling_out     : out std_logic_vector(3 downto 0);
            valid_pooling   : out std_logic
            );
    end component;
    
    component FC_TOP is
        port (
            clk             : in std_logic;
            rst             : in std_logic;
            kernel_FC1_in   : in std_logic_vector(3 downto 0);
            valid_FC1_in    : in std_logic;
            kernel_FC2_in   : in std_logic_vector(3 downto 0);
            valid_FC2_in    : in std_logic;
            pooling         : in std_logic_vector(3 downto 0);
            valid_pooling   : in std_logic;
            output          : out std_logic_vector(0 downto 0);
            valid_output    : out std_logic
         );
    end component;
    
    signal valid_ofmap : std_logic;
    signal ofmap_RELU : std_logic_vector(3 downto 0);
    signal pooling_out : std_logic_vector(3 downto 0);
    signal valid_pooling : std_logic;
    

    begin
        
    CONV_TOP_inst : CONV_TOP
        port map(
            clk         => clk,
            rst         => rst,
            start_in    => start_in,
            f_in        => f_in,
            valid_in_f  => valid_in_f,
            ofmap       => ofmap_RELU,
            valid_ofmap => valid_ofmap
            );
    
    Pooling_inst : Pooling_TOP
        port map(
            clk             => clk,
            rst             => rst,
            ofmap_RELU      => ofmap_RELU,
            valid_data      => valid_ofmap,
            pooling_out     => pooling_out,
            valid_pooling   => valid_pooling
            );
            
    FC_inst : FC_TOP
        port map(
            clk             => clk,
            rst             => rst,
            kernel_FC1_in   => k_FC1_in,
            valid_FC1_in    => valid_k_FC1_in,
            kernel_FC2_in   => k_FC2_in,
            valid_FC2_in    => valid_k_FC2_in,
            pooling         => pooling_out,
            valid_pooling   => valid_pooling,
            output          => output,
            valid_output    => valid_output  
            );
            

end TOP_arch;