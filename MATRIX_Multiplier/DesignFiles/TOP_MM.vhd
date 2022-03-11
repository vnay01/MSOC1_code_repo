-- Matrix Multiplier - TOP Module
-- Dependencies:
	--	1) array_pkg
	--	2) INPUT_MATRIX
	--	3) LOADER
	--	4) MACC_MODULE
	--	5) MM_controller
	--	6) READER
	--	7) RAM_STORE
	-- 	8) PERF_MODULE
	----  Create a package called "COMPONENT_PKG" inorder to make a little less mess in top_module!!

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
--use work.COMPONENT_PKG.all;
use work.array_pkg.all;

entity TOP_MM is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
--			START : in std_logic;   may not be required....
			READY : out std_logic;
			max_val: out std_logic_vector(31 downto 0); 			-- comes from PERF_MODULE
			mean_diagonal : out std_logic_vector(31 downto 0)		-- comes from PERF_MODULE
        );
        
end TOP_MM;

architecture Behavioral of TOP_MM is


------- components

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
------------------------ Input Matrix 


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

COMPONENT COEFF_ROM is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );

end component;

component PR_STORE IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;



---------------------------- Product Matrix Store RAM
component prod_store IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;


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
-- Interconneting SIGNALS
----- MM_controller signals

signal done : std_logic_vector(5 downto 0);		--  width will be reduced
signal col, row, switch : unsigned(1 downto 0);
signal clear : std_logic;
signal SYSTEM_READY : std_logic;				-- goes HIGH when 1 product matrix has been computed
signal address_READER_ram : std_logic_vector(7 downto 0);
signal datapath_ctrl : std_logic_vector(5 downto 0);

--------------- SIGNALS for READER 
signal input_element : std_logic_vector(31 downto 0);
signal out_X : out_port ;
signal data_nc: std_logic_vector (31 downto 0);
--------------- SIGNALS for LOADER
signal x_pe_1, x_pe_2 : std_logic_vector(7 downto 0);
signal a_pe_1, a_pe_2 : std_logic_vector (6 downto 0);
signal padd_1, padd_2: unsigned(15 downto 0);
signal prod_elem : std_logic_vector(31 downto 0);				-- will be used to produce the summation of padd_1 & padd_2

-------------- SIGNALS for RAM_STORE 
signal write_enable : std_logic;
signal address : unsigned(7 downto 0);
signal prod_elem_out : std_logic_vector( 31 downto 0);
signal store_address : std_logic_vector( 7 downto 0); 
----------------SIGNALS for PERF_MODULE
signal data_in_perf : std_logic_vector(31 downto 0);
signal me_diagonal : unsigned(31 downto 0);

SIGNAL LOW : std_logic_vector(0 downto 0); 
signal  HIGH: std_logic;

begin
---- CONNECTIONS : TOP_MM

READY <= SYSTEM_READY ;


CONTROLLER: MM_controller
port map(

        clk => clk,
        reset => reset,
        done => done,
        colum =>col,
        row => row,
        SWITCH => switch,
        MAC_clear => clear,
        ready => SYSTEM_READY,
        ram_addr => address_READER_ram,
        datapath_ctrl => datapath_ctrl,
		write_enable => write_enable,
		store_address => store_address
        );

LOW(0) <= '0';
HIGH <= '1';
INPUT_x_MAT: Input_Matrix 
  PORT MAP (
    clka => clk,
    ena => datapath_ctrl(1),
    wea => LOW,
    addra => address_READER_ram,
    dina => data_nc,
    douta => input_element
  );



READ : READER
  Port map( 
            clk => clk,
            reset => reset,
            i_x => input_element,
            i_enable => datapath_ctrl(1),
            o_data => out_X
  );

LOAD : LOADER
port map (
			clk => clk,
			reset => reset,
			enable => datapath_ctrl(2),
			col_count => col,
			row_count => row,
			SWITCH => switch,
			in_mat_elem => out_X,
			out_x_pe_1 => x_pe_1,
			out_x_pe_2 => x_pe_2,
			out_a_pe_1 => a_pe_1,
			out_a_pe_2 => a_pe_2
			);
PE_1 : MAC
port map(
			clk => clk,
			x => unsigned(x_pe_1),
			a => unsigned(a_pe_1),
			clear => clear,
			enable => datapath_ctrl(3),
			accum_out => padd_1
			);
PE_2 : MAC
port map(
			clk => clk,
			x =>unsigned( x_pe_2),
			a => unsigned(a_pe_2),
			clear => clear,
			enable => datapath_ctrl(3),
			accum_out => padd_2
			);

prod_elem <= x"0000" & std_logic_vector(padd_1 + padd_2);


address <= x"0" & (col & row );

PRO_STORE:RAM_STORE               -------- MISUSE of Memory!!
 PORT map (
           clk => clk,
           reset => reset,          -- NOT used!!!1
           enable => datapath_ctrl(4),
           write_enable=> write_enable,
           address => store_address,
           din => prod_elem,
           dout => prod_elem_out
 );
 

MEAN: perf_module
	port map
    (
        x      => unsigned(prod_elem_out) ,            --- this needs to be corrected...
        clk    => clk,
        clear  => clear,
        enable => datapath_ctrl(5),
        accum_out => me_diagonal
    );
    
mean_diagonal <= std_logic_vector(me_diagonal);

diag_VAL: max_value
port map (
            clk => clk,
            reset => reset,
            enable => datapath_ctrl(5),
            d_in => prod_elem_out,
            max_val_out => max_val
            );



end Behavioral;
