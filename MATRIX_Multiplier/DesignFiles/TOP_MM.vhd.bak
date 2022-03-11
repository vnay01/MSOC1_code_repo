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
use woek.array_pkg.all;

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

--------------- SIGNALS for LOADER
signal x_pe_1, x_pe_2 : std_logic_vector(7 downto 0);
signal a_pe_1, a_pe_2 : std_logic_vector (6 downto 0);
signal padd_1, padd_1 : std_logic_vector(15 downto 0);
signal prod_elem : std_logic_vector(31 downto 0);				-- will be used to produce the summation of padd_1 & padd_2

-------------- SIGNALS for RAM_STORE 
signal write_enable : std_logic;
signal address : unsigned(7 downto 0);
signal prod_elem_out : std_logic_vector( 31 downto 0);
----------------SIGNALS for PERF_MODULE
signal data_in_perf : std_logic_vector(31 downto 0);


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
		write_enable => write_enable
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
			SWTICH => switch,
			in_mat_elem => out_X,
			out_x_pe_1 => x_pe_1,
			out_x_pe_2 => x_pe_2,
			out_a_pe_1 => a_pe_1,
			out_a_pe_2 => a_pe_2
			);
PE_1 : MAC
port map(
			clk => clk,
			x => x_pe_1,
			a => a_pe_1,
			clear => clear,
			enable => datapath_ctrl(3),
			accum_out => padd_1
			);
PE_2 : MAC
port map(
			clk => clk,
			x => x_pe_2,
			a => a_pe_2,
			clear => clear,
			enable => datapath_ctrl(3),
			accum_out => padd_2
			);

prod_elem <= (others =>'0') & (padd_1 + padd_2);


address <= (others =>'0') & (colm & row );

PROD_STORE:RAM_STORE               -------- MISUSE of Memory!!
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
        x      => prod_elem_out ,            --- this needs to be corrected...
        clk    => clk,
        clear  => MAC_clear,
        enable => datapath_ctrl(5),
        accum_out => mean_diagonal
    );

MAX_VAL: max_value
port map (
            clk => clk,
            reset => reset,
            enable => datapath_ctrl(5),
            d_in => prod_elem_out,
            max_val_out => max_val
            );



end Behavioral;
