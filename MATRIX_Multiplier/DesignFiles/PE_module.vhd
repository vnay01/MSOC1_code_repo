

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.components_pkg.all;
use work.ram_control_pkg.all;

entity PE_module is
Port (
        reset : std_logic;
        clk : in std_logic;
        enable : in std_logic_vector(6 downto 0);       -- comes from controller
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector(6 downto 0);
        out_elem : out std_logic_vector(16 downto 0);   -- output element
        done : out std_logic         -- goes to control path
         );
end PE_module;

architecture Behavioral of PE_module is

signal mult_odd, mult_odd_next, mult_even, mult_even_next: std_logic_vector(14 downto 0);
signal sum_odd, sum_odd_next, sum_even, sum_even_next : std_logic_vector(15 downto 0);

signal sum_2, sum_2_next : std_logic_vector(15 downto 0);
signal enable_next : std_logic_vector(7 downto 0);                      -- gets updated with controller signals
signal A_1, A_1_next, A_2, A_2_next : std_logic_vector(17 downto 0);
signal sum_2_stage : std_logic_vector(18 downto 0);

signal done_status, done_status_next : std_logic_vector(7 downto 0);
signal done_next :std_logic;

begin

-- Multiplier Block
odd_mult: multiplier
generic map(
            N => 7
            )
port map(
        reset => reset,
        in_X => in_X_odd,
        in_A => in_A_odd,
        mult_en => enable_next(1),
        out_P => mult_odd,
        mult_done => done_status(0)         -- Needs to be ammended later
        );

odd_ADD : CL_adder
generic map(
            N => 15
            )
port map(
            reset => reset,
            in_A => mult_odd_next,
            in_B => sum_odd_next(14 downto 0),
            add_en => enable_next(2) ,
            out_sum => sum_odd,
            add_done => done_status(1)
);

even_mult: multiplier
generic map(
            N => 7
            )
port map(
        reset => reset,
        in_X => in_X_even,
        in_A => in_A_even,
        mult_en => enable_next(1),
        out_P => mult_even,
        mult_done => done_status(2)
        );

even_ADD : CL_adder
generic map(
            N => 15
            )
port map(
            reset => reset,
            in_A => mult_even_next,
            in_B => sum_even_next(14 downto 0),
            add_en => enable_next(2) ,
            out_sum => sum_even,
            add_done => done_status(3)
);

-- ADD2 Stage
ADD_2 : CL_adder
generic map(
            N => 18
            )
port map(
            reset => reset,
            in_A => A_1,
            in_B => A_2,
            add_en => enable_next(3) ,
            out_sum => sum_2_stage,
            add_done => done_status(4)
);

-- Control Path Signal
comb_block:process(enable)
    begin
    case enable is

    when "0000001" =>                       -- READ state       -- "0000_0001"
    enable_next <= x"01";   
    
    when "0000010" =>                       -- IDLE state       -- "0000_0010"
    enable_next <= x"02";
    
    when "0000100" =>                       -- LOAD State       -- "0000_0100"
    enable_next <= x"04";
    
    when "0001000" =>                       -- MULT state       -- "0000_1000"
    enable_next <= x"08";
    
    when "0010000" =>                       -- ADD state        -- "0001_0000"
    enable_next <= x"a0";
    
    when "0100000" =>                       -- ADD_2 state      -- "0010_0000"
    enable_next <= x"20";
    
    when "1000000" =>                       -- RAM_STORE state  -- "0100_0000"
    enable_next <= x"40";
    
--    when "111" =>                       -- Default state    -- "0000_0000"
--    enable_next <= x"00";               -- every block is disabled
    
    when others =>                      -- Default state
    enable_next <= (others => '0');     -- every block is disabled
    
    end case;   

end process;


register_update : process(clk, reset, mult_odd)
begin
    if rising_edge(clk) then
     if reset = '1' then
    mult_odd_next <= (others => '0');
    mult_even_next <= (others => '0');
    sum_odd_next <= (others => '0');
    sum_even_next <= (others => '0');
    done_status_next <= (others =>'0');
    A_1 <= (others => '0');
    A_2<= (others => '0');
    done_status_next <=(others => '0');
    else
    mult_odd_next <= mult_odd;
    mult_even_next <= mult_even;
    sum_odd_next <= sum_odd;
    sum_even_next <= sum_even;
    A_1 <= "00" & sum_odd_next ;
    A_2 <= "00" & sum_even_next;
    done_status_next <= done_status;
     end if;
    end if;
end process;

process(done_status_next)
begin
done_next <= (done_status_next(7) or done_status_next(6) or done_status_next(5) or done_status_next(4) or done_status_next(3) or done_status_next(2) or done_status_next(1) or done_status_next(0));
end process;

-- Will be updated later 
out_elem <= sum_2_stage( 16 downto 0);

comb_done: process(done_next)
    begin
    if done_next ='1' then
    done <= '1';
    else
    done <= '0';
    end if;
end process;

end Behavioral;
