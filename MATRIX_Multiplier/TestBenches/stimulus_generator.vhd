library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;


entity stimulus_generator is
    generic (
        FILE_NAME: string := "stimuli.txt";
        SAMPLE_WIDTH: positive
    );
    port (
        clk: in std_logic;
        reset: in std_logic;
        stimulus_stream : out std_logic
    );
end stimulus_generator;


architecture behavioral of stimulus_generator is

    signal sample_clk: std_logic := '0';
    signal sample_clk_counter: integer := 0;
    
    signal stimulus_sample: std_logic_vector(SAMPLE_WIDTH-1 downto 0) := (others => '0');
    signal stimulus_sample_shifter: std_logic_vector (SAMPLE_WIDTH-1 downto 0) := (others => '0');

begin

    process (clk, reset)
    begin
        if reset = '0' then
            sample_clk_counter <= 0;
            sample_clk  <= '0';
        elsif falling_edge(clk) then
            if sample_clk_counter < SAMPLE_WIDTH-1 then
                sample_clk_counter <= sample_clk_counter + 1;
                sample_clk  <= '0';
            else
                sample_clk_counter <= 0;
                sample_clk  <= '1';
            end if;
        end if;
    end process;

    process (sample_clk, reset)
        file test_vector_file: text is in FILE_NAME;
        variable file_row: line;
        variable stimulus_raw: integer;
    begin
        if (reset = '0') then
            stimulus_sample <= (others => '0');  
        elsif rising_edge(sample_clk) then
            stimulus_raw := 0;
            if not endfile(test_vector_file) then
                readline(test_vector_file, file_row);
                read(file_row, stimulus_raw);                
            end if;
            stimulus_sample <= std_logic_vector(to_unsigned(stimulus_raw, SAMPLE_WIDTH));
        end if;
    end process;

    process (clk, sample_clk)
    begin
        if falling_edge(clk) then
            if sample_clk = '1' then
                stimulus_sample_shifter <= stimulus_sample;
            else
                stimulus_sample_shifter <= stimulus_sample_shifter(11) & stimulus_sample_shifter(11 downto 1);
            end if;
        end if;
    end process;
        
    stimulus_stream <= stimulus_sample_shifter(0);
           
end behavioral;
