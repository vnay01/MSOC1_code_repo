-- alu with signed modulo
-- Testing --- Need refinement in handling of all cases within functions

---- WORKING IN HARDWARE ----


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
signal sum, sub, mod3_out_result, bit9_result : std_logic_vector ( 8 downto 0 ) ;
signal mod3_signed_internal_input_register : std_logic_vector(7 downto 0);              -- used during signed Modulo operation
signal mod3_out : std_logic_vector (1 downto 0);           -- used for modulo3 output

alias sign_A : std_logic is A(7) ;
alias sign_B : std_logic is B(7) ;
alias sign_result_sum : std_logic is sum(7) ; 
alias sign_result_sub : std_logic is sub(7);
signal ovf,sign_f : std_logic;
signal internal_result_register : std_logic_vector(8 downto 0);			-- will be used to store results of each stage of operation
--signal zero :unsigned(6 downto 0) := (others =>'0') ;
--signal conv_zero : std_logic_vector()


begin


     modulo3:mod3       -- instantiate a modulo3  component  -- input is 8 bits
     port map ( 
			input_data => mod3_signed_internal_input_register ,
			output_data => mod3_out
		);
        
        
   process ( FN, A, B )
   
   begin
   
    
           --overflow calculation logic needs to be looked into -- 
           -- result can be assigned in a separate process!!


	result<= internal_result_register(7 downto 0);	
		
	case FN is         -- register load operation is taken care of by regsiter control signal
	
        when "0000"=>
        mod3_signed_internal_input_register <= (others=> '0');
		sum <= (others =>'0');
		sub <= (others =>'0');
		mod3_out_result <= (others => '0');
		internal_result_register <= ('0' & A);        -- use it to show display on LED
        ovf<= '0';
        sign_f <= '0';
        bit9_result <=(others => '0');
        
        when "0001" =>
        mod3_signed_internal_input_register <= (others=> '0');
		sum <= (others =>'0');
		sub <= (others =>'0');
		mod3_out_result <= (others => '0');
		internal_result_register <= ('0' & B);        -- use it to show display on LED
        ovf<= '0';     
        sign_f <= '0';
        bit9_result <=(others => '0');
           
		when "0010"	=>					-- unsigned addition
        mod3_signed_internal_input_register <= (others=> '0');
		sum <= std_logic_vector(( unsigned('0' & A) ) + ( unsigned('0' & B) ));
		sub <= (others =>'0');
		mod3_out_result <= (others => '0');
		internal_result_register <= sum;
        ovf<= sum(8);                   -- pretty simple calculation.
        sign_f <= '0';
        bit9_result <=(others => '0');
	
                 
		when "0011" =>                 -- unsigned subtraction
        mod3_signed_internal_input_register <= (others=> '0');
		sum <= (others =>'0');
		if A>=B then
		sub <= std_logic_vector((unsigned('0' & A) ) - ( unsigned('0' & B)));
		ovf <= '0';
		-- case of A < B
	    else
	    sub<=std_logic_vector((unsigned('0' & B))-(unsigned('0' & A)));
	    ovf <= '1';
	    end if;	
		mod3_out_result <= (others => '0');
		internal_result_register<= sub;

--		ovf <= '0';
		sign_f <= '0';
		bit9_result <=(others => '0');
 
 --- issue related to assignment of result -- recheck and update later
 --- works on hardware -- fails in simulation !!!!
        when "0100" =>                      -- unsigned modulo3
        
        mod3_signed_internal_input_register <= std_logic_vector(unsigned(A));           -- connect input of modulo3 module to A
        sum <= (others => '0');
        sub <= (others => '0');
        mod3_out_result <= "0000000" & mod3_out ;
		internal_result_register <= mod3_out_result;
        ovf <= '0';
        sign_f <= '0';
        bit9_result <=(others => '0');


         when "1010" =>                                 -- signed Addition
         mod3_signed_internal_input_register <= (others=> '0');
         mod3_out_result <= (others => '0');
         ovf <= '0';
         
         bit9_result <= std_logic_vector(signed(A(7) & A) + signed(B(7) & B));                   -- stores result as 9 bits          
       
         if signed(bit9_result) <  to_signed(-255, 9) or signed(bit9_result) >  to_signed(255, 9) then  -- Do you understand this section completely?
            ovf <= '1';
            sign_f <= bit9_result(8);
         end if;
            
               -- -86-86=-172
         if bit9_result(8) = '1' then
         sum <= ('0') & std_logic_vector(signed(not bit9_result(7 downto 0))+to_signed(1, 8));--+signed('1')
		 else
		 sum <=('0') & std_logic_vector(signed(A)+signed(B)); --old
		 end if;
		 
		 internal_result_register <= sum;
		 sign_f <= bit9_result(8);
         sub <= (others =>'0');
         
		
     

         when "1011" =>                 -- signed Subtraction
         mod3_signed_internal_input_register <= (others=> '0');
         mod3_out_result <= (others => '0');
           
         if signed(A) >= signed(B) then
         sub <= ('0') & std_logic_vector(signed(A)-signed(B));
               -- bit9_result <= std_logic_vector(signed(reg_A(7) & reg_A)-signed(reg_B(7) & reg_B));
         sign_f <= '0';         -- is it true? Yes!!
         else
         sub <= ('0') & std_logic_vector(signed(B)-signed(A));
               -- bit9_result <= std_logic_vector(signed(reg_B(7) & reg_B)-signed(reg_A(7) & reg_A));
         sign_f <= '1';
         end if;

         bit9_result <= std_logic_vector(signed(A(7) & A) - signed(B(7) & B)); -- 
            
         if signed(bit9_result) <  to_signed(-255, 9) or signed(bit9_result) > to_signed(255, 9) then
         ovf <= '1';
         else
         ovf <= '0';
         end if;
         sum <= (others =>'0');
         internal_result_register <= sub;
-- Signed Modulo           
-- Working
  
        when "1100" =>			-- signed modulo3
--        mod3_signed_internal_input_register <= A;
        sum <= (others => '0');
        sub <= (others => '0');
		if A(7) = '1' then
		mod3_signed_internal_input_register <= std_logic_vector(unsigned(A) - 1 );
		else
		mod3_signed_internal_input_register <= A;
		end if;	
		mod3_out_result <= ("0000000" & mod3_out);
		internal_result_register<= mod3_out_result;
        ovf <= '0';
        sign_f <= '0';
        bit9_result <=(others => '0');
        
		when others =>
	        
        mod3_signed_internal_input_register <= (others=> '0');
		sum <= (others => '0');
		sub <= (others => '0');
		mod3_out_result <= (others => '0');
		internal_result_register <=(others =>'0');
	    ovf <= '0';
	    sign_f <= '0';
	    bit9_result <=(others => '0');
		end case;

   end process;
   
 -- process to set overflow and sign bits -- Needs to be re-checked -- completely wrong!!
 process(ovf)
     begin
        if ovf = '1' then
        overflow <= '1';
        else
        overflow <= '0';
        end if;
        end process;
 
 process(sign_f)
     begin
        if sign_f ='1' then
        sign <= '1';
        else
        sign <= '0';
        end if;
        end process;
     


end behavioral;
