-------------------------------------------------------------------------------
-- Title      : keyboard_ctrl.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        controller to handle the scan codes 
-- 		        
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity keyboard_ctrl is
    port (
	     clk : in std_logic; 
	     rst : in std_logic;
	     valid_code : in std_logic;
	     scan_code_in : in unsigned(7 downto 0);
	     code_to_display : out unsigned(7 downto 0);
	     seg_en : out unsigned(3 downto 0)
--		seg_en : out unsigned(7 downto 0)
	 );
end keyboard_ctrl;

architecture keyboard_ctrl_arch of keyboard_ctrl is
    type state_type is (s_0, s_1);

    -- Define the needed internal signals
    signal current_state, next_state: state_type;
	-- signal code_to_display : unsigned(7 downto 0)
	
	-- signal code_to_register : unsigned(7 downto 0); -- Data to be written to the shift register
	signal w_reg : std_logic := '0';
	signal next_w_reg : std_logic := '0';

	signal reg1 : unsigned(7 downto 0)  := (others => '0');
	signal reg2 : unsigned(7 downto 0)  := (others => '0');
	signal reg3 : unsigned(7 downto 0)  := (others => '0');
	signal reg4 : unsigned(7 downto 0)  := (others => '0');

	signal next_reg1 : unsigned(7 downto 0)  := (others => '0');
	signal next_reg2 : unsigned(7 downto 0)  := (others => '0');
	signal next_reg3 : unsigned(7 downto 0)  := (others => '0');
	signal next_reg4 : unsigned(7 downto 0)  := (others => '0');

	
	signal next_seg_disp : unsigned(3 downto 0);
	signal seg_disp : unsigned(3 downto 0);


	signal counter : unsigned(15 downto 0);
	signal next_counter : unsigned(15 downto 0);
	signal next_code_to_display : unsigned(7 downto 0) := (others => '0');
	-- signal active_reg : unsigned(7 downto 0)  := (others => '0');
begin
	registers: process(clk, rst)
	begin
		
		if rst = '1' then
            current_state <= s_0;
			seg_disp <= "1110";
			counter <= "0000000000000000";
			reg1 <= x"00";
			reg2 <= x"00";
			reg3 <= x"00";
			reg4 <= x"00";
			w_reg <= '0';
			-- next_seg_en <= "0001"
        -- elsif falling_edge(clk) then	-- on falling edge, code_to_display changes at the SAME time as scan_code_in. This will cause issues when not simulating
		elsif rising_edge(clk) then 	-- same as above with rising. It's due to "valid_code" in sensitivity list..
            current_state <= next_state; 
			w_reg <= next_w_reg;

			reg1 <= next_reg1;
			reg2 <= next_reg2;
			reg3 <= next_reg3;
			reg4 <= next_reg4;
			
			seg_disp <= next_seg_disp;
			seg_en <= next_seg_disp;		-- Old one, with seg_en(3 downto 0)
--			seg_en <= "1111" & next_seg_disp;
			
			-- seg_disp <= "1110";
			-- seg_en <= "1110";
			
			-- seg_enseg_en <= "1110";
			counter <= next_counter;
			
			-- Add active register 
			code_to_display <= next_code_to_display;
			-- code_to_display <= active_reg;



			

        end if;
	end process;			
						-- testar with only current_state for new convert_scancode
	-- comb_valid_sc: process(current_state, valid_code, scan_code_in) -- need to add scan_code_in 
	comb_valid_sc: process(current_state, valid_code, scan_code_in, reg1, reg2, reg3, reg4)
	begin									-- the alternative is to make valid_code longer
			-- Set default values
		next_state <= current_state;
		next_w_reg <= '0';
		-- w_reg <= '0';



		case current_state is

			when s_0 =>
				-- w_reg <= '0';			-- ----------------TEST
				if scan_code_in = x"00" then
					-- Stay in s_0, no output
				elsif scan_code_in = x"f0" and valid_code = '1' then
					next_state <= s_1;
				end if;
			when s_1 =>
				
				-- Highly sketchy if statements :s The issue is that valid_code = 1 for only accepted codes, together with the fact that scan_code_in goes back to 0h after one clk cycle
				if valid_code = '0' and scan_code_in /= x"f0" then
					-- display error
					next_state <= s_0;
					next_w_reg <= '1'; ------------- TEST
				elsif valid_code = '1' and scan_code_in /= x"f0" and scan_code_in /= x"00" then
					-- Ok scan code! Do we need to check if another break (f0) arrives? It shouldnt be twice in a row
					-- w_reg <= '1';
					next_w_reg <= '1'; ------------ test
					next_state <= s_0;
				end if;

				
		end case;
	end process;	
	 
	shiftreg_comb : process(w_reg, scan_code_in, reg1, reg2, reg3, reg4) -- move to process above?
	begin
		next_reg1 <= reg1;
		next_reg2 <= reg2;
		next_reg3 <= reg3;
		next_reg4 <= reg4;

		if w_reg = '1' then
			-- Shift everything
			next_reg1 <= scan_code_in;
			next_reg2 <= reg1;
			next_reg3 <= reg2;
			next_reg4 <= reg3;

		end if;
	end process;

	display_comb : process(seg_disp, reg1, reg2, counter) -- TODO, this is probably wrong
	begin
		next_seg_disp <= seg_disp; -- not needed?
		next_counter <= counter + "0000000000000001";
		-- next_code_to_display <= reg2;
		if counter(12) = '1' then -- TODO 11, testing 12
			next_counter <= "0000000000000000";
			if reg2 /= "00000000" then -- wait untill reg2 is filled before...
				if seg_disp = "0111" then
					next_seg_disp <= "1110";
				else
					next_seg_disp <= seg_disp(2 downto 0) & "1";
				end if;

				
			end if;
		end if;

	end process;
-- code_to_display <= 	reg1 when seg_disp = "1110" else
					
next_code_to_display <= 	reg1 when seg_disp = "1110" else
					reg2 when seg_disp = "1101" else
					reg3 when seg_disp = "1011" else
					reg4 when seg_disp = "0111" else
					x"00"; -- ff meaning nothing to show :-) maybe 0x00 is more intuiative?




end keyboard_ctrl_arch;


