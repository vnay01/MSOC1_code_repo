library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;



entity LOADER is
    Port (  
            clk : in std_logic;
            enable : in std_logic;                  ------ comes from datapath_ctrl(2)
            load_signal: in unsigned( 1 downto 0);
            in_x_odd: in out_port;                  ----- array of ODD elements of Input Matrix 
            in_x_even : in out_port;                ----- array of even elements of Input Matrix
            out_x_odd: out std_logic_vector( 7 downto 0);       ----individual element of Input Matrix for calculation
            out_x_even: out std_logic_vector( 7 downto 0);      ----individual element of Input Matrix for calculation
            out_a_odd : out std_logic_vector( 6 downto 0);      ---- individual element of co-efficient matrix for calculation
            out_a_even : out std_logic_vector( 6 downto 0);     ---- individual element of co-efficient matrix for calculation
            done : out std_logic                                ---- goes HIGH when loading is done...... will be useful when timing has to be met!!!
            
             );
end LOADER;


architecture Behavioral of LOADER is


------------    COMPONENTS -------------------


--------- ROM for COEFFICIENT MATRIX --------
component COEF_ROM IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
  );
END component;

--------------------------------------------

--------------------SIGNALS ----------------------------

signal data_odd, data_even : out_port ;   --- stores input matrix

--- Input Matrix signal
signal x_odd, odd_x_next : std_logic_vector(7 downto 0);
signal x_even, even_x_next : std_logic_vector(7 downto 0);

--- ROM coefficients signal ----
signal dataROM : std_logic_vector(13 downto 0);
signal odd_a, odd_a_next : std_logic_vector(6 downto 0);
signal even_a, even_a_next : std_logic_vector(6 downto 0);
signal address, address_next : unsigned( 3 downto 0);

---- counters ---
signal count, count_next : unsigned(3 downto 0);
signal row_count, next_row_count : unsigned( 2 downto 0);
signal load_count  : unsigned( 1 downto 0);
signal column_count, elem_count : unsigned (1 downto 0);
signal sel : std_logic;     ---- signal to select sequence of additions
                            ---- can be controlled either by a counter or external signals!! ( maybe MACC unit ) 
signal sel_counter : unsigned(1 downto 0);  --counter for controlling 'sel' signal 

begin


COEFF_ROM :COEF_ROM
    port map( 
              clka => clk,
              ena => enable,
              addra => std_logic_vector(address),
              douta => dataROM          
            );

column_count <= load_signal; -- Selects the column which needs to be calculated. 


-----------------------------------------------------------------
-------- Needs to be integrated with ROM behavioral Model -----------
----------- Using Xilinx IP generator in the absence of ROM beh. model

ROM_Read : process( clk, address, enable )
    begin
    if rising_edge(clk) then
        if enable = '1' then    
        odd_a <= dataROM(6 downto 0);
        even_a <= dataROM( 13 downto 7);
    end if;
        data_odd<= in_x_odd;
        data_even<= in_x_even;
        out_x_odd <= x_odd;
        out_x_even <= x_even;
        out_a_odd <= odd_a;
        out_a_even <= even_a;
  end if;     
    end process;
    
    ----------------------------- THIS is a dummy ------------------------------
    ------- Needs to be cleared ------
sel_counter <= "00";

-- Internal Counters ----
-- Used for proper loading of elements --

process( clk, enable, column_count, row_count )
begin
    if rising_edge(clk) then
    if enable = '1' then
        case column_count is 
        when "00"=>
        row_count <= row_count + 1;
        if row_count = 3 then
        sel <= '1';
        else
        sel <= '0';
        end if;
       when "01"=>
        row_count <= row_count + 1;
        if row_count = 3 then
        sel <= '1';
        else
        sel <= '0';
        end if;
     when "10"=>
        row_count <= row_count + 1;
        if row_count = 3 then
        sel <= '1';
        else
        sel <= '0';
        end if;        
      when "11"=>
        row_count <= row_count + 1;
        if row_count = 3 then
        sel <= '1';
        else
        sel <= '0';
        end if;
     when others=>
     NULl;
     end case;
      end if;
     end if;
end process;

process(sel_counter, enable, clk)
begin
    if rising_edge(clk) then
    if enable = '1' then
        sel_counter <= sel_counter + 1;
    end if;
    
    if sel_counter = 4 then
        sel <= '1';
        else
        sel <= '0';
        end if;
   end if;
end process;


address_gen: process(column_count, row_count, sel)
    begin
        
--        sel <= '1';
        
        case column_count is                 -- comes from  MM_controller... 
            when "00" =>                     -- 1st column
			
            case row_count is
                when x"0" =>
				address <= x"0"; 
				if sel = '1' then				-- controls selection of the matrix element.
                       --  Element 1,2 of coefficient matrix
				x_odd <= data_odd(0);		-- multiplies with 1st element of romDATA
                x_even<= data_even(4);		-- multiplies with 2nd element of romDATA.
				else
				
				x_odd <= data_odd(4);
                x_even<= data_even(0);
				end if;
			
				when x"1" =>
				
				address <= x"1";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(1);
                x_even<= data_even(5);
				else
				x_odd <= data_odd(5);
                x_even<= data_even(1);
				end if;
				
				when x"2" =>
				address <= x"2";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(2);
                x_even<= data_even(6);
				else
				x_odd <= data_odd(6);
                x_even<= data_even(2);
				end if;
				
				when x"3" =>
				address <= x"3";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(3);
                x_even<= data_even(7);
				else
				x_odd <= data_odd(7);
                x_even<= data_even(3);
				end if;
				
				when x"4" =>
				address <= x"0";
				if sel = '1' then
				x_odd <= data_odd(8);
                x_even<= data_even(12);
				else
				x_odd <= data_odd(12);
                x_even<= data_even(8);
				end if;
				
				when x"5" =>
				address <= x"1";
				if sel = '1' then
				x_odd <= data_odd(9);
                x_even<= data_even(13);
				else
				x_odd <= data_odd(13);
                x_even<= data_even(9);
				end if;
				
				when x"6"=>
				address <= x"2";
				if sel = '1' then
				x_odd <= data_odd(10);
                x_even<= data_even(14);
				else
				x_odd <= data_odd(14);
                x_even<= data_even(10);
				end if;
				
				when x"7"=>
				address <= x"3";
				if sel = '1' then
				x_odd <= data_odd(11);
                x_even<= data_even(15);
				else
				x_odd <= data_odd(15);
                x_even<= data_even(11);
				end if;
						
				when others =>
                  NULL;
                   end case;
----------- FIRST COLUMN ENDS HERE

---------------- SECOND COLUMN STARTS HERE ----------------
			
			when "01" =>                     -- 2nd column
			
            case row_count is
                when x"0" =>
				address <= x"4"; 
				if sel = '1' then				-- controls selection of the matrix element.
                       --  Element 1,2 of coefficient matrix
				x_odd <= data_odd(0);		-- multiplies with 1st element of romDATA
                x_even<= data_even(4);		-- multiplies with 2nd element of romDATA.
				else
				
				x_odd <= data_odd(4);
                x_even<= data_even(0);
				end if;
			
				when x"1" =>
				
				address <= x"5";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(1);
                x_even<= data_even(5);
				else
				x_odd <= data_odd(5);
                x_even<= data_even(1);
				end if;
				
				when x"2" =>
				address <= x"6";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(2);
                x_even<= data_even(6);
				else
				x_odd <= data_odd(6);
                x_even<= data_even(2);
				end if;
				
				when x"3" =>
				address <= x"7";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(3);
                x_even<= data_even(7);
				else
				x_odd <= data_odd(7);
                x_even<= data_even(3);
				end if;
				
				when x"4" =>
				address <= x"4";
				if sel = '1' then
				x_odd <= data_odd(8);
                x_even<= data_even(12);
				else
				x_odd <= data_odd(12);
                x_even<= data_even(8);
				end if;
				
				when x"5" =>
				address <= x"5";
				if sel = '1' then
				x_odd <= data_odd(9);
                x_even<= data_even(13);
				else
				x_odd <= data_odd(13);
                x_even<= data_even(9);
				end if;
				
				when x"6"=>
				address <= x"6";
				if sel = '1' then
				x_odd <= data_odd(10);
                x_even<= data_even(14);
				else
				x_odd <= data_odd(14);
                x_even<= data_even(10);
				end if;
				
				when x"7"=>
				address <= x"7";
				if sel = '1' then
				x_odd <= data_odd(11);
                x_even<= data_even(15);
				else
				x_odd <= data_odd(15);
                x_even<= data_even(11);
				end if;
						
				when others =>
                  NULL;
                   end case;
-------------SECOND COLUMN ENDS HERE -----------------

----------------- THIRD COLUMN STARTS HERE ------------
			when "10" =>                     -- 3rd column
			
            case row_count is
                when x"0" =>
				address <= x"8"; 
				if sel = '1' then				-- controls selection of the matrix element.
                       --  Element 1,2 of coefficient matrix
				x_odd <= data_odd(0);		-- multiplies with 1st element of romDATA
                x_even<= data_even(4);		-- multiplies with 2nd element of romDATA.
				else
				
				x_odd <= data_odd(4);
                x_even<= data_even(0);
				end if;
			
				when x"1" =>
				
				address <= x"9";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(1);
                x_even<= data_even(5);
				else
				x_odd <= data_odd(5);
                x_even<= data_even(1);
				end if;
				
				when x"2" =>
				address <= x"a";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(2);
                x_even<= data_even(6);
				else
				x_odd <= data_odd(6);
                x_even<= data_even(2);
				end if;
				
				when x"3" =>
				address <= x"b";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(3);
                x_even<= data_even(7);
				else
				x_odd <= data_odd(7);
                x_even<= data_even(3);
				end if;
				
				when x"4" =>
				address <= x"8";
				if sel = '1' then
				x_odd <= data_odd(8);
                x_even<= data_even(12);
				else
				x_odd <= data_odd(12);
                x_even<= data_even(8);
				end if;
				
				when x"5" =>
				address <= x"9";
				if sel = '1' then
				x_odd <= data_odd(9);
                x_even<= data_even(13);
				else
				x_odd <= data_odd(13);
                x_even<= data_even(9);
				end if;
				
				when x"6"=>
				address <= x"a";
				if sel = '1' then
				x_odd <= data_odd(10);
                x_even<= data_even(14);
				else
				x_odd <= data_odd(14);
                x_even<= data_even(10);
				end if;
				
				when x"7" =>
				address <= x"b";
				if sel = '1' then
				x_odd <= data_odd(11);
                x_even<= data_even(15);
				else
				x_odd <= data_odd(15);
                x_even<= data_even(11);
				end if;
						
				when others =>
                  NULL;
                   end case;

-----------------THIRD COLUMN ENDS HERE ---------------

-----------------FOURTH COLUMN START HERE -------------
				when "11" =>                     -- 4th column
			
            case row_count is
                when x"0" =>
				address <= x"c"; 
				if sel = '1' then				-- controls selection of the matrix element.
                       --  Element 1,2 of coefficient matrix
				x_odd <= data_odd(0);		-- multiplies with 1st element of romDATA
                x_even<= data_even(4);		-- multiplies with 2nd element of romDATA.
				else
				
				x_odd <= data_odd(4);
                x_even<= data_even(0);
				end if;
			
				when x"1" =>
				
				address <= x"d";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(1);
                x_even<= data_even(5);
				else
				x_odd <= data_odd(5);
                x_even<= data_even(1);
				end if;
				
				when x"2" =>
				address <= x"e";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(2);
                x_even<= data_even(6);
				else
				x_odd <= data_odd(6);
                x_even<= data_even(2);
				end if;
				
				when x"3" =>
				address <= x"f";        --  Element 1,2 of coefficient matrix
				if sel = '1' then
				x_odd <= data_odd(3);
                x_even<= data_even(7);
				else
				x_odd <= data_odd(7);
                x_even<= data_even(3);
				end if;
				
				when x"4" =>
				address <= x"c";
				if sel = '1' then
				x_odd <= data_odd(8);
                x_even<= data_even(12);
				else
				x_odd <= data_odd(12);
                x_even<= data_even(8);
				end if;
				
				when x"5" =>
				address <= x"d";
				if sel = '1' then
				x_odd <= data_odd(9);
                x_even<= data_even(13);
				else
				x_odd <= data_odd(13);
                x_even<= data_even(9);
				end if;
				
				when x"6"=>
				address <= x"e";
				if sel = '1' then
				x_odd <= data_odd(10);
                x_even<= data_even(14);
				else
				x_odd <= data_odd(14);
                x_even<= data_even(10);
				end if;
				
				when x"7" =>
				address <= x"f";
				if sel = '1' then
				x_odd <= data_odd(11);
                x_even<= data_even(15);
				else
				x_odd <= data_odd(15);
                x_even<= data_even(11);
				end if;
						
				when others =>
                  NULL;
                   end case;
------------- FOURTH COLUMN ENDS HERE ----------------

end case;				   
end process;
                





end Behavioral;
