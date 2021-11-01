library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg_driver is
   port ( clk           : in  std_logic;
          reset         : in  std_logic;
          BCD_digit     : in  std_logic_vector(9 downto 0);          
          sign          : in  std_logic;
          overflow      : in  std_logic;
          DIGIT_ANODE   : out std_logic_vector(3 downto 0);
          SEGMENT       : out std_logic_vector(6 downto 0)
        );
end seven_seg_driver;

architecture behavioral of seven_seg_driver is

-- SIGNAL DEFINITIONS HERE IF NEEDED
-- club together sign and overflow
signal sig_overflow : std_logic_vector ( 1 downto 0) := "00";


begin
    -- digit to 7-segment 
    process(clk, reset, BCD_digit)
        begin
            if reset = '1' then
            DIGIT_ANODE <= "1111";
            else
            if rising_edge(clk) then
               case BCD_digit(3 downto 0) is
                when "0000" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0000001"; -- display '0'
                when "0001" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "1001111"; -- display '1'
                when "0010" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0010010"; -- display '2'
                when "0011" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0000110"; -- display '3'
                when "0100" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "1001100"; -- display '4'
                when "0101" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0100100"; -- display '5'
                when "0110" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0100000"; -- display '6'
                when "0111" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0001111"; -- display '7'
                when "1000" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0000000"; -- display '8'
                when "1001" =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "0000100"; -- display '9'
                when others =>
                DIGIT_ANODE <= "1110";
                SEGMENT <= "1111111"; -- switch OFF LEDS
                end case;
                
      case BCD_digit(7 downto 4) is
                when "0000" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0000001"; -- display '0'
                when "0001" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "1001111"; -- display '1'
                when "0010" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0010010"; -- display '2'
                when "0011" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0000110"; -- display '3'
                when "0100" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "1001100"; -- display '4'
                when "0101" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0100100"; -- display '5'
                when "0110" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0100000"; -- display '6'
                when "0111" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0001111"; -- display '7'
                when "1000" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0000000"; -- display '8'
                when "1001" =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "0000100"; -- display '9'
                when others =>
                DIGIT_ANODE <= "1101";
                SEGMENT <= "1111111"; -- switch OFF LEDS
                end case;
                
        case BCD_digit(9 downto 8) is
                when "00" =>
                DIGIT_ANODE <= "1011";
                SEGMENT <= "0000001"; -- display '0'
                when "01" =>
                DIGIT_ANODE <= "1011";
                SEGMENT <= "1001111"; -- display '1'
                when "10" =>
                DIGIT_ANODE <= "1011";
                SEGMENT <= "0010010"; -- display '2'
                when others =>
                DIGIT_ANODE <= "1011";
                SEGMENT <= "1111111"; -- switch OFF LEDS
                end case;
        end if;
        end if;
      end process;
 
-- display of sign and overflow
    process( sign, overflow )
        begin
            sig_overflow(1) <= sign;
            sig_overflow(0) <= overflow;
        case sig_overflow is
        when "00" =>
        DIGIT_ANODE <= "1111";
        SEGMENT <= "1111111";
        when "01" =>
        DIGIT_ANODE <= "0111";
        SEGMENT <= "1111111";
        when "10" =>
        DIGIT_ANODE <= "0111";
        SEGMENT <= "1111110";
        when "11" =>
        DIGIT_ANODE <= "0111";
        SEGMENT <= "0111000";
        end case;
     end process;  
       
     
        

      
      
   -- Anode Actvation proces
                
               
             

-- DEVELOP YOUR CODE HERE
-- ANODE low , Cathode Low




end behavioral;
