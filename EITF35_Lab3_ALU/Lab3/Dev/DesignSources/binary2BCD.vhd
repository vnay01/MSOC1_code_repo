library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.ALU_components_pack.all;

entity binary2BCD is
   generic ( WIDTH : integer := 8   -- 8 bit binary to BCD
           );
   port (   clk : in std_logic ;
            binary_in : in  std_logic_vector(WIDTH-1 downto 0);  -- binary input width
          BCD_out   : out std_logic_vector(9 downto 0)        -- BCD output, 10 bits [2|4|4] to display a 3 digit BCD value when input has length 8
        );
end binary2BCD;

--architecture

architecture beh of binary2BCD is 

-- SIGNAL DEFINITIONS HERE IF NEEDED
type states is ( start, shift , done);
signal state, next_state: states;

signal reset: std_logic ;
signal binary, binary_next : std_logic_vector(WIDTH-1 downto 0); 
signal bcds, bcds_reg, bcds_next : std_logic_vector(15 downto 0);
signal bcds_out_reg, bcds_out_reg_next : std_logic_vector(15 downto 0);
signal shift_counter, shift_counter_next : natural range 0 to WIDTH;


 
  
begin  

    process
-- DEVELOP YOUR CODE HERE
	begin
	if reset ='1' then
	binary <= (others => '0');
	bcds <= (others => '0');
	state <= start;
	bcds_out_reg <= (others => '0');
	shift_counter <= 0;
	elsif falling_edge(clk) then
	binary <= binary_next;
	bcds <= bcds_next;
	state <= next_state;
	bcds_out_reg <= bcds_out_reg_next;
	end if;
	end process;
	
	convert: process(state, binary, binary_in, bcds, bcds_reg, shift_counter)
	begin
	next_state <= state;
	bcds_next <= bcds;
	binary_next <= binary;
	shift_counter_next <= shift_counter;
	
	case state is 
		when start =>
			next_state <= shift;
			binary_next <= binary_in;
			bcds_next <= (others => '0');
			shift_counter <= 0;
		when shift =>
			if shift_counter = WIDTH then	
				next_state <= done;
				else
				binary_next <= binary(WIDTH-2 downto 0) & 'L';
				bcds_next <= bcds_reg(14 downto 0 ) & binary(WIDTH-1);
				shift_counter_next <= shift_counter + 1;
				end if;
		when done=>
			next_state <= start;	-- may form latch
			end case;
		end process;

-- add 3 if binary value of column is equal to or greater than 5
	-- bcds_reg(19 downto 16) <= bcds(19 downto 16) + 3 when bcds(19 downto 16 )> 4 else
								-- bcds(19 downto 0);
	bcds_reg(15 downto 12 ) <= bcds(15 downto 12) + 3 when bcds(15 downto 12) >4 else
								 bcds(15 downto 12);
	bcds_reg(11 downto 8) <= bcds(11 downto 8) +3 when bcds(11 downto 8)> 4 else
							bcds(11 downto 8);
	bcds_reg(7 downto 4) <= bcds(7 downto 4) +3 when bcds(7 downto 4) >4 else
							bcds(7 downto 4);
	bcds_reg(3 downto 0) <= bcds(3 downto 0) + 3 when bcds(3 downto 0) > 4 else
							bcds(3 downto 0);
	
	bcds_out_reg_next <= bcds when state = done else
						 bcds_out_reg;
						 
	BCD_out(9 downto 8) <= bcds_out_reg(9 downto 8);
	BCD_out(7 downto 4) <= bcds_out_reg(7 downto 4);
	BCD_out(3 downto 0) <= bcds_out_reg(3 downto 0);
end beh;
