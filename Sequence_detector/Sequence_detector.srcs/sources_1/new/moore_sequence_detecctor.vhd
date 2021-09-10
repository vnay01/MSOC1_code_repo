library ieee;
use ieee.std_logic_1164.all;

entity moore_sequence_detector is
    port (
        clk: in std_logic;
        reset_n: in std_logic;
        d_in: in std_logic;
        d_out: out std_logic
    );
end moore_sequence_detector;

architecture moore of  moore_sequence_detector is

    -- Define a enumeration type for the states
    type state_type is (s_init, s_1, s_2, s_3, s_4 , s_5, s_6,
						s_7, s_8,s_9,s_10,s_11,s_final
						);
    
    -- Define the needed internal signals
    signal current_state, next_state: state_type;
    
begin

    -- purpose: Implements the registers for the sequence decoder
    -- type : sequential
    registers: process (clk, reset_n)
    begin
        if reset_n = '0' then
            current_state <= s_init; -- on reset, current state becomes the initial state of the FSM
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    -- purpose: Implements the next_state logic as well as the output logic
    -- type : combinational
    combinational: process (current_state, d_in)
    begin
        -- set default value
        next_state <= current_state;
        d_out <= '0'; -- output goes HIGH only when the sequence is detected
        
        case current_state is
            when s_init =>
                if d_in = '0' then
                    next_state <= s_init;  -- is this line necessary?
                else
                    next_state <= s_1;
                end if;
            when s_1 =>
                if d_in ='0' then
                    next_state <= s_2;
                else
                    next_state <= s_1;
                   end if;
			when s_2=>
				if d_in ='0' then
					next_state <= s_3;
				else
					next_state <= s_1;
					end if;
			when s_3=>
				if d_in ='1' then
					next_state <= s_4;
					else 
					next_state <= s_2;
					end if;
			when s_4=>
				if d_in ='1' then
					next_state <= s_5;
					else
					next_state <= s_2;
					end if;
			when s_5=>
				if d_in = '1' then
					next_state <= s_6;
					else
					next_state <= s_2;
					end if;
			when s_6=>
				if d_in = '1' then
					next_state <= s_7;
					else
					next_state <= s_2;
					end if;
			when s_7=>
				if d_in = '0' then
					next_state <= s_8;
					else
					next_state <= s_1;
					end if;
			when s_8=>
				if d_in = '0' then
					next_state <= s_9;
					else
					next_state <= s_1;
					end if;
			when s_9=>
				if d_in ='1' then
					next_state <= s_10;
					else
					next_state <= s_init;
					end if;
			when s_10=>
				if d_in ='1' then
					next_state <= s_11;
					else
					next_state <= s_2;
					end if;
			when s_11=>
				if d_in ='0' then
					next_state <= s_final;
					else
					next_state <= s_6;
					end if;
			when s_final=>
				if d_in ='0' then
					next_state<= s_3;
				else
					next_state<=s_1;
				end if;
                
        end case;
    end process;
--combinational output logic:
	process(current_state)
		begin
			case current_state is
				when s_init =>
					d_out <='0';
				when s_1=>
					d_out <='0';
				when s_2=>
				d_out <='0';
				when s_3=>
				d_out <='0';
				when s_4=>
				d_out <='0';
				when s_5=>
				d_out <='0';
				when s_6=>
				d_out <='0';
				when s_7=>
				d_out <='0';
				when s_8=>
				d_out <='0';
				when s_9=>
				d_out <='0';
				when s_10 =>
				d_out <='0';
				when s_11=>
				d_out <='0';
				when s_final=>
				d_out <='1';
			end case;
		end process;
					

end moore;

