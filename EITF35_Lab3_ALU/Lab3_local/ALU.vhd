library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
   port ( A          : in  std_logic_vector (7 downto 0);   -- Input A
          B          : in  std_logic_vector (7 downto 0);   -- Input B
          FN         : in  std_logic_vector (3 downto 0);   -- ALU functions provided by the ALU_Controller (see the lab manual)
          result 	 : out std_logic_vector (7 downto 0);   -- ALU output (unsigned binary)
	      overflow   : out std_logic;                       -- '1' if overflow ocurres, '0' otherwise 
	      sign       : out std_logic                        -- '1' if the result is a negative value, '0' otherwise
        );
end ALU;

architecture behavioral of ALU is

-- SIGNAL DEFINITIONS HERE IF NEEDED
signal sum, sub  : std_logic_vector ( 8 downto 0 ) ;
signal A_ext, B_ext : signed ( 8 downto 0);
--signal sig_sum, sig_sub : signed ( 8 downto 0) := "000000000" ;
--signal uns_sum, uns_sub : unsigned ( 8 downto 0) := "000000000";
-- signal sig_A_twosC, sig_B_twosC : signed ( 7 downto 0 ) := "00000000";
-- signal uns_A_twosC, uns_B_twosC : unsigned (7 downto 0) := "00000000";
alias sign_A : std_logic is A_ext(7) ;
alias sign_B : std_logic is B_ext(7) ;
alias sign_result : std_logic is sum(7) ; 
signal ovf : std_logic:= '0';

-- modulo3 module pending

--component mod3 is
--	port (
--	       clk : in std_logic ;
--			A : in std_logic_vector(7 downto 0);
--			mod3_out: out std_logic_vector(1 downto 0)
--				);
--end component;

begin
    A_ext <= signed( '0' & (A));
    B_ext <= signed( '0' & (B));
    
   process ( FN, A, B )
   begin
           --overflow calculation logic
       if FN = "1010" then
       ovf <= ((sign_A and sign_B and not(sign_result)) or (((not sign_A) and (not sign_B) and (sign_result))));
       elsif FN = "1011" then
       ovf <= ((sign_A and sign_B and not(sign_result)) or (((not sign_A) and (not sign_B) and (sign_result))));
       else
       ovf <= '0';
       end if;

	case FN is 
		when "0010"	=>					-- unsigned addition
		sum <= std_logic_vector(( '0' & unsigned(A) ) + ( '0' & unsigned(B) ));
		sub <= "000000000";
		result <= sum(7 downto 0);
		overflow <= '0';
		sign <= '0';
		
		when "0011" =>                 -- unsigned subtraction
		sub <= std_logic_vector(( '0' & unsigned(A) ) - ( '0' & unsigned(B) ));
		sum <= "000000000";
		result <= sub(7 downto 0);
		overflow <= '0';
		sign <= '0';
		
        when "1010"	=>					-- signed addition
        sum <= std_logic_vector(A_ext + B_ext);
        sub <= "000000000";
        result <= sum(7 downto 0);

        if ovf = '1' then
        overflow <= '1';
        sign <= not sign_result;
        else
        overflow <= '0';
        sign <= sign_result;
        end if;
        
      
        when "1011" =>                 -- signed subtraction
        sub <= std_logic_vector(A_ext - B_ext);
        sum <= "000000000";
        result <= sub(7 downto 0);
        if ovf = '1' then
        overflow <= '1';
        sign <= not sign_result;
        else
        overflow <= '0';
        sign <= sign_result;
        end if;
		
		when others =>
			sum <= "000000000";
			sub <= "000000000";
			result <= "00000000";
	        ovf <= '0';
			overflow <= '0';
			sign <= '0';
			end case;
		--end process;
		
   -- DEVELOPE YOUR CODE HERE

   end process;

end behavioral;
