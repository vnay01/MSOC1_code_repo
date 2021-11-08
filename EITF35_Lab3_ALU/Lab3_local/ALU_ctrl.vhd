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
                S_init,
				S0, S1, S2, S3, S4, S5,
				S6, S7, S8
				);
signal current_state, next_state : STATES ; 
signal next_state_buffer : STATES;
signal RegCtrl_buffer : std_logic_vector(1 downto 0);

-- add function for state change whenever sign or enter button is pressed.
signal enter_buffer, sign_buffer : std_logic;                 -- these will be used to sample 'enter' and 'sign' coming from board.
                                                                -- Further the sampled values will be used to test condition of state transitions
signal sign_enter : std_logic;




begin

--sign_enter <= (enter) or (sign);



--RegCtrl_buffer <= RegCtrl;
   -- DEVELOPE YOUR CODE HERE
   -- process to update current state

   state_transition : process(reset, sign_enter, clk)
			begin										-- something is wrong here -- state assignemnts and FN signals
			if rising_edge(clk) then	
    			if reset = '1' then                      -- for testing, reset is set to '0' in ALU _top level design
--			     	current_state <= S_init;
            current_state <= S0;
            enter_buffer <= '0';
            sign_buffer <= '0';
			end if;
			current_state <= next_state;
			enter_buffer <= enter;
            sign_buffer <= sign;
			
			end if;
--			end if;
			end process;


--process(clk)
--begin
--if rising_edge(clk) then
--next_state<= next_state_buffer;
--end if;
--end process;
-- process below implements logic to determine state transitions
-- needs optimizations
next_state_determination_logic : process( enter_buffer, current_state, sign_buffer )
----- need to model sign press as a latch switch.
		begin
		  next_state <= next_state_buffer ;            -- What to do , brathar!
		  next_state_buffer <= current_state;
			case current_state is
			    when S_init =>
			    if enter_buffer ='1' then
--			    if sign = '0' then
			    next_state_buffer <= S0;
--			    else
--			    next_state_buffer <= current_state;		    
			    end if; 
				
				when S0 =>
				if enter_buffer = '1' then             -- state change occurs when "enter" is pressed.
				next_state_buffer <= S1;
--				else
--				next_state <= current_state;
				end if;
				
				when S1 =>
				if enter_buffer = '1' then
				next_state_buffer <= S2;
--				else
--				next_state <= current_state;
--				else
----				elsif falling_edge(enter) then
--				next_state <= current_state;
            
				end if;
				
				when S2 =>
				
				if enter_buffer = '1' then            
				if sign_buffer = '0' then                   -- How and why do you latch sign press as '1' ???
    				next_state_buffer <= S3;
    				else
    				next_state_buffer <= S6;
    				end if;
--				elsif falling_edge(enter) then
--                else
--				next_state <= current_state;
--				else
--				next_state <= current_state;
				end if;
				
				when S3 =>
				   
				if enter_buffer = '1' then
                    if sign_buffer = '0' then
				    next_state_buffer <= S4;
				    else
				    next_state_buffer <= S7;
				    end if;
--				elsif falling_edge(enter) then
--                else
--				next_state <= current_state;
--				else
--				next_state <= current_state;
				end if;
				
				when S4 =>
--				if sign = '0' then				    
				if enter_buffer = '1' then
				 if sign_buffer = '0' then
--				    if sign = '0' then  
				    next_state_buffer <= S5;
				    else
				    next_state_buffer <= S8;
				    end if;
--				elsif falling_edge(enter) then
--                else
--				next_state <= current_state;
--				else
--				next_state <= current_state;
				end if;
				
				when S5 =>
				
				if enter_buffer = '1' then
				if sign_buffer = '0' then
--				    if sign = '1' then
    				next_state_buffer <= S3;
    				else
    				next_state_buffer <= S6;
    				end if;
--				elsif falling_edge(enter) then
--                else
--				next_state <= current_state;
				end if;
				
				when S6 =>
--				if sign = '0' then
				if enter_buffer = '1' then
				 if sign_buffer = '0' then
--				    if sign = '1' then
    				next_state_buffer <= S4;
    				else
    				next_state_buffer <= S7;
    				end if;   			
--				elsif falling_edge(enter) then
--                else
--				next_state <= current_state;
--				else
--				next_state <= current_state;
				end if;
				
				when S7 =>
--				if sign = '0' then
				if enter_buffer = '1' then
				 if sign_buffer = '0' then
--				    if sign = '1' then
    				next_state_buffer <= S5;
    				else
    				next_state_buffer <= S8;
    				end if;
--				elsif falling_edge(enter) then
--                else
--				next_state <= current_state;
--				else
--				next_state <= current_state;
				end if;
				
				when S8 =>
--				if sign = '0' then
				if enter_buffer = '1' then
				 if sign_buffer = '0' then
--				    if sign = '1' then
    				next_state_buffer <= S3;
    				else
    				next_state_buffer <= S6;
    				end if;
--    				else
----				elsif falling_edge(enter) then
--				next_state <= current_state;
--				else
--				next_state <= current_state;
				end if;
				when others =>
				next_state_buffer <= current_state;
			end case;
		end process;

--process to generate ALU operation signals

-- will be optimized further to use less states and registers.
ALU_operation: process(current_state, sign, sign_enter, clk, RegCtrl_buffer)
			begin	
--	FN <= "1101";
	if rising_edge(clk) then
		case current_state is 
		  when S_init =>
--		  if sign_enter = '1' then
--			if RegCtrl_buffer = "00" then
           if enter_buffer = '1' then
               FN <= "1101";          -- testing for state transition
            end if;
--			end if;
			
			
			when S0 =>
			if enter_buffer = '1' then
--			if RegCtrl_buffer = "00" then
			FN <= "0000";			-- sample A
--			elsif falling_edge(enter) then
--            else
			
			end if;
--			end if;
			
			when S1 =>
			if enter_buffer = '1' then
--			if RegCtrl_buffer = "11" then
			FN <= "0001";			-- sample B
--			elsif falling_edge(enter) then
--			else
--			FN <= "1111";
			end if;
--			end if;
			
			when S2 =>
--			if sign_enter = '1' then
            if enter_buffer = '1' then
			 if sign_buffer = '1' then
			 FN <= "1010";			-- signed A+B
			 else
			 FN <= "0010";           -- unsigned A+B
			 end if;
--			else
--			FN <= "1111";
			 end if;
			 
			when S3 =>
--			if sign_enter = '1' then
            if enter_buffer = '1' then
             if sign_buffer = '1' then
             FN <= "1011";            -- signed A-B
             else
             FN <= "0011";           -- unsigned A-B
             end if;
--             else
--             FN <= "1111";
             end if;
             
			when S4 =>
--			if sign_enter = '1' then
            if enter_buffer = '1' then
             if sign_buffer = '1' then
             FN <= "1100";            -- signed Amod3
             else
             FN <= "0100";           -- unsigned Amod3
             end if;
--             else
--             FN <= "1111";
             end if;
			
			when S5 =>		
--			if sign_enter = '1' then
            if enter_buffer = '1' then
             if sign_buffer = '1' then
             FN <= "1010";            -- signed A+B
             else
             FN <= "0010";           -- unsigned A+B
             end if;
--             else
--             FN <= "1111";
             end if;
			
			when S6 => 
--			if sign_enter = '1' then
            if enter_buffer = '1' then
             if sign_buffer = '1' then
             FN <= "1011";            -- signed A-B
             else
             FN <= "0011";           -- unsigned A-B
             end if;
--             else
--             FN <= "1111";
             end if;

			when S7 =>
--			if sign_enter = '1' then
            if enter_buffer = '1' then
             if sign_buffer = '1' then
             FN <= "1100";            -- signed Amod3
             else
             FN <= "0100";           -- unsigned Amod3
             end if;
--             else
--             FN <= "1111";
             end if;
		
			when S8 =>
--             if sign_enter = '1' then
            if enter_buffer = '1' then
              if sign_buffer = '1' then
              FN <= "1010";            -- signed A+B
              else
              FN <= "0010";           -- unsigned A+B
              end if;
--              else
--              FN <= "1111";
              end if;

--			when others =>
--			if sign_enter = '1' then
--			FN <= "1111";
--			end if;
			
--			end if;
		end case;
		end if;
		end process;

-- block below outputs register update control signals to ALU block.
register_update: process( current_state )
	begin
	       RegCtrl_buffer <= "01";             -- default value -- No register transfer operations
		    case current_state is 
			when S0 =>
			RegCtrl <= "00"; 		-- update register A with binary values from switch positions.
			RegCtrl_buffer <= "00";      -- use it to load A
			when S1 =>
			RegCtrl <= "11";		-- update register B with binary values from switch positions.
			RegCtrl_buffer <= "11";                  -- use it to load B
			when others =>
			RegCtrl <= "XX" ;
			end case;
		end process;
		
			
end behavioral;
