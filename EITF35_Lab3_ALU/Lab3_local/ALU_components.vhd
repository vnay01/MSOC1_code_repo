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
   -- edge detector and modulo3 components will be added later.
   
component edge_detector is
    port (
	     clk : in std_logic;
	     reset : in std_logic;
	     button_in : in std_logic;
	     button_out : out std_logic
	 );
end component;

component mod3 is
	port ( 
			input_data : in std_logic_vector(7 downto 0);
			output_data :out std_logic_vector(1 downto 0)
				);
	end component;
   
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

   signal count      : unsigned(20 downto 0);  -- Range to count 20ms with 50 MHz clock
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

-- component falling edge detector

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity edge_detector is
    port (
	     clk : in std_logic;
	     reset : in std_logic;
	     button_in : in std_logic;
	     button_out : out std_logic
	 );
end edge_detector;


architecture edge_detector_arch of edge_detector is
	-- signal declarations: 
	signal first_sample, final_sample : std_logic :='0';	-- Is default value required?
		
begin
	registers : process(clk,reset)
		begin
			if reset = '1' then
			first_sample <= '0';
			final_sample <= '0';
			elsif rising_edge (clk) then
				first_sample <= button_in;
				final_sample <= first_sample;
			end if;
		end process;
	combinational : process(first_sample, final_sample)
		begin
			button_out <= ( not first_sample) and ( final_sample);
		end process;
end edge_detector_arch;

----------------- Modulo3 with 8 bit input 
-- component modulo3
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

