library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity  tb_TOP_TOP is
end tb_TOP_TOP;

architecture testbench of tb_TOP_TOP is

component TOP_TOP is
	port (
		 clk : in std_logic;
		 rst : in std_logic;
		 start_ext       : in std_logic;
         output_ext      : out std_logic_vector(0 downto 0);
         valid_output_ext: out std_logic
	     );
    end component;

    -- Inputs
   signal clk                : std_logic := '0';
   signal rst                : std_logic := '0';
   signal start_ext          : std_logic := '0';

   --Outputs
   signal output_ext          : std_logic_vector(0 downto 0);
   signal valid_output_ext    : std_logic;

    -- Clock period definitions
   constant clk_period : time := 10 ns;

    begin

    uut1 : TOP_TOP port map (
      clk                => clk,
      rst                => rst,
      start_ext          => start_ext,
      output_ext         => output_ext,
      valid_output_ext   =>  valid_output_ext
    );

    clk_process :process
       begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
       end process;

-- Stimulus process
       stim_proc: process
       begin
          rst <= '1';
          start_ext <= '0';
          -- hold reset state for 100 ns.
          wait for 100 ns;
            rst <= '0';

         wait for 100 ns;
            start_ext <= '1';
         wait for 100 ns;
            start_ext <= '0';

      wait;
   end process;
end;
