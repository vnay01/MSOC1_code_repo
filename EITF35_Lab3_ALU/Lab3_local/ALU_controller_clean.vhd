
--- Make it more readable ----
-- Works in Simulation ---
--- Works in Hardware !!!---

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


--- Make it more readable ----

architecture behavioral of ALU_ctrl is

-- SIGNAL DEFINITIONS HERE IF NEEDED
type STATES is (
                state_init,
				sample_A, sample_B, uns_AplusB, uns_AminusB, uns_Amod3,
				sign_AplusB, sign_AminusB, sign_Amod3
				);
signal current_state, next_state : STATES ; 
-- signal next_state_buffer : STATES;
signal RegCtrl_buffer : std_logic_vector(1 downto 0);

-- add function for state change whenever sign or enter button is pressed.
signal enter_buffer, sign_buffer : std_logic;                 -- these will be used to sample 'enter' and 'sign' coming from board.
                                                                -- Further the sampled values will be used to test condition of state transitions
-- signal sign_enter : std_logic;
signal FN_next : std_logic_vector(3 downto 0);			-- will be used to update FN signal based on the current state.




begin


   state_transition : process(reset, clk)
			begin										-- something is wrong here -- state assignemnts and FN signals
			if rising_edge(clk) then	
    		if reset = '1' then                      -- for testing, reset is set to '0' in ALU _top level design
            current_state <= state_init;
			else
--			if rising_edge(clk) then
			current_state <= next_state;
			end if;
			end if;
			end process;

-- process to update registers
   register_update : process(reset, clk)
			begin										-- something is wrong here -- state assignemnts and FN signals
			if rising_edge(clk) then	
    		if reset = '1' then                      -- for testing, reset is set to '0' in ALU _top level design
--            current_state <= state_init;
            enter_buffer <= '0';
            sign_buffer <= '0';
            RegCtrl <= "01";
            FN <="1101";
			else
			enter_buffer <= enter;
            sign_buffer <= sign;
			RegCtrl <= RegCtrl_buffer;
			FN <= FN_next ;
			end if;
			end if;
			end process;


-- process below implements logic to determine state transitions
-- needs optimizations
next_state_determination_logic : process( current_state, enter_buffer, sign_buffer )
----- need to model sign press as a latch switch.
		begin
		  next_state <= current_state ;            -- current state is maintained until a change in state is enforced
		  RegCtrl_buffer <= "01";
			case current_state is
			    when state_init =>					-- reset state  -- displays -000
			    next_state <= state_init;            -- remain in reset until enter is presed
			    FN_next <= "1101";						-- testing for state transition -- should display -014
				if enter_buffer ='1' then		-- goto state sample_A
				RegCtrl_buffer <= "00";					-- send sampling signal to RegUpdate
			    next_state <= sample_A;
				FN_next <= "0000";         				-- generates RegCtrl "00" to update A with input.
				end if;
				
				when sample_A =>								-- sample A
				FN_next <= "0000";                          -- display the value of A until enter is pressed.
				if enter_buffer = '1' then             	-- state change occurs when "enter" is pressed.
				RegCtrl_buffer <= "11";					-- send register update signal for sampling B
				next_state <= sample_B;
				FN_next <= "0001";							-- generates RegCtrl "11" to update B with input
				end if;
				
				when sample_B =>					-- Sample B
				FN_next <="0001";                   -- display the value of B until enter is pressed.
				RegCtrl_buffer <= "01";
				next_state <= current_state ;
				if enter_buffer = '1' then
				next_state <= uns_AplusB;           -- move to unsigned A+B
				FN_next <= "0010";                  --- control signal to update result register with A+B
				end if;
				if sign_buffer ='1' then            
				next_state <= sign_AplusB;          -- move to signed A+B
				FN_next <= "1010";                  -- control signal to update result with signed A+B
				end if;

				
				when uns_AplusB =>					-- unsigned A+B
				FN_next <= "0010";					-- display uns A + B
				next_state <= current_state ;
				if enter_buffer = '1' then            
    				next_state <= uns_AminusB;      -- move to unsigned A-B
					FN_next <= "0011";              -- control signal to update result register with unsigned A-B
				end if;
    			if sign_buffer ='1' then
    			    next_state <= sign_AplusB;      -- move to signed A+B
				    FN_next <= "1010";              -- control signal to update result register with signed A+B
    				end if;

				
				when uns_AminusB =>					-- unsigned A-B
				 FN_next <= "0011" ; 				-- display uns A-B
				 next_state <= current_state ; 
				if enter_buffer = '1' then
				    next_state <= uns_Amod3;        -- move to unsigned Amod3
					FN_next <= "0100";              -- control signal to update result register with unsigned Amod3
				    end if;
				 if sign_buffer ='1' then
				    next_state <= sign_AminusB;     -- move to signed Amod3.
					FN_next <= "1011";              -- control signal to update result register with signed A-B
				    end if;
				
				when uns_Amod3 =>					-- unsigned Amod3
				 FN_next <= "0100" ; 			    -- display uns Amod3
				next_state <= current_state ;
				if enter_buffer = '1' then
    			    next_state <= uns_AplusB;       -- move to unsigned A+B
					FN_next <= "0010";              -- control signal to update result register with unsigned A+B
				 end if;
				 if sign_buffer ='1' then
				    next_state <= sign_Amod3;       -- move to signed Amod3
					FN_next <= "1100";              -- control signal to update result register with signed Amod3
				    end if;


				
				when sign_AplusB =>					-- signed A+B
				FN_next <= "1010";
				next_state <= current_state ;
				if enter_buffer = '1' then
    				next_state <= sign_AminusB;     -- move to signed A-B
					FN_next <= "1011";              -- control signal to update result register with signed A-B
					end if;
    			if sign_buffer ='1' then
    				next_state <= uns_AplusB;       -- move to unsigned A+B
					FN_next <= "0010";              -- control signal to update result register with unsigned A+B
    				end if;
				
				when sign_AminusB =>				-- signed A-B
				FN_next<="1011";
				next_state <= current_state ;
				if enter_buffer = '1' then
    				next_state <= sign_Amod3;       -- move to signed Amod3
					FN_next <= "1100" ;             -- control signal to update result register with signed Amod3
					end if;
                if sign_buffer ='1' then
    				next_state <= uns_AminusB;     -- move to unsigned A-B
					FN_next <="0011";              -- control signal to update result register with unsigned A-B
    				end if;   			
				
				when sign_Amod3 =>				   -- signed Amod3
				FN_next <= "1100";
				next_state <= current_state ;
				if enter_buffer = '1' then
    				next_state <= sign_AplusB;     -- move to signed A+B
					FN_next <= "1100";             -- control signal to update result register with signed A+B
					end if;
					if sign_buffer ='1' then
    				next_state <= uns_Amod3;       -- move to unsigned Amod3
					FN_next <= "0100";             -- control signal to update result register with unsigned Amod3
    				end if;

				when others =>
                    FN_next <= "1101";
				next_state <= current_state ;
				if enter_buffer = '1' then
				    next_state <= current_state;
				    RegCtrl_buffer <="10";
				end if;
				if sign_buffer = '1' then
				    next_state <= current_state;
                    RegCtrl_buffer <= "10";
                    
				end if;
			end case;
		end process;

			
end behavioral;
