library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_ctrl is
   port ( clk     : in  std_logic;
          reset   : in  std_logic;  -- connected to CPU reset button on FPGA board
          enter   : in  std_logic;  -- connected to BTNC on FPGA board
          sign    : in  std_logic;  -- connected to BTNL button on FPGA board
          FN      : out std_logic_vector (3 downto 0);   -- ALU functions
          RegCtrl : out std_logic_vector (1 downto 0)   -- Register update control bits
        );
end ALU_ctrl;

architecture behavioral of ALU_ctrl is

-- SIGNAL DEFINITIONS HERE IF NEEDED
type STATES is (
				S0, S1, S2, S3, S4, S5,
				S6, S7, S8
				);
signal current_state, next_state : STATES ; 



begin

   -- DEVELOPE YOUR CODE HERE
   -- process to update current state
   state_transition : process(clk, reset, sign)
			begin
		--	if rising_edge(clk) then	
    			if reset = '1' then
			     	current_state <= S0;
			else
			if rising_edge(clk) then
			current_state <= next_state;
			end if;
			end if;
			end process;

-- process below implements logic to determine state transitions
-- needs optimizations
next_state_determination_logic : process( enter, current_state, sign )
		begin
			case current_state is 
				when S0 =>
				if enter = '1' then
				next_state <= S1;
				else
				next_state <= current_state;
				end if;
				
				when S1 =>
				if enter = '1' then
				next_state <= S2;
				else
				next_state <= current_state;
				end if;
				
				when S2 =>
				if enter = '1' then
				    if sign = '0' then
    				next_state <= S3;
    				else
    				next_state <= S6;
    				end if;
				else
				next_state <= current_state;
				end if;
				
				when S3 =>
				if enter = '1' then
				    if sign = '0' then
				    next_state <= S4;
				    else
				    next_state <= S7;
				    end if;
				else
				next_state <= current_state;
				end if;
				
				when S4 =>
				if enter = '1' then
				    if sign = '0' then  
				    next_state <= S5;
				    else
				    next_state <= S8;
				    end if;
				else
				next_state <= current_state;
				end if;
				
				when S5 =>
				if enter = '1' then
				    if sign = '1' then
    				next_state <= S6;
    				else
    				next_state <= S3;
    				end if;
				else
				next_state <= current_state;
				end if;
				
				when S6 =>
				if enter = '1' then
				    if sign = '1' then
    				next_state <= S7;
    				else
    				next_state <= S4;
    				end if;   			
				else
				next_state <= current_state;
				end if;
				
				when S7 =>
				if enter = '1' then
				    if sign = '1' then
    				next_state <= S8;
    				else
    				next_state <= S5;
    				end if;
				else
				next_state <= current_state;
				end if;
				
				when S8 =>
				if enter = '1' then
				    if sign = '1' then
    				next_state <= S6;
    				else
    				next_state <= S3;
    				end if;
				else
				next_state <= current_state;
				end if;
			end case;
		end process;
--process to generate ALU operation signals
-- will be optimized further to use less states and registers.
ALU_operation: process(current_state, sign , enter)
			begin	
			FN <= "1111";
			case current_state is 
			when S0 =>
			if enter = '1' then
			FN <= "0000";			-- sample A
			else
			FN <= "1111";
			end if;
			
			when S1 =>
			if enter = '1' then
			FN <= "0001";			-- sample B
			else
			FN <= "1111";
			end if;
			
			when S2 =>
			if enter = '1' then
			 if sign = '1' then
			 FN <= "1010";			-- signed A+B
			 else
			 FN <= "0010";           -- unsigned A+B
			 end if;
			 end if;
			 
			when S3 =>
			if enter = '1' then
             if sign = '1' then
             FN <= "1011";            -- signed A-B
             else
             FN <= "0011";           -- unsigned A-B
             end if;
             end if;
			when S4 =>
			if enter = '1' then
             if sign = '1' then
             FN <= "1100";            -- signed Amod3
             else
             FN <= "0100";           -- unsigned Amod3
             end if;
             end if;
			
			when S5 =>		
			if enter = '1' then
             if sign = '1' then
             FN <= "1010";            -- signed A+B
             else
             FN <= "0010";           -- unsigned A+B
             end if;
             end if;
			
			when S6 => 
			if enter = '1' then
             if sign = '1' then
             FN <= "1011";            -- signed A-B
             else
             FN <= "0011";           -- unsigned A-B
             end if;
             end if;

			when S7 =>
			if enter = '1' then
             if sign = '1' then
             FN <= "1100";            -- signed Amod3
             else
             FN <= "0100";           -- unsigned Amod3
             end if;
             end if;
		
			when S8 =>
             if enter = '1' then
              if sign = '1' then
              FN <= "1010";            -- signed A+B
              else
              FN <= "0010";           -- unsigned A+B
              end if;
              end if;

			when others =>
			FN <= "1111";
			end case;
		end process;

-- block below outputs register update control signals to ALU block.
register_update: process( current_state )
	begin
		case current_state is 
			when S0 =>
			RegCtrl <= "00"; 		-- update register A with binary values from switch positions.
			when S1 =>
			RegCtrl <= "01";		-- update register B with binary values from switch positions.
			when others =>
			RegCtrl <= "XX" ;
			end case;
		end process;
		
			
end behavioral;
