library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


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
signal sum, sub  : std_logic_vector ( 8 downto 0 ) ;
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

--  -- The process below is not necessary

--       process(FN)
--       begin
--       if FN = "1010" then                  -- signed addition
--       ovf <= ((sign_A and sign_B and not(sign_result_sum)) or (((not sign_A) and (not sign_B) and (sign_result_sum))));
--       elsif FN = "1011" then                       -- signed subtraction
--       ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
--       else
--       ovf <= '0';
--       end if;
--       end process;
        
   process ( FN, A, B )
   
   begin
   

           --overflow calculation logic
           -- result can be assigned in a separate process!!


		
		
	case FN is 

-- register load operation is taken care of by regsiter control signal

--		when "0000"	=>					-- load A
--		A_internal <= ('0' & A);
--		--B_internal <= (others =>'0'); 
--	   A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--       B_ext <= (others =>'0');
--		sum <= (others =>'0');
--		sub <= (others =>'0');
--		--result <= (others =>'0');
--		overflow <= '0';
--		sign <= '0';
	   
--		when "0001"	=>					-- load B
--		--A_internal <= (others => '0');                  -- stop loading of A
--		B_internal <= ('0' & B ); 
--	   A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--       B_ext <= (others =>'0');		
--		sum <= (others =>'0');
--		sub <= (others =>'0');
--		--result <= (others =>'0');
--		overflow <= '0';
--		sign <= '0';
		
		when "0010"	=>					-- unsigned addition
--		A_internal <= ('0' & A);
--	    B_internal <= ('0' & B);
--	    A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--        B_ext <= (others =>'0');
		sum <= std_logic_vector(( unsigned('0' & A) ) + ( unsigned('0' & B) ));
		sub <= (others =>'0');
--		result <= sum(7 downto 0);
	--	ovf <= '0';
		ovf <= ((sign_A and sign_B and not(sign_result_sum)) or (((not sign_A) and (not sign_B) and (sign_result_sum))));
                 
--     --  ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
		
--		if ovf = '1' then
--        overflow <= '1';
--        sign <= not sign_result_sum;
--        else
--        overflow <= '0';
--        sign <= sign_result_sum;
--        end if;
        
       -- was inferring latch
--		overflow <= '0';
--		sign <= '0';
		
		when "0011" =>                 -- unsigned subtraction
--	    A_internal <= (others => '0');
--	    B_internal <= (others => '0');
--	   A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--       B_ext <= (others =>'0');
		sum <= (others =>'0');
		sub <= std_logic_vector((unsigned('0' & A) ) - ( unsigned('0' & B)));
		
--		result <= sub(7 downto 0);
		ovf <= '0';
	-- ovf <= ((sign_A and sign_B and not(sign_result_sum)) or (((not sign_A) and (not sign_B) and (sign_result_sum))));
                 
--      ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
		
--		if ovf = '1' then
--        overflow <= '1';
--        sign <= not sign_result_sum;
--        else
--        overflow <= '0';
--        sign <= sign_result_sum;
--        end if;
----		overflow <= '0';
----		sign <= '0';
		
        when "1010"	=>					-- signed addition
--		A_internal <= (others => '0');
--	    B_internal <= (others => '0');
--        A_ext <= signed( '0' & A);        -- this should update A_ext & B_ext every time with current values of A and B
--        B_ext <= signed( '0' & B);
        sum <= std_logic_vector(signed( '0' & A) + signed( '0' & B));
        sub <= (others =>'0');
--        result <= sum(7 downto 0);
        ovf <= ((sign_A and sign_B and not(sign_result_sum)) or (((not sign_A) and (not sign_B) and (sign_result_sum))));
                 
     --  ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
--        if ovf = '1' then
--        overflow <= '1';
--        sign <= not sign_result_sum;
--        else
--        overflow <= '0';
--        sign <= sign_result_sum;
--        end if;
        
      
        when "1011" =>                 -- signed subtraction
-- 		A_internal <= (others => '0');
--	    B_internal <= (others => '0');
--        A_ext <= signed( '0' & A);        -- this should update A_ext & B_ext every time with current values of A and B
--        B_ext <= signed( '0' & B);
        sum <= (others =>'0');
        sub <= std_logic_vector(signed('0' & A) - signed( '0' & B));
       
--        result <= sub(7 downto 0);
        ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
                 
     --  ovf <= ((sign_A and sign_B and not(sign_result_sub)) or (((not sign_A) and (not sign_B) and (sign_result_sub))));
--        if ovf = '1' then
--        overflow <= '1';
--        sign <= not sign_result_sub;
--        else
--        overflow <= '0';
--        sign <= sign_result_sub;
--        end if;
		
		when others =>

--	   A_ext <= (others =>'0');        -- this should update A_ext & B_ext every time with current values of A and B
--       B_ext <= (others =>'0');	        
			sum <= (others => '0');
			sub <= (others => '0');
--			result <= "00000000";
	        ovf <= '0';
--			overflow <= '0';
--			sign <= '0';
			end case;
		--end process;
		
   -- DEVELOPE YOUR CODE HERE

   end process;
   
   -- process to update result register
   process(FN, sum, sub)
   begin
    case FN is
        when "0000" =>
        result <= A;                -- needed as the requirement is to display the number being input
        when "0001" =>
        result <= B;
        when "0010" =>              -- needed as the requirement is to display the number being input
        result <= sum(7 downto 0);
        when "0011" =>
        result <= sub(7 downto 0);
        when "1010" =>
        result <= sum(7 downto 0);
        when "1011" =>
        result <= sub(7 downto 0);              -- need to figure out what to be displayed when FN : 1111 !!!
        
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
