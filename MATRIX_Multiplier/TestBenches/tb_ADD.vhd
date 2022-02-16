----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2022 12:53:50
-- Design Name: 
-- Module Name: tb_ADD - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ADD is
--  Port ( );
end tb_ADD;

architecture Behavioral of tb_ADD is

-- components
component full_adder is
port (
        in_A : in std_logic;
        in_B : in std_logic;
        in_carry : in std_logic;
        out_sum : out std_logic;
        out_carry : out std_logic
        );
end component;

component CL_adder is
generic (
        N : integer 
        );
  Port ( 
            in_A: in std_logic_vector(N-1 downto 0);
            in_B : in std_logic_vector(N-1 downto 0);
            out_sum : out std_logic_vector(N downto 0)
            );
end component;


-- signals
constant bit_N : integer := 16;
signal tb_A, tb_B, tb_carry : std_logic_vector(bit_N-1 downto 0);
signal tb_out_sum: std_logic_vector(bit_N downto 0);
signal tb_clk: std_logic;

constant period : time := 10 ns;

begin

-- Clock Process
clock: process           
        begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
        end process;

--UUT3 : full_adder
--port map (
--        in_A => tb_A,
--        in_B => tb_B,
--        in_carry => tb_carry,
--        out_sum => tb_out_sum,
--        out_carry => tb_out_carry
--        );

-- Unit under Test
UUT3: CL_adder
generic map (
        N => bit_N
        )
Port map( 
            in_A =>tb_A,
            in_B => tb_B,
            out_sum => tb_out_sum
            );
-- STIMULUS
--for i in 1 to bit_N -1 lo
tb_A <= x"1012" after 1*period,
        x"0007" after 2*period;
        
tb_B <= x"2215" after 1*period,
        x"ff10" after 3*period;
        

end Behavioral;
