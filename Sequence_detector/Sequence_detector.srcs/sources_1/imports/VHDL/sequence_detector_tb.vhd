library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sequence_detector_tb is
end sequence_detector_tb;

architecture behavioral of sequence_detector_tb is

    component stimulus_generator is
        generic (
            FILE_NAME: string := "stimuli.txt";
            SAMPLE_WIDTH: positive
        );
        port (
            clk: in std_logic;
            reset: in std_logic;
            stimulus_stream: out std_logic
        );
    end component;

    constant CLOCK_PERIOD: time := 100 ns;
    constant RESET_STOP: time := 200 ns;
        
    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    
    signal bit_stream: std_logic := '0';

    signal moore_detected: std_logic;
   -- signal mealy_detected: std_logic;

    signal moore_count: integer := 0;
   -- signal mealy_count: integer := 0;    

begin

    reset <= '1' after RESET_STOP;
           
    clk <= not clk after CLOCK_PERIOD / 2;

    stimuli_gen: stimulus_generator
        generic map (
            FILE_NAME => "stimuli.txt",
            SAMPLE_WIDTH => 12
        )
        port map (
            clk => clk,
            reset => reset,
            stimulus_stream => bit_stream
        );

    uut_moore: entity work.sequence_detector(moore) 
        port map (
            clk => clk,
            reset_n => reset,
            d_in => bit_stream,
            d_out => moore_detected
        );
    
    detection_counter: process (moore_detected, reset)
    begin
        if reset = '0' then
            moore_count <= 0;
          --mealy_count <= 0;
        else
            moore_count <= moore_count+1;
            -- ???
            -- ???
            -- create counters here to count sequence occurences for both mealy and moore implementations
            -- ???
            -- ???
        end if;
    end process;
end;
