-- Test bench
library ieee;
use ieee.std_logic_1164.all;

entity tb_mealy_sequence_detector is
end tb_mealy_sequence_detector;

-- Architecture of test bench with components

architecture behavior of tb_mealy_sequence_detector is
	-- component declaration of design under test
	component mealy_sequence_detector 
		port (
		clk : in std_logic;
		reset_n : in std_logic;
		d_in : in std_logic;
		d_out : out std_logic
		);
	end component;

    component moore_sequence_detector
    port(
        clk: in std_logic;
        reset_n: in std_logic;
        d_in: in std_logic;
        d_out: out std_logic
        );
      end component;
-- stimuli signal declaration
	-- inputs
	signal clk : std_logic :='0';
	signal reset_n : std_logic :='0';
	signal d_in : std_logic :='0';
	-- outputs
	signal detector_out_mealy, detector_out_moore : std_logic;
	-- clock period definittions:
	constant clock_period : time := 10 ns;
	
-- Begin test bench operations
	-- instantiate moore sequence detector
	begin
		uut: mealy_sequence_detector port map(
			clk => clk,
			reset_n => reset_n,
			d_in => d_in,
			d_out => detector_out_mealy
			);
		uut_moore: moore_sequence_detector port map(
		  clk=> clk,
		  reset_n=> reset_n,
		  d_in => d_in,
		  d_out=>detector_out_moore
		  );
	-- clock process
	clock_process: process
	begin
	clk <= '0';
	wait for clock_period/2;
	clk<='1';
	wait for clock_period/2;
	end process;

-- Stimulus process 
	stimulus_process: process
	begin
		-- reset state to be active for 100 ns
		d_in <= '0';
		reset_n<='1';
		-- wait for 100 ns for global reset to finish
		wait for 30 ns;
		reset_n<= '0';
		wait for 40 ns;
		d_in <= '1';
		wait for 10 ns;
		d_in<= '0';
		wait for 10 ns;
		d_in <= '1';
		wait for 10 ns;
		d_in<= '0';
		wait for 10 ns;
		d_in<= '0';
		wait for 10 ns;
		d_in <= '1';
		wait for 10 ns;
		d_in<='1';
		wait for 10 ns;
		d_in <='1';
		wait for 10 ns;
		d_in <= '1';
		wait for 10 ns;
		d_in<='0';
		wait for 10 ns;
		d_in<='0';
		wait for 10 ns;
		d_in<='1';
		wait for 10 ns;
		d_in<='1';
		wait for 10 ns;
		d_in<='0';
		wait for 10 ns;
		d_in <= '1';
		wait ;
		end process;
	end;