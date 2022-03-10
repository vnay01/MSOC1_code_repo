library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package COMPONENT_PKG is

type out_port is array(31 downto 0) of std_logic_vector(7 downto 0);
type rom_out is array( 15 downto 0) of std_logic_vector( 6 downto 0);   -- use it for ROM read out

-------------- INPUT_MATRIX

COMPONENT Input_Mat_Load is

    port (
            clk : std_logic;
--            reset : std_logic;
            enable : in std_logic;
            data_in : in std_logic_vector( 31 downto 0);    -- Data is generated in chunks of 7 bits 
--            addr : in std_logic_vector( 3 downto 0);
            ram_addr : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector( 31 downto 0)   -- Data is STORED and READ as 14 bit word            
            );
end COMPONENT;




-----------------------MM_controller
Component MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in  std_logic_vector(5 downto 0);
        colum : out unsigned( 1 downto 0);    -- used to select the element to load
        row : out unsigned(1 downto 0);
        SWITCH : out unsigned( 1 downto 0);             -- Used for switching positions of ROM coefficient
        MAC_clear : out std_logic;
        ready: out std_logic;                                   -- Shows status of the system
        ram_addr : out std_logic_vector(7 downto 0);        -- addresses external RAM 
        datapath_ctrl : out std_logic_vector( 5 downto 0);       -- this signal will activate section of datapath     
		write_enable : out std_logic;
		store_address : out std_logic_vector( 7 downto 0)
        );
end Component;

---------------------------- READER ----------------
component reader is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(31 downto 0);			--- comes from 1 RAM memory location... has 4 input matrix values
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(1) ]
            o_data :out out_port      					-- refer COMPONENT_PKG for type
  );
end component;

----------------------------

------------------LOADER ------------

COMPONENT LOADER is
    Port (  
            clk : in std_logic;
            enable : in std_logic;                  ------ comes from datapath_ctrl(2)
            reset : in std_logic;
            col_count : in unsigned( 1 downto 0);             -- I donot know what it'll do for now!!!!!! I do NoW
            row_count : in unsigned( 1 downto 0);
            SWITCH : in unsigned( 1 downto 0);                      -- Used to switch elements from ROM access.
            in_mat_elem : in out_port;                  ----- array of elements of Input Matrix         -- Connects with READER Block
            out_x_pe_1: out std_logic_vector( 7 downto 0);       ----individual element of Input Matrix for calculation
            out_x_pe_2: out std_logic_vector( 7 downto 0);      ----individual element of Input Matrix for calculation
            out_a_pe_1: out std_logic_vector( 6 downto 0);      ---- individual element of co-efficient matrix for calculation
            out_a_pe_2 : out std_logic_vector( 6 downto 0)     ---- individual element of co-efficient matrix for calculation            
             );
end COMPONENT;

------------------------MACC_MODULE--------------------------------

COMPONENT MAC is
	port 
	(
		x			: in unsigned(7 downto 0);        -- input matrix
		a			: in unsigned (6 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;            -- MM_controller / datapath_ctrl(3)
		accum_out	: out unsigned (15 downto 0)
	);
	
end COMPONENT;

------------RAM_STORE GOES HERE -------------
component RAM_STORE IS
  Port ( 
		clk : in std_logic;
		reset : in std_logic;
		enable : in std_logic;
		write_enable :  in std_logic;
		address : in std_logic_vector(7 downto 0);
		din : in std_logic_vector( 31 downto 0);
		dout : out std_logic_vector( 31 downto 0)

       );
END component;

-------------- PERF_MODULE GOES HERE --------------------
-------------- calculates mean value of diagonal elements
COMPONENT perf_module is
	port 
	(
		x			: in unsigned(31 downto 0);        -- input matrix
--		a			: in unsigned (31 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;            -- MM_controller / datapath_ctrl(3)
		accum_out	: out unsigned (31 downto 0)	-- MEAN Value of diagonal elements
	);
	
end component;


------------- calculates maximum value of product matrix --------------


component max_value is
	port (
			clk : in std_logic;
			reset : in std_logic;
			enable : in std_logic;
			d_in : in std_logic_vector(31 downto 0);
			max_val_out : out std_logic_vector(31 downto 0)
			);
end component;

end package;

package body COMPONENT_PKG is

end COMPONENT_PKG;


------------ architectures of Individual components BEGIN here -----------

-------------------------------------------------------
-----------------------------------------------------
---------------- INPUT_MATRIX BEGINS HERE -------------
-----------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity Input_Mat_Load is

    port (
            clk : std_logic;
--            reset : std_logic;
            enable : in std_logic;
            data_in : in std_logic_vector( 31 downto 0);    -- Data is generated in chunks of 7 bits 
--            addr : in std_logic_vector( 3 downto 0);
            ram_addr : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector( 31 downto 0)   -- Data is STORED and READ as 14 bit word            
            );
end Input_Mat_Load;

architecture Behavioral of Input_Mat_Load is


component Input_Matrix IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;


---Component ends here ---

-- Signals 

signal o_data_buffer : std_logic_vector( 31 downto 0);
signal in_data_buffer1, in_data_buffer : std_logic_vector( 6 downto 0);     -- stores input data 

signal ram_we, not_ram_we : std_logic_vector(0 downto 0);

begin


  ram_we(0 downto 0) <= (others => '1'); 
  not_ram_we <= not (ram_we);
  
  RAM_mem : Input_Matrix
  port map (
    clka => clk,
    ena => enable,
    wea => not_ram_we,
    addra=>ram_addr,
    dina => data_in,
    douta =>data_out
                );
--READ: process( clk, addr, enable )
--begin
--  if rising_edge(clk) then
--    if enable = '1' then
      
--            data_out <= o_data_buffer;
--            else
--            data_out <= (others => '0');
--            end if;
--    end if;
--end process;



end Behavioral;
-----------------------------------------------------
---------------- INPUT_MATRIX ENDS HERE -------------
-----------------------------------------------------

---------------------------------------------------------
-------------------- LOADER BEGINS HERE------------------
---------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.COMPONENT_PKG.all;



entity LOADER is
    Port (  
            clk : in std_logic;
            enable : in std_logic;                  ------ comes from datapath_ctrl(2)
            reset : in std_logic;
            col_count : in unsigned( 1 downto 0);             -- I donot know what it'll do for now!!!!!! I do NoW
            row_count : in unsigned( 1 downto 0);
            SWITCH : in unsigned( 1 downto 0);                      -- Used to switch elements from ROM access.
            in_mat_elem : in out_port;                  ----- array of elements of Input Matrix         -- Connects with READER Block
            out_x_pe_1: out std_logic_vector( 7 downto 0);       ----individual element of Input Matrix for calculation
            out_x_pe_2: out std_logic_vector( 7 downto 0);      ----individual element of Input Matrix for calculation
            out_a_pe_1: out std_logic_vector( 6 downto 0);      ---- individual element of co-efficient matrix for calculation
            out_a_pe_2 : out std_logic_vector( 6 downto 0)     ---- individual element of co-efficient matrix for calculation
--            done : out std_logic                                ---- goes HIGH when loading is done...... will be useful when timing has to be met!!!
            
             );
end LOADER;


architecture Behavioral of LOADER is


------------    COMPONENTS -------------------


--------- ROM for COEFFICIENT MATRIX --------
component COEF_ROM IS
   PORT (
  clka : IN STD_LOGIC;
  ena : IN STD_LOGIC;
  addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  douta : OUT STD_LOGIC_VECTOR(19 DOWNTO 0)
);
END component;

--------------------------------------------

--------------------SIGNALS ----------------------------
--- Input Matrix signal
--signal x_mat_buffer : std_logic_vector(255 downto 0);       -- will be used to store 32 elements of input Matrix
signal x_mat_buffer : out_port;
signal x_pe_1, x_pe_1_reg: std_logic_vector(7 downto 0);
signal x_pe_2, x_pe_2_reg : std_logic_vector(7 downto 0);

--- ROM coefficients signal ----
signal dataROM : std_logic_vector(19 downto 0);
signal a_pe_1, a_pe_1_reg : std_logic_vector(6 downto 0);
signal a_pe_2, a_pe_2_reg : std_logic_vector(6 downto 0);
signal address, address_next : unsigned( 6 downto 0);

---- counters ---
signal elem_counter : unsigned(3 downto 0) ; ---- appended col & row 
 

begin


COEFF_ROM :COEF_ROM
    port map( 
              clka => clk,
              ena => enable,
              addra => std_logic_vector(address),
              douta => dataROM          
            );



elem_counter <= col_count & row_count;

----- Samples Input matrix 
data_sampling: process(clk, reset, in_mat_elem, x_pe_1_reg, x_pe_2_reg, a_pe_1_reg, a_pe_2_reg)         
begin
    if reset = '1' then
        x_mat_buffer <= (others => (others => '0'));
        out_a_pe_1 <= (others => '0');
        out_a_pe_2 <=(others => '0');
        else
             if rising_edge(clk) then
        x_mat_buffer <= in_mat_elem;
        out_x_pe_1 <=x_pe_1_reg;
        out_x_pe_2 <=x_pe_2_reg;

        end if;
        out_a_pe_1 <= a_pe_1_reg;
        out_a_pe_2 <=a_pe_2_reg;
        end if;
end process;
-----------------------------------------------------------------
-------- Needs to be integrated with ROM behavioral Model -----------
----------- Using Xilinx IP generator in the absence of ROM beh. model

ROM_Read : process( clk, address, enable )
    begin
    if rising_edge(clk) then
        if enable = '1' then    
        a_pe_1 <= dataROM(6 downto 0);
        a_pe_2 <= dataROM( 19 downto 13);       -- 12 downto 7 --- Used as Padding between two ROM co-eff. elements
    end if;
   
  end if;     
    end process;
    
    ----------------------------- THIS IS SO DUMB! ------------------------------
    ---------------- CALCULATING INDIVIDUAL ELEMENTS AT A TIME-------------------
    -----------------------------------------------------------------------------
    ---- Assuming all ROM coefficients have been stored in 
    ------- Needs to be cleared ------
element_selection: process( elem_counter, SWITCH,a_pe_1,a_pe_2, x_mat_buffer  )
begin

----------------- Switches position of coeff elements!!   
  
        case elem_counter is        -- (ROW, COL)
    
    
           when "0000" =>              -- (1,1)
                 case SWITCH is
                 
                    when "00" =>
                    address <= "0000000";        -- gets a11 , a21
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(0);
                    x_pe_2_reg <= x_mat_buffer(4);
                    
                    when "01" =>
                    address <= "0000001";        -- gets a31 , a41
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(8);
                    x_pe_2_reg <= x_mat_buffer(12);       
                    
                    
                    when "10" =>
                    address <= "0000010";        -- gets a51 , a61
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(16);
                    x_pe_2_reg <= x_mat_buffer(20);
                    
                    when "11" =>
                    address <= "0000011";        -- gets a11 , a21
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(24);
                    x_pe_2_reg <= x_mat_buffer(28);        
                    when others =>
                    NULL;
                    
                    end case;
                
         when "0001" =>                     -- (2,1)
                
                   case SWITCH is
                
                   when "00" =>
                   address <= "0000000";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(1);
                   x_pe_2_reg <= x_mat_buffer(5);
                   
                   when "01" =>
                   address <= "0000001";        -- gets a31 , a41
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(9);
                   x_pe_2_reg <= x_mat_buffer(13);       
                   
                   
                   when "10" =>
                   address <= "0000010";        -- gets a51 , a61
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(17);
                   x_pe_2_reg <= x_mat_buffer(21);
                   
                   when "11" =>
                   address <= "0000011";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(25);
                   x_pe_2_reg <= x_mat_buffer(29);        
                   when others =>
                   NULL;
                   
                   end case;
                   
                   
        when "0010" =>                      --(3,1)
                
                 case SWITCH is
                
                   when "00" =>
                   address <= "0000000";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(2);
                   x_pe_2_reg <= x_mat_buffer(6);
                   
                   when "01" =>
                   address <= "0000001";        -- gets a31 , a41
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(10);
                   x_pe_2_reg <= x_mat_buffer(14);       
                   
                   
                   when "10" =>
                   address <= "0000010";        -- gets a51 , a61
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(18);
                   x_pe_2_reg <= x_mat_buffer(22);
                   
                   when "11" =>
                   address <= "0000011";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(26);
                   x_pe_2_reg <= x_mat_buffer(30);        
                   when others =>
                   NULL;
                   
                   end case;    
                   
          when "0011" =>                        -- (4,1)
                 case SWITCH is
                
                   when "00" =>
                   address <= "0000000";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(3);
                   x_pe_2_reg <= x_mat_buffer(7);
                   
                   when "01" =>
                   address <= "0000001";        -- gets a31 , a41
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(11);
                   x_pe_2_reg <= x_mat_buffer(15);       
                   
                   
                   when "10" =>
                   address <= "0000010";        -- gets a51 , a61
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(19);
                   x_pe_2_reg <= x_mat_buffer(23);
                   
                   when "11" =>
                   address <= "0000011";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(27);
                   x_pe_2_reg <= x_mat_buffer(31);        
                   when others =>
                   NULL;
                   
                   end case;    
      
      
       when "0100" =>                            -- (1,2)        
        
--    address <= "0000100";       -- gets a12, a22
     
                     case SWITCH is
                     
                        when "00" =>
                        address <= "0000100";        -- gets a11 , a21
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(0);
                        x_pe_2_reg <= x_mat_buffer(4);
                        
                        when "01" =>
                        address <= "0000101";        -- gets a31 , a41
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(8);
                        x_pe_2_reg <= x_mat_buffer(12);       
                        
                        
                        when "10" =>
                        address <= "0000110";        -- gets a51 , a61
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(16);
                        x_pe_2_reg <= x_mat_buffer(20);
                        
                        when "11" =>
                        address <= "0000111";        -- gets a11 , a21
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(24);
                        x_pe_2_reg <= x_mat_buffer(28);        
                        when others =>
                        NULL;
                        
                        end case;
                    
          
           when "0101" =>                       -- (2,2)
                    
                      case SWITCH is
                    
                       when "00" =>
                       address <= "0000100";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(1);
                       x_pe_2_reg <= x_mat_buffer(5);
                       
                       when "01" =>
                       address <= "0000101";        -- gets a31 , a41
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(9);
                       x_pe_2_reg <= x_mat_buffer(13);       
                       
                       
                       when "10" =>
                       address <= "0000110";        -- gets a51 , a61
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(17);
                       x_pe_2_reg <= x_mat_buffer(21);
                       
                       when "11" =>
                       address <= "0000111";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(25);
                       x_pe_2_reg <= x_mat_buffer(29);        
                       when others =>
                       NULL;
                       
                       end case;
                       
                       
         when "0110" =>                              -- (3,2)
                    
                     case SWITCH is
                    
                       when "00" =>
                       address <= "0000100";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(2);
                       x_pe_2_reg <= x_mat_buffer(6);
                       
                       when "01" =>
                       address <= "0000101";        -- gets a31 , a41
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(10);
                       x_pe_2_reg <= x_mat_buffer(14);       
                       
                       
                       when "10" =>
                       address <= "0000110";        -- gets a51 , a61
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(18);
                       x_pe_2_reg <= x_mat_buffer(22);
                       
                       when "11" =>
                       address <= "0000111";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(26);
                       x_pe_2_reg <= x_mat_buffer(30);        
                       when others =>
                       NULL;
                       
                       end case;    
        when "0111" =>                            -- (4,2)
                     case SWITCH is
                    
                       when "00" =>
                       address <= "0000100";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(3);
                       x_pe_2_reg <= x_mat_buffer(7);
                       
                       when "01" =>
                       address <= "0000101";        -- gets a31 , a41
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(11);
                       x_pe_2_reg <= x_mat_buffer(15);       
                       
                       
                       when "10" =>
                       address <= "0000110";        -- gets a51 , a61
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(19);
                       x_pe_2_reg <= x_mat_buffer(23);
                       
                       when "11" =>
                       address <= "0000111";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(27);
                       x_pe_2_reg <= x_mat_buffer(31);        
                       when others =>
                       NULL;
                       
                       end case;    
-- Column 3
    when "1000" =>                          -- (1,4)
                     case SWITCH is
   
                          when "00" =>
                          address <= "0001000";        -- gets a11 , a21
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(3);
                          x_pe_2_reg <= x_mat_buffer(7);
                          
                          when "01" =>
                          address <= "0001001";        -- gets a31 , a41
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(11);
                          x_pe_2_reg <= x_mat_buffer(15);       
                          
                          
                          when "10" =>
                          address <= "0001010";        -- gets a51 , a61
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(19);
                          x_pe_2_reg <= x_mat_buffer(23);
                          
                          when "11" =>
                          address <= "0001011";        -- gets a11 , a21
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(27);
                          x_pe_2_reg <= x_mat_buffer(31);        
                          when others =>
                          NULL;
                          
                          end case;
    
    when "1001" =>                           -- (2,4)
                     case SWITCH is
      
                             when "00" =>
                             address <= "0001000";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001001";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001010";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001011";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    
    when "1010" =>                           -- (3,4)
                         case SWITCH is
      
                             when "00" =>
                             address <= "0001000";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001001";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001010";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001011";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1011" =>                          --(3,4)
                        case SWITCH is
      
                             when "00" =>
                             address <= "0001000";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001001";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001010";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001011";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1100" =>              --(4,4)
                        case SWITCH is
      
                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1101" =>
                         case SWITCH is

                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    
    when "1110" =>
                          case SWITCH is

                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1111" =>
                           case SWITCH is

                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when others =>
    NULL;
    end case;
end process;

  



end Behavioral;
--------------------------------------------------------------------------------
---------------------LOADER ENDS HERE ------------------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-------------------------------------MACC_MODULE--------------------------------
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MAC is
	port 
	(
		x			: in unsigned(7 downto 0);        -- input matrix
		a			: in unsigned (6 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;            -- MM_controller / datapath_ctrl(3)
		accum_out	: out unsigned (15 downto 0)
	);
	
end MAC;

architecture beh of MAC is


	signal x_reg : unsigned (7 downto 0);
	signal a_reg : unsigned (6 downto 0);
	signal reg_clear, reg_enable : std_logic;
	signal mult_reg, mul_reg_next : unsigned (14 downto 0);
	signal adder_out : unsigned (15 downto 0);
	signal old_result : unsigned (15 downto 0);

begin

	
	mult_reg <= x_reg * a_reg;
	
process (clk, old_result, mult_reg)
begin
--adder_out <=(others =>'0');
 if rising_edge(clk) then
			x_reg <= x;
			a_reg <= a;
			reg_clear <= clear;
			reg_enable <= enable;
         -- Store accumulation result in a register
			adder_out <= old_result + mult_reg;

 end if;
	end process;

process (adder_out, reg_clear)
	begin
	   
--	     if rising_edge(clk) then 
		if (reg_clear = '1') then
			-- Clear accumulater
            old_result <= (others =>'0');
		else
		     old_result <= adder_out;
			end if;
--		end if;
	end process;

		

	accum_out <= adder_out;


end beh;


---------------------------------------------------------------------------------
-------------------------MACC_MODULE ENDS HERE ----------------------------------
---------------------------------------------------------------------------------



------------------MM_controller BEGINS HERE -----------------------
----------------------------------------------------------------
----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- 
-- Create Date: 02.02.2022 07:15:01
-- Module Name: MM_controller - Behavioral
-- Project Name: IC Project
-- Target Devices: ASIC Synthesis
-- Tool Versions: 
-- Description: Behavioral Model of Matrix Multiplier controller
-- 
-- Dependencies: Sub- module for Top Design.
-- 
-- Revision: V0.1
-- Revision 0.01 - File Created
-- Additional Comments:
-- May change down the line
-- Sequence of operation is correct.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in  std_logic_vector(5 downto 0);
        colum : out unsigned( 1 downto 0);    -- used to select the element to load
        row : out unsigned(1 downto 0);
        SWITCH : out unsigned( 1 downto 0);             -- Used for switching positions of ROM coefficient
        MAC_clear : out std_logic;
        ready: out std_logic;                                   -- Shows status of the system
        ram_addr : out std_logic_vector(7 downto 0);        -- addresses external RAM 
        datapath_ctrl : out std_logic_vector( 5 downto 0);       -- this signal will activate section of datapath     
        write_enable : out std_logic;
        store_address : out std_logic_vector(7 downto 0)         --- address of external RAM used for storing product matrix elements
		);
end MM_controller;

architecture Behavioral of MM_controller is

type STATE is ( 
                START,READ,LOAD,MACC,
                RAM_STORE, PERF_CAL
                );

signal current_state, next_state : STATE;
signal done_next : std_logic_vector(5 downto 0);
signal datapath_ctrl_next : std_logic_vector(5 downto 0);           -- ENABLES SECTIONS OF DATAPATH
signal ready_status, next_ready_status: std_logic;      
signal status_count, next_status_count : unsigned ( 3 downto 0) ; -- will be used to count the number of RAM store operations
signal col_counter, col_counter_next : unsigned( 1 downto 0);  -- Counter to load input registers   
signal row_counter, row_counter_next : unsigned ( 1 downto 0); 
signal MACC_COUNT, MACC_COUNT_next : unsigned(2 downto 0);  
signal MAC_clear_reg : std_logic;
signal SWITCH_reg, SWITCH_reg_next : unsigned( 1 downto 0) ;

signal READ_COUNTER, READ_COUNTER_next : unsigned(3 downto 0);

signal ram_addr_counter, next_ram_addr_counter: unsigned(7 downto 0);

signal write_enable_next : std_logic;
signal store_address_counter, store_address_counter_next : unsigned(7 downto 0);

begin

-- State update process
process(clk, reset)
begin
if reset = '1' then
    current_state <=START;
    datapath_ctrl <= (others => '0');
    ready <= '0';
    status_count <= (others =>'0');
    col_counter <= ( others =>'0');
    row_counter <= (others =>'0');
    MACC_COUNT <= (others =>'0');
    MAC_clear <= '0';
    ram_addr <= (others =>'0');
    ram_addr_counter <=( others =>'0');
    SWITCH_reg <= (others => '0'); 
    READ_COUNTER <= (others => '0');
	write_enable <= '0';
	store_address_counter <= (others =>'0');
elsif rising_edge(clk) then
    current_state <= next_state;
    datapath_ctrl <= datapath_ctrl_next; 
    ready <= next_ready_status;
    status_count <= next_status_count;
    col_counter <= col_counter_next;
    row_counter <= row_counter_next;
    MACC_COUNT <= MACC_COUNT_next;
    MAC_clear <= MAC_clear_reg;
    ram_addr <= std_logic_vector(ram_addr_counter);
    ram_addr_counter <= next_ram_addr_counter;
    SWITCH_reg <= SWITCH_reg_next;
    write_enable <= write_enable_next;
    READ_COUNTER <=  READ_COUNTER_next;
    store_address_counter <= store_address_counter_next;
    end if;
end process;

-- Output of the counter
colum <= col_counter;
row <= row_counter ;
SWITCH <= SWITCH_reg;
store_address <= std_logic_vector(store_address_counter);

input_stimulus: process( clk, done )
begin
    if rising_edge(clk) then
    done_next <= (others =>'0');
    case done is 
        when "000001" =>                -- START
        done_next <= "000001";
        when "000010" =>                -- READ
        done_next <= "000010";
        when "000100" =>                -- LOAD
        done_next <= "000100";
        when "001000" =>                -- MACC 
        done_next <= "001000";
        when "010000" =>                -- RAM_STORE
        done_next <= "010000";
        when "100000" =>                --will activate Perf_cal block, if implemented
        done_next <= "100000";
        
        when others =>
        NULL;
        end case;
    end if;        

end process;




-- Next_state determination process
registers: process(current_state, done_next, clk,status_count, col_counter, row_counter, MACC_COUNT, ram_addr_counter, READ_COUNTER, store_address_counter )
begin   

--    if rising_edge(clk) then 
     
     datapath_ctrl_next <= (others =>'0');
     MAC_clear_reg <= '0';            -- May need to be rechecked
     next_state <= current_state; 
     next_status_count <= status_count;   
     col_counter_next <= col_counter;
     row_counter_next  <= row_counter ;
     MACC_COUNT_next <=MACC_COUNT;
     SWITCH_reg_next <= SWITCH_reg;
     next_ready_status <= '0';
     next_ram_addr_counter <= ram_addr_counter;
	 write_enable_next <= '0';
       
     READ_COUNTER_next <=  READ_COUNTER  ;  
     
     store_address_counter_next <= store_address_counter;
      case current_state is
        
        when START =>                    -- reads input matrix "Done by LOAD_MODULE"
         datapath_ctrl_next <= "000011";        -- datapath_ctrl(0)
         MAC_clear_reg <= '1';
            if done_next = "000001" then      -- Where does this signal come from ??
            next_state <= READ;
            end if;
        
        when READ =>
        datapath_ctrl_next <="000010";                  -- datapath_ctrl(1)  -- enables external RAM
--            if done_next = "000010" then
           next_ram_addr_counter <= ram_addr_counter + 1;
           READ_COUNTER_next <= READ_COUNTER + 1;
           case ram_addr_counter is
           when x"07" =>                    --8
           next_state <= LOAD;
           when x"10" =>                        --16
           next_state <= LOAD;
           when x"18" =>                    -- 24
           next_state <= LOAD;  
           when x"20" =>                    --32
           next_state <= LOAD;
           when x"28" =>                    --40
           next_state <= LOAD;
           when x"30" =>                    --48
           next_state <= LOAD;
           when x"38" =>                    -- 56
           next_state <= LOAD;
           when x"40" =>                        -- 64
           next_state <= LOAD;
           when x"48" =>                    -- 72
           next_state <= LOAD;
           when x"50" =>                    -- 80
           next_state <= LOAD;
           when x"58" =>                    --88
           next_state <= LOAD;
           when x"60" =>                    -- 96
           next_state <= LOAD;  
           when x"68" =>                    -- 104
           next_state <= LOAD;
           when x"70" =>                    -- 112
           next_state <= LOAD;
           when x"78" =>                -- 120
           next_state <= LOAD;
           when x"80" =>                -- 128
           next_state <= LOAD;
           when x"88" =>                -- 136
           next_state <= LOAD;
           when x"90" =>                -- 144
           next_state <= LOAD;
           when x"98" =>                -- 152
           next_state <= LOAD;
           when x"a0" =>                -- 160
           next_state <= LOAD;
           when x"a8" =>                -- 168
           next_state <= LOAD;
           when x"b0" =>                -- 176
           next_state <= LOAD;
           when x"b8" =>                -- 184
           next_state <= LOAD;
           when x"c0" =>                -- 192
           next_state <= LOAD;
           when x"c8" =>                -- 200
           next_state <= LOAD;
           when x"d0" =>                -- 208
           next_state <= LOAD;
           when x"d8" =>                -- 216
           next_state <= LOAD;
           when x"e0" =>                -- 224
           next_state <= LOAD;      
           when x"e8" =>                -- 232
           next_state <= LOAD;
           when x"f0" =>                -- 240
           next_state <= LOAD;
           when x"f8" =>                -- 248
           next_state <= LOAD;
           when x"ff" =>                -- 256          --- This is not going to occur because the counter will roll-over to 0
           next_state <= LOAD;               
--         
        when others =>
        next_state <= READ;
        end case;
        
        when LOAD =>
            datapath_ctrl_next <= "001100";            -- CONTROL signal to load unit for data reuse ( from ROM !! )
            row_counter_next <= row_counter +1;
          -------- SOMETHING HAS TO BE DONE ABOUT SWITCH signal-----------
          
           if row_counter = 3 then                                          -- datapath_ctrl(2)
            col_counter_next <= col_counter +1;
            row_counter_next <= (others =>'0');
            end if;
            if col_counter = 4 then
            col_counter_next <= (others =>'0');
             end if;
           
--            if done_next = "000100" then                        --- Dependency on 000100 has to be removed.
            next_state <= MACC;
        
       when MACC => 
       datapath_ctrl_next <= "001000";  -- tells the system that MACC module is active
                                            -- datapath_ctrl(3)
      
--       if done_next = "001000" then       -- Must come from MAC units
          if MACC_COUNT = 7 then
          MAC_clear_reg <= '1';
          end if;
        case MACC_COUNT is ------ CAN CAUSE A POSSIBLE BUG...!!!!!
            when o"0" =>
            SWITCH_reg_next <= "00";
            
            when o"1" =>
            SWITCH_reg_next <= "01";
            
            when o"3" =>
            SWITCH_reg_next <= "10";
            
            when o"5" =>
            SWITCH_reg_next <= "11";
            
            when others =>
            NULL;
            end case;
            
          if MACC_COUNT = 7 then
            next_state <= RAM_STORE;
            MACC_COUNT_next <=(others =>'0');
            else
            next_state <= LOAD;             -- LOAD stage may be required.. for data re-use.
            MACC_COUNT_next <=MACC_COUNT + 1;
         end if;  
--      end if;
       
       when RAM_STORE =>
            
            datapath_ctrl_next <= "010000";       -- Enables RAM store module
                                                   -- datapath_ctrl(4)
			store_address_counter_next <= store_address_counter + 1;
			write_enable_next <= '1';
            if status_count = 15 then
            next_state <= PERF_CAL;
            next_status_count <= (others =>'0');
            else
            next_status_count <= status_count + 1;
            next_state <= READ;
            end if;
--        end if;
       
       when PERF_CAL =>
            datapath_ctrl_next <= "11000";       -- enables PERFORMANCE block
            
--            if done_next = "100000" then
            store_address_counter_next <= store_address_counter - 1;
            next_ready_status <= '1';
            if store_address_counter = x"00" then
            next_state <= READ;
            end if;
--            end if;         
            
      when others =>
      NULL;
                
      end case;
--   end if;
end process;
end Behavioral;

-------------------------MM_controller ENDS HERE -------------------
--------------------------------------------------------------------

--------------------------------------------------------------------
----------------------- READER BLOCK STARTS HERE -------------------
--------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.COMPONENT_PKG.all;


entity reader is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(31 downto 0);			--- comes from 1 RAM memory location... has 4 input matrix values
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(1) ]
            o_data :out out_port      -- refer COMPONENT_PKG for type
  );
end reader;

architecture Behavioral of reader is

signal done_next : std_logic;
signal input_buffer : std_logic_vector(31 downto 0);
signal counter, counter_next : unsigned(4 downto 0);          -- will be used to count to 16
signal load_done : std_logic;                   			  -- goes to HIGH when 8 counts have been completed

--type reg_array is array (31 downto 0) of std_logic_vector(7 downto 0);
--signal X_reg : std_logic_vector(0 to 255);
--signal X_reg : std_logic_vector(255 downto 0);
signal X_reg : out_port;        
signal o_data_buffer : out_port;



begin

process(clk, i_enable, reset, input_buffer, i_x, o_data_buffer)

begin   
    
        if reset = '1' then
        X_reg <=(others =>(others =>'0'));
        input_buffer <= (others =>'0');
else
    if rising_edge(clk) then
        if i_enable = '1' then
            input_buffer <= i_x;
--            X_reg(0 to 31) <= input_buffer;         --- Bits reversed
--            X_reg(32 to 255) <= X_reg(0 to 223);            -- right shift
            
--            X_reg(31 downto 0) <= input_buffer;
--            X_reg( 255 downto 8 ) <= X_reg(7 downto 0);
            X_reg(0) <= input_buffer(7 downto 0);
            X_reg(1) <= input_buffer(15 downto 8);
            X_reg(2) <= input_buffer(23 downto 16);
            X_reg(3) <= input_buffer(31 downto 24);
            X_reg(31 downto 4) <= X_reg(27 downto 0);
            for i in 0 to 31 loop            
            o_data(i) <= o_data_buffer(i);
            end loop;
            end if;
        
        end if;
        end if;
end process;

output_assig : process(clk, X_reg)
begin
        if rising_edge(clk) then
        
       for i in 0 to 31 loop
        o_data_buffer(i) <= X_reg(i);
        end loop;


      end if;               
end process;



end Behavioral;
-----------------------------------READER BLOCK ENDS ---------------------------

-------------------------------------------------------
-----------------------------------------------------
---------------- RAM_STORE BEGINS HERE -------------
-----------------------------------------------------
---- STORES calculated products into RAM -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.COMPONENT_PKG.all;
--

entity RAM_STORE is
 Port ( 
		clk : in std_logic;
		reset : in std_logic;
		enable : in std_logic;
		write_enable :  in std_logic;
		address : in std_logic_vector(7 downto 0);
		din : in std_logic_vector( 31 downto 0);
		dout : out std_logic_vector( 31 downto 0)

       );
end RAM_STORE;

architecture Behavioral of perf_module is


component Input_Matrix IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;


-- SIGNALS

-- signal addr : std_logic_vector( 7 downto 0);


begin

----------- for Simulation  -- Insert RAM WRAPPER HERE -----

------------- Using xilinx Block RAM for testing---------
PROD_STORE : Input_Matrix
	port map (
			clka => clk,
			ena => enable,
			wea(0) => write_enable,
			addra => address,
			dina => din,
			douta => dout
			);


end Behavioral;

-----------------------------------------------------
---------------- RAM_STORE ENDS HERE ----------------
-----------------------------------------------------

--------------------- PERFORMANCE BLOCKS ------------
-----------------------------------------------------


--------------------------------------------------------------------------------
-------------------------------------MEAN_VALUE--------------------------------
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity perf_module is
	port 
	(
		x			: in unsigned(31 downto 0);        -- input matrix
	--	a			: in unsigned (7 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;            -- MM_controller / datapath_ctrl(5)
		accum_out	: out unsigned (31 downto 0)	-- MEAN Value of diagonal elements
	);
	
end perf_module;

architecture beh of perf_module is


	signal x_reg : unsigned (31 downto 0);
--	signal a_reg : unsigned (7 downto 0);
	signal reg_clear, reg_enable : std_logic;
	signal add_reg, add_reg_next : unsigned (31 downto 0);
	signal adder_out : unsigned (31 downto 0);
	signal mean_val : unsigned(31 downto 0);
	signal old_result : unsigned (31 downto 0);

begin

	
-- add_reg <= x_reg + x;
	
process (clk, old_result)
begin
--adder_out <=(others =>'0');
 if rising_edge(clk) then

			x_reg <= x;
			reg_clear <= clear;
			reg_enable <= enable;
         -- Store accumulation result in a register
			adder_out <= old_result + x_reg;
	
 end if;
	end process;

process (adder_out, reg_clear)
	begin
	   
--	     if rising_edge(clk) then 
		if (reg_clear = '1') then
			-- Clear accumulater
            old_result <= (others =>'0');
		else
		     old_result <= adder_out;
			end if;
--		end if;
	end process;
	mean_val <= shift_right(adder_out,2);
	accum_out <= mean_val;


end beh;


-----------MAX VALUE --------------------------------
-- Maximum Value calculation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity max_value is
	port (
			clk : in std_logic;
			reset : in std_logic;
			enable : in std_logic;
			d_in : in std_logic_vector(31 downto 0);
			max_val_out : out std_logic_vector(31 downto 0)
			);
end entity;

architecture beh of max_value is

	signal enable_reg : std_logic;
	signal d_in_reg, comparator : unsigned( 31 downto 0);
	
begin
	
	process(clk, d_in, reset, enable )
		begin
			if reset = '1' then
				d_in_reg <= (others =>'0');
				comparator <= (others => '0');
				else
					if rising_edge(clk) then
					 if enable = '1' then
						d_in_reg <= unsigned(d_in);
						end if;
						
						if d_in_reg >= unsigned(d_in) then
							comparator <= d_in_reg;
							else
							comparator<= unsigned( d_in );
							end if;
				end if;
		end if;
		end process;
		
max_val_out <= std_logic_vector(comparator);

end beh;		


