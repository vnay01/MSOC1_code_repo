----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vinay Singh
-- 
-- Create Date: 06.02.2022 05:30:56
-- Design Name: 
-- Module Name: Full Adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity full_adder is
port (
        in_A : in std_logic;
        in_B : in std_logic;
        in_carry : in std_logic;
        out_sum : out std_logic;
        out_carry : out std_logic
        );
 end full_adder;
 
 architecture struc of full_adder is
 
 -- SIGNALS
 signal A, B, C_in, SUM, C_out : std_logic;
  
 
 
 begin
 
 A <= in_A;
 B <= in_B;
 C_in <= in_carry;
 
 out_sum <= SUM;
 out_carry <= C_out;
 
 -- Struct for SUM
  SUM <= A xor B xor C_in;
  C_out <= (( A xor B )and C_in) or (A and B);
 
  
  
 
 end struc;

