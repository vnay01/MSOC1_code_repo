library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.ALU_components_pack.all;       -- for using modulo component
use work.modulo3_components_pack.all;

entity ALU is
   port ( A          : in  std_logic_vector (7 downto 0);   -- Input A from register controller
          B          : in  std_logic_vector (7 downto 0);   -- Input B from register controller
          FN         : in  std_logic_vector (3 downto 0);   -- ALU functions provided by the ALU_Controller (see the lab manual)
          result 	 : out std_logic_vector (7 downto 0);   -- ALU output (unsigned binary)
	      overflow   : out std_logic;                       -- '1' if overflow ocurres, '0' otherwise 
	      sign       : out std_logic                        -- '1' if the result is a negative value, '0' otherwise
        );
end ALU;

architecture behavioral of ALU is

-- SIGNAL DEFINITIONS HERE IF NEEDED
signal sum, sub, mod3_out_result : std_logic_vector ( 8 downto 0 ) ;
signal mod3_out : std_logic_vector (1 downto 0);           -- used for modulo3 output
--signal A_internal, B_internal : std_logic_vector(8 downto 0);
--signal A_ext, B_ext : signed ( 8 downto 0);
--signal sig_sum, sig_sub : signed ( 8 downto 0) := "000000000" ;
--signal uns_sum, uns_sub : unsigned ( 8 downto 0) := "000000000";
-- signal sig_A_twosC, sig_B_twosC : signed ( 7 downto 0 ) := "00000000";
-- signal uns_A_twosC, uns_B_twosC : unsigned (7 downto 0) := "00000000";
alias sign_A : std_logic is A(7) ;
alias sign_B : std_logic is B(7) ;
alias sign_result_sum : std_logic is sum(7) ; 
alias sign_result_sub : std_logic is sub(7);
signal ovf : std_logic;

-- modulo3 module pending

--component mod3 is
--	port (
--	       clk : in std_logic ;
--			A : in std_logic_vector(7 downto 0);
--			mod3_out: out std_logic_vector(1 downto 0)
--				);
--end component;

begin


     modulo3:mod3       -- instantiate a modulo3 component
     port map ( 
			input_data => A ,
			output_data => mod3_out
		);
        
   process ( FN, A, B )
   
   begin
   

           --overflow calculation logic
           -- result can be assigned in a separate process!!


		
		
	case FN is 

-- register load operation is taken care of by regsiter control signal

		
		when "0010"	=>					-- unsigned addition
--		A_internal <= ('0' & A);
--	    B_internal <= ('0' & B);
--	    A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--        B_ext <= (others =>'0');
		sum <= std_logic_vector(( unsigned('0' & A) ) + ( unsigned('0' & B) ));
		sub <= (others =>'0');
		mod3_out_result <= (others => '0');

		ovf <= ((sign_A and sign_B and not(sign_result_sum)) or (((not sign_A) and (not sign_B) and (sign_result_sum))));
                 

		
		when "0011" =>                 -- unsigned subtraction

		sum <= (others =>'0');
		sub <= std_logic_vector((unsigned('0' & A) ) - ( unsigned('0' & B)));
		mod3_out_result <= (others => '0');

		ovf <= '0';
 
        when "0100" =>
        sum <= (others => '0');
        sub <= (others => '0');
        mod3_out_result <= ("0000000" & mod3_out);
        ovf <= '0';
		
        when "1010"	=>					-- signed addition
        sum <= std_logic_vector(signed( '0' & A) + signed( '0' & B));
        sub <= (others =>'0');
        mod3_out_result <= (others => '0');

        ovf <= ((sign_A and sign_B and not(sign_result_sum)) or (((not sign_A) and (not sign_B) and (sign_result_sum))));

        
      
        when "1011" =>                 -- signed subtraction

        sum <= (others =>'0');
        sub <= std_logic_vector(signed('0' & A) - signed( '0' & B));
        mod3_out_result <= (others => '0');
--        result <= sub(7 downto 0);
        ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
           
        when "1100" =>
        sum <= (others => '0');
        sub <= (others => '0');
        mod3_out_result <= ("0000000" & mod3_out);
        ovf <= '0';      
     --  ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
--        if ovf = '1' then
--        overflow <= '1';
--        sign <= not sign_result_sub;
--        else
--        overflow <= '0';
--        sign <= sign_result_sub;
--        end if;
		-- check current_state
		
		when others =>

--	   A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--       B_ext <= (others =>'0');	        
			sum <= (others => '0');
			sub <= (others => '0');
			mod3_out_result <= (others => '0');
--			result <= "00000000";
	        ovf <= '0';
--			overflow <= '0';
--			sign <= '0';
			end case;
		--end process;
		
   -- DEVELOPE YOUR CODE HERE

   end process;
   
   -- process to update result register
   process(FN, sum, sub, mod3_out_result)
   begin
    case FN is
        when "0000" =>
        result <= A;                -- needed as the requirement is to display the number being input
        when "0001" =>              -- needed as the requirement is to display the number being input
        result <= B;
        when "0010" =>              
        result <= sum(7 downto 0);
        when "0011" =>
        result <= sub(7 downto 0);
        when "0100" =>              
        result <= mod3_out_result(7 downto 0);
        
        when "1010" =>
        result <= sum(7 downto 0);
        when "1011" =>
        result <= sub(7 downto 0);              -- need to figure out what to be displayed when FN : 1111 !!!
        when "1100" =>
        result <= sign_A &  mod3_out_result(6 downto 0);
        
        when "1111" =>                         -- check the state of FSM from display. Only active for testing
        result <= (others => '1');
        
        when others =>
        result <= (others => '0'); 
        end case;
        
end process;  
 -- process to set overflow and sign bits
 process(ovf)
     begin
        if ovf = '1' then
        overflow <= '1';
        sign <= not sign_result_sub;
        else
        overflow <= '0';
        sign <= sign_result_sub;
        end if;
        end process;

end behavioral;
