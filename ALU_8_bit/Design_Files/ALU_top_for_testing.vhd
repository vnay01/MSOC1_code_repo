library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ALU_components_pack.all;

-- use this for testbench.
-- Functionally same as ALU_top with the exception of removing debouncers 
-- Using debouncers in testbench were causing no clear output( because of debounce counters not able to complete counting )
-- 

entity ALU_top_for_test is
   port ( clk        : in  std_logic;
--          btnU       : in  std_logic;
          reset      : in std_logic;
          b_Enter    : in  std_logic;
          b_Sign     : in  std_logic;
          input      : in  std_logic_vector(7 downto 0);
          seven_seg  : out std_logic_vector(6 downto 0);
          anode      : out std_logic_vector(3 downto 0)
        );
end ALU_top_for_test;

architecture structural of ALU_top_for_test is

-- component declarations

-- output of debouncer is not clear HIGH...!!!


component ALU_ctrl is
   port ( clk     : in  std_logic;
          reset   : in  std_logic;  -- connected to CPU reset button on FPGA board
          enter   : in  std_logic;  -- connected to BTNC on FPGA board
          sign    : in  std_logic;  -- connected to BTNL button on FPGA board
          FN      : out std_logic_vector (3 downto 0);   -- ALU functions
          RegCtrl : out std_logic_vector (1 downto 0)   -- Register update control bits
        );
end component;

component ALU is
   port ( A          : in  std_logic_vector (7 downto 0);   -- Input A
          B          : in  std_logic_vector (7 downto 0);   -- Input B
          FN         : in  std_logic_vector (3 downto 0);   -- ALU functions provided by the ALU_Controller (see the lab manual)
          result 	 : out std_logic_vector (7 downto 0);   -- ALU output (unsigned binary)
	      overflow   : out std_logic;                       -- '1' if overflow ocurres, '0' otherwise 
	      sign       : out std_logic                        -- '1' if the result is a negative value, '0' otherwise
        );
end component;

component regUpdate is
   port ( clk        : in  std_logic;
          reset      : in  std_logic;
          RegCtrl    : in  std_logic_vector (1 downto 0);   -- Register update control from ALU controller
          input      : in  std_logic_vector (7 downto 0);   -- Switch inputs
          A          : out std_logic_vector (7 downto 0) ;   -- Input A
          B          : out std_logic_vector (7 downto 0)    -- Input B
        );
end component;

-- binary2BCD converter
component binary2BCD is
   generic ( WIDTH : integer  -- 8 bit binary to BCD
           );
   port (  
          binary_in : in  std_logic_vector(WIDTH-1 downto 0);  -- binary input width
          BCD_out   : out std_logic_vector(9 downto 0)        -- BCD output, 10 bits [2|4|4] to display a 3 digit BCD value when input has length 8
        );
end component;


component seven_seg_driver is
   port ( clk           : in  std_logic;
          reset         : in  std_logic;
          BCD_digit     : in  std_logic_vector(9 downto 0);          
          sign          : in  std_logic;
          overflow      : in  std_logic;
          DIGIT_ANODE   : out std_logic_vector(3 downto 0);
          SEGMENT       : out std_logic_vector(6 downto 0)
        );
end component;

   -- SIGNAL DEFINITIONS
   signal Enter, Sign, edge_Enter, edge_sign, edge_reset: std_logic;
   signal FN_ctrl : std_logic_vector(3 downto 0) ;
   signal RegCtrl_signal : std_logic_vector(1 downto 0);
   signal A_input, B_input : std_logic_vector( 7 downto 0 );
   
   -- signals for testing
   signal tb_result : std_logic_vector ( 7 downto 0) ;
   signal tb_overflow, tb_sign : std_logic;
   signal tb_bcd_out : std_logic_vector(9 downto 0);
--   signal board_DIGIT_ANODE : std_logic_vector(3 downto 0) := "1111";
--   signal board_SEGMENT : std_logic_vector( 6 downto 0) := "1111111";
    signal reset_in : std_logic;
   

begin

reset_in <= reset ;      

-- uncomment required reset statement below for a fixed reset                    
--reset_in <= '0' ;
--reset_in <= '1';

    -- On - board buttons connections
  
    
    
    
   ---- to provide a clean signal out of a bouncy one coming from the push button
   ---- input(b_Enter) comes from the pushbutton; output(Enter) goes to the FSM 
   
   ------- @ vnay01 :: Removing debouncers as the output of debouncers were not clear HIGH..
                    -- since in simulation, I did not provide the the delay of 25 ms for the 
					-- debouncer clock to run its course, its best to remove debounce logic
					-- during simulation only.
   -- debouncer_enter: debouncer
   -- port map ( clk          => clk,
              -- reset        => reset_in,
              -- button_in    => b_Enter,
              -- button_out   => Enter
            -- );
   
    -- debouncer_sign: debouncer
         -- port map ( clk          => clk,
                    -- reset        => reset_in,
                    -- button_in    => b_sign,
                    -- button_out   => Sign
                       -- );
    
--        debouncer_reset: debouncer
--         port map ( clk          => clk,
--                    reset        => ,
--                    button_in    => reset,
--                    button_out   => reset_in
--                       );

   -- ****************************
   -- DEVELOPE THE STRUCTURE OF ALU_TOP HERE
   -- ****************************
   Enter_edge_detector : edge_detector
   port map (
                clk => clk,
                reset => reset_in,
                button_in => b_Enter,
                button_out => edge_Enter
                );
   Sign_edge_detector : edge_detector
   port map (
                clk => clk,
                reset => reset_in,
                button_in => b_sign,
                button_out => edge_sign
                );
   -- no changes in state --- maybe because reset is always active!!
   -- Lets use falling edge of reset as global reset 
   -- did not affect anything!
--reset_edge_detector : edge_detector
--   port map (
--                clk => clk,
--                reset => reset,
--                button_in => reset_in,
--                button_out => edge_reset
--                );
   ALU_Controller: ALU_ctrl
   port map (
               clk => clk,
               reset => reset_in,
               enter => b_Enter,          -- connected to out of debouncer
               sign => b_sign,
               FN => FN_ctrl,
               RegCtrl => RegCtrl_signal
               );
    
   register_update: regUpdate
    port map (
                clk => clk,
                reset => reset_in,
                RegCtrl => RegCtrl_signal,
                input => input,                   -- from Switch positions ( XDC file )
                A => A_input,
                B => B_input
                );
               
   ALU_block : ALU
   port map (
                A => A_input,
                B => B_input,
                FN => FN_ctrl,
                result => tb_result,
                overflow => tb_overflow,
                sign => tb_sign                
                );
       
   Bin2BCD_block : binary2BCD
   generic map (WIDTH => 8)
   port map (
               binary_in => tb_result,
               BCD_out => tb_bcd_out
              );
seg: seven_seg_driver
   port map ( 
          clk => clk,
          reset => reset_in,
          BCD_digit => tb_bcd_out,          
          sign  => tb_sign,
          overflow  => tb_overflow,
          DIGIT_ANODE => anode,
          SEGMENT   => seven_seg
        );
   

end structural;
