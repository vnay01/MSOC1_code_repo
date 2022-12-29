library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity seven_seg_driver is
   port ( 
		  clk           : in  std_logic;
          reset         : in  std_logic;
          status_flag   : in std_logic_vector(1 downto 0);
          DIGIT_ANODE   : out std_logic_vector(3 downto 0);
          SEGMENT       : out std_logic_vector(6 downto 0)
        );
end seven_seg_driver;

architecture behavioral of seven_seg_driver is

-- SIGNAL DEFINITIONS HERE IF NEEDED
-- club together sign and overflow
--signal sign_overflow : std_logic_vector ( 1 downto 0);	-- will be used to set - or F
signal s: std_logic_vector(1 downto 0);
signal display_digit : std_logic_vector(3 downto 0) ; -- digit to be displayed ; selected from sliced input	
signal anode_enable : std_logic_vector(3 downto 0); -- enables anode of the segment which needs to be displayed.
signal clkdiv : std_logic_vector(22 downto 0) ; -- will be used to produce a refresh rate of 16 ms.
--signal displayed_number : std_logic_vector(15 downto 0);
--signal sel : std_logic_vector(1 downto 0) ;             -- testing for counter

begin
--	s <= clkdiv(25 downto 24);           -- just for testing
	anode_enable <= "1111";
	
	-- process to select the segment of display which is to be activated
	segement_selection: process(s, reset)
			begin
			if reset ='1' then                       
			 display_digit <= "1100";                
			 else
				case s is
					when "00" =>
					display_digit <= "00" & status_flag;
					when "01" =>
					display_digit <= "01" & status_flag;
					when "10" =>
					display_digit <= "10" & status_flag;
					when "11" =>
					display_digit <= "11" & status_flag;    
					when others=>                   
					NULL;                
					end case;
					end if;
			end process;
segment_sel : process(status_flag)
begin
    
end process;			
			
-- process to switch ON LED pattern of the digits.
segment_led_pattern : process(display_digit)
				begin
    case display_digit is                               --for Basys 3 board : 7-segment pattern is [gfedcba]
    when "0000" =>                              -- so the corresponding pattern changes
    SEGMENT <= "1001110";        -- T     
    when "0001" =>
    SEGMENT <= "0001110";        -- F
    when "0010" =>
    SEGMENT <= "0001000";        -- a
    when "0011" =>
    SEGMENT <= "0010010";        -- s
    when "0100" =>
    SEGMENT <= "0000110";        -- E   
    when "0101" =>
    SEGMENT <= "0001000";        -- a    
    when "0111" =>
    SEGMENT <= "0010010";        -- s
    when "1000" =>
    SEGMENT <= "0010010";        -- s   
    when "1001" =>
    SEGMENT <= "1111001";        -- I   
	when "1011" =>				
	SEGMENT <= "0001000";        -- a
	when "1100" =>
	SEGMENT <= "1001110";        -- T		
	when "1101" =>
	SEGMENT <= "1000111";        -- L      
	when "1111"=>               
	SEGMENT <= "0001100";        --p
    when others=>
    SEGMENT <= "1111111";       -- switch off for other values.
   end case;
 end process;
 
-- Digit select
process(s, anode_enable)
begin
	DIGIT_ANODE <="1111";
	if anode_enable(conv_integer(s)) ='1' then
	DIGIT_ANODE(conv_integer(s)) <= '0';
	else
	DIGIT_ANODE <= "1111";
	end if;
	end process;
 
-- counter to implement a refresh cycle for activating anodes of each
-- digit of the 7- segment display

process(clk, reset)
begin
	if reset ='1' then
	clkdiv <= (others=> '0');
	elsif rising_edge(clk) then
	clkdiv <= clkdiv + 1;
	end if;
	end process;

-- process to select switch combinations

process(clkdiv)
begin
    case clkdiv(22 downto 21) is
    when "00" =>
    s <= "00";
    when "01" =>
    s <= "01";
    when "10" =>
    s <= "10";
    when "11" =>
    s <= "11";
    when others =>
    s <=(others => '0');
    end case;
 end process;


end behavioral;