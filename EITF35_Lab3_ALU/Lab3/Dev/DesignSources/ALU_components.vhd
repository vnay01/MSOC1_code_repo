library ieee;
use ieee.std_logic_1164.all;

package ALU_components_pack is

   -- Button debouncing 
   component debouncer   
   port ( clk        : in  std_logic;
          reset      : in  std_logic;
          button_in  : in  std_logic;
          button_out : out std_logic
        );
   end component;
   
   -- D-flipflop
   component dff
   generic ( W : integer );
   port ( clk     : in  std_logic;
          reset   : in  std_logic;
          d       : in  std_logic_vector(W-1 downto 0);
          q       : out std_logic_vector(W-1 downto 0)
        );
   end component;
   
   -- ADD MORE COMPONENTS HERE IF NEEDED 
   
end ALU_components_pack;

-------------------------------------------------------------------------------
-- ALU component pack body
-------------------------------------------------------------------------------
package body ALU_components_pack is

end ALU_components_pack;

-------------------------------------------------------------------------------
-- debouncer component: There is no need to use this component, though if you get 
--                      unwanted moving between states of the FSM because of pressing
--                      push-button this component might be useful.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
   port ( clk        : in  std_logic;
          reset      : in  std_logic;
          button_in  : in  std_logic;
          button_out : out std_logic
        );
end debouncer;

architecture behavioral of debouncer is

   signal count      : unsigned(19 downto 0);  -- Range to count 20ms with 50 MHz clock
   signal button_tmp : std_logic;
   
begin

process ( clk )
begin
   if clk'event and clk = '1' then
      if reset = '1' then
         count <= (others => '0');
      else
         count <= count + 1;
         button_tmp <= button_in;
         
         if (count = 0) then
            button_out <= button_tmp;
         end if;
      end if;
  end if;
end process;

end behavioral;

------------------------------------------------------------------------------
-- component dff - D-FlipFlop 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity dff is
   generic ( W : integer
           );
   port ( clk     : in  std_logic;
          reset   : in  std_logic;
          d       : in  std_logic_vector(W-1 downto 0);
          q       : out std_logic_vector(W-1 downto 0)
        );
end dff;

architecture behavioral of dff is

begin

   process ( clk )
   begin
      if clk'event and clk = '1' then
         if reset = '1' then
            q <= (others => '0');
         else
            q <= d;
         end if;
      end if;
   end process;              

end behavioral;

------------------------------------------------------------------------------
-- BEHAVORIAL OF THE ADDED COMPONENETS HERE
-------------------------------------------------------------------------------

-- component modulo3

-- unsigned modulo 3 operation

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;

---- entity unsigned modulo 3 

--entity mod3 is
--	port (
--	       clk : in std_logic ;
--			A : in std_logic_vector(7 downto 0);
--			mod3_out: out std_logic_vector(1 downto 0)
--				);
--end mod3;

---- archtecture () refer section of paper - JT buttler

--architecture beh of mod3 is 
	
---- signals
--	signal A_internal, sub_reg, intermediate_store: std_logic_vector(7 downto 0) :=( others=> '0') ;
	
	
--	type states is (start, compute, done);
--	signal current_state, next_state : states;
--	signal sub : unsigned(7 downto 0) := (others => '0') ;
	


--begin
	
--	-- process to compare input with 192, 96, 48 , 24, 12, 6, 3, 0 
--	-- should instantiate a mux ( 8 to 1 )
--	-- the process below seems to be redundant
	
----initial_subtrahend : process(A)
----	begin
----	if A >= 192 then
----	sub <= to_unsigned(192, sub'length);
----	sub_reg <= std_logic_vector(sub);
----	elsif ( A < 192 and A >= 96 ) then
----	sub <= to_unsigned(96, sub'length);
----	sub_reg <= std_logic_vector(sub);
----	elsif ( A < 96 and A >= 48 ) then
----	sub <= to_unsigned(48, sub'length);
----    sub_reg <= std_logic_vector(sub);
----	elsif ( A < 48 and A >= 24 ) then
----	sub <= to_unsigned(24, sub'length);
----    sub_reg <= std_logic_vector(sub);
----	elsif ( A < 24 and A >= 12 ) then
----	sub <= to_unsigned(12, sub'length);
----    sub_reg <= std_logic_vector(sub);
----	elsif ( A < 12 and A >= 6 ) then
----	sub <= to_unsigned(6, sub'length);
----    sub_reg <= std_logic_vector(sub);
----	elsif ( A < 6 and A >= 3 ) then
----	sub <= to_unsigned(3, sub'length);
----    sub_reg <= std_logic_vector(sub);
----	else
----	sub_reg <= (others => '0');
----	end if;
----	end process;
	

---- register update controller :
	
--	process(A)
--	begin

--	case current_state is
--		when start =>
--		A_internal <= A; -- stores input in internal register

--                if A_internal >= 192 then
--                sub <= to_unsigned(192, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                elsif ( A_internal < 192 and A_internal >= 96 ) then
--                sub <= to_unsigned(96, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                elsif ( A_internal < 96 and A_internal >= 48 ) then
--                sub <= to_unsigned(48, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                elsif ( A_internal < 48 and A_internal >= 24 ) then
--                sub <= to_unsigned(24, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                elsif ( A_internal < 24 and A_internal >= 12 ) then
--                sub <= to_unsigned(12, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                elsif ( A_internal < 12 and A_internal >= 6 ) then
--                sub <= to_unsigned(6, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                elsif ( A_internal < 6 and A_internal >= 3 ) then
--                sub <= to_unsigned(3, sub'length);
--                sub_reg <= std_logic_vector(sub);
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                else
--                sub <= (others => '0');
--                sub_reg <= (others => '0');
--                intermediate_store <= A_internal - sub_reg ;
--                A_internal <= intermediate_store;
--                end if;
                
--                mod3_out <= (others => '0');
		
		
----		intermediate_store <= A_internal - sub_reg ;      -- subtracts sub_reg from A_internal and stores value for further steps
		
--		                                                -- intermediate_store will be used to update the current state
----		A_internal <= intermediate_store;
----		mod3_out <= (others => '0');
		                                               
		                                                  
--		when compute =>
		
--		if A_internal >= 192 then
--        sub <= to_unsigned(192, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        elsif ( A_internal < 192 and A_internal >= 96 ) then
--        sub <= to_unsigned(96, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        elsif ( A_internal < 96 and A_internal >= 48 ) then
--        sub <= to_unsigned(48, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        elsif ( A_internal < 48 and A_internal >= 24 ) then
--        sub <= to_unsigned(24, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        elsif ( A_internal < 24 and A_internal >= 12 ) then
--        sub <= to_unsigned(12, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        elsif ( A_internal < 12 and A_internal >= 6 ) then
--        sub <= to_unsigned(6, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        elsif ( A_internal < 6 and A_internal >= 3 ) then
--        sub <= to_unsigned(3, sub'length);
--        sub_reg <= std_logic_vector(sub);
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        else
--        sub_reg <= (others => '0');
--        intermediate_store <= A_internal - sub_reg ;
--        A_internal <= intermediate_store;
--        end if;
       
--        mod3_out <= (others => '0');
      
        
--		when done =>
--		A_internal <= (others => '0');
		
--		mod3_out <= intermediate_store(1 downto 0);
--		intermediate_store <= (others => '0');
--		sub <= (others => '0');
--		sub_reg <= (others => '0');
		
--		end case;
		
--		end process;

--state_change : process(current_state, clk)
--    begin
--    if rising_edge(clk)then
--        case current_state is
--            when start =>
--            if A_internal = "00000000" then 
--            current_state <= done;
--            else
--            current_state <= compute;
--            end if;
            
--            when compute =>
--            if A_internal = "00000000" then 
--            current_state <= done;
--            else
--            current_state <= compute;
--            end if;
            
--            when done =>
--            current_state <= start;
            
--            end case;
--         end if;
		
--		end process;
--end beh;	
		
