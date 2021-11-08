-- modulo3 operation for 8 bit input

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


library work;
use work.modulo3_components_pack.all;

entity mod3 is
	port ( 
			input_data : in std_logic_vector(7 downto 0);
			output_data :out std_logic_vector(1 downto 0)
				);
	end mod3;
	
-- architecture 

architecture beh of mod3 is

-- signals 
-- output of each stage will be connected to input of the next stage
signal stage1 , stage2, stage3, stage4, stage5, stage6, stage7 : std_logic_vector(7 downto 0) :=(others => '0'); 	

begin
DUT_stage1: modulo3
	generic map( const_comparator => 192
                )
	port map( 	
				x => input_data,
				output => stage1
				);

 
 DUT_stage2 : modulo3
 	generic map( const_comparator => 96
                )
	port map( 	
				x => stage1,
				output => stage2
				);
 DUT_stage3 : modulo3
 	generic map( const_comparator => 48
                )
	port map( 	
				x => stage2,
				output => stage3
				);
 DUT_stage4 : modulo3
 	generic map( const_comparator => 24
                )
	port map( 	
				x => stage3,
				output => stage4
				);


 DUT_stage5 : modulo3
 	generic map( const_comparator => 12
                )
	port map( 	
				x => stage4,
				output => stage5
				);
DUT_stage6 : modulo3
 	generic map( const_comparator => 6
                )
	port map( 	
				x => stage5,
				output => stage6
				);
 DUT_stage7 : modulo3
 	generic map( const_comparator => 3
                )
	port map( 	
				x => stage6,
				output => stage7
				);
				
process(stage7)
begin
output_data <= stage7(1 downto 0);
end process;

end beh;
