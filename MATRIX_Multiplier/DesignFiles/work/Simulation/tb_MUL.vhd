library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.reg_pkg.all;
use work.comp_pkg.all;
use std.textio.all;


entity tb_MUL is
--  Port ( );
end tb_MUL;

architecture Behavioral of tb_MUL is

component MUL is
	port 
	(
		clk    : in std_logic;
		clear  : in std_logic;
		enable : in std_logic;
		operand_a : in std_logic_vector(7 downto 0);        -- input matrix
		operand_b : in std_logic_vector (7 downto 0);       -- coefficiet elem
        mul_out	: out unsigned (15 downto 0)
	);
end component;

component ADDER_MODULE is
 Port ( 
        clk : in std_logic;
        reset: in std_logic;
        enable : in std_logic;
        operand_a: in unsigned(15 downto 0);
        operand_b: in unsigned(15 downto 0);
        adder_out: out unsigned( 15 downto 0 )
        );
end component;


component MATRIX_MULTIPLIER is
 Port ( 
       clk : in std_logic;
       reset : in std_logic;
       start: in std_logic;
       read : in std_logic;
       input_matrix : in std_logic_vector( 7 downto 0 );
       status : out std_logic;                              -- controller will update this
       output_matrix : out std_logic_vector( 15 downto 0 )  -- Goes to RAM store controller 
       );
end component;

component RAM_IN_MATRIX is
port (
        clk : in std_logic ;
        reset : in std_logic ;
        enable : in std_logic ;                     -- comes from Main Controller
        write_en : in std_logic;                    -- '1' for WRITE , '0' for READ
        --addr : in std_logic_vector(5 downto 0);
        data_out : out std_logic_vector(7 downto 0)
        );
end component;

component CLOCKGENERATOR is
  generic( clkhalfperiod :time := 100 ns );
  port( clk : out std_logic);
end component;

component FILE_READ is
  generic (file_name : string; width : positive; datadelay : time);
  port (CLK, RESET :  in std_logic;
                 Q : out std_logic_vector(width-1 downto 0));
end component;

--component FILE_WRITE is
--	port (
--			clk : in std_logic;
--			reset : in std_logic;
--			ram_read_data : in std_logic_vector(15 downto 0)
--			);

--end component;

component MEMORY_CONTROLLER is
    Port (
           clk : in std_logic;
           reset : in std_logic;
           enable : in std_logic;       -- enable signal from CONTROLLER
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
           ack : in std_logic;  -- Each RAM block ( RY signal is read and then connected to ack )
           ram_bank_select : out std_logic_vector( 1 downto 0 );  -- Since we have 4 separate RAM block, each block can be selected exclusively.
           address : out std_logic_vector( 9 downto 0 );
           write_en : out std_logic           
           );
end component;

component MEM_WITH_RAM is
  Port (
            clk: in std_logic;
            reset : in std_logic;
            enable : in std_logic;       -- enable signal from CONTROLLER
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
           data_in : in std_logic_vector( 15 downto 0 );
           data_out : out std_logic_vector( 31 downto 0)
             );
end component;

-- signals
signal tb_clk: std_logic;
signal tb_reset : std_logic;


-- SIGNALs for CONTROLLER
signal tb_init : std_logic;

-- MATRIX_MULTIPLIER connections
signal tb_input_matrix : std_logic_vector( 7 downto 0) ;
signal tb_status : std_logic;
signal tb_output_matrix : std_logic_vector( 15 downto 0 );
signal tb_read : std_logic;

-- SIGNALs for MEMORY CONTROLLER
--signal tb_init : std_logic;                 -- enables CONTROLLER
signal tb_read_enable : std_logic;
signal tb_write_en : std_logic;
--signal tb_addr : std_logic_vector(5 downto 0);
signal tb_data_out : std_logic_vector(7 downto 0);



signal period : time := 20 ns;
constant N:integer         :=  8;
constant dataskew:time     :=  5 ns;

signal logic_1 : std_logic;
signal clock_counter : integer ;

begin

-- clock
clock: CLOCKGENERATOR 
  generic map ( clkhalfperiod => 5 ns )
  port map( clk => tb_clk);

FILE_READ_BLOCK:FILE_READ
-- generic map ( file_name => "/h/d1/s/vi7715si-s/Desktop/ICP1/Design_Files/ExtendedMM/Test_Ready/testvectors.txt" , width => N , datadelay =>dataskew) 
generic map ( file_name => "E:\ICP2\DesignFiles\testvectors.txt" , width => N , datadelay =>dataskew) 
port map( 
          CLK => tb_clk,
          RESET => logic_1,
          Q => tb_input_matrix
          );

 logic_1 <= '1';
  
  DUT_MATRIX_MULTIPLIER: MATRIX_MULTIPLIER
     Port map( 
                clk => tb_clk,
                reset => tb_reset,
                start => tb_init,
		        read => tb_read,
                input_matrix => tb_input_matrix,
                status => tb_status,
                output_matrix => tb_output_matrix 
       );

--File_WR: FILE_WRITE
--	port map(
--			clk => tb_clk,
--			reset => tb_reset,
--			ram_read_data => tb_output_matrix
--			);


 

--------------------------- USE THIS BLOCK ONLY WITH A FUNCTIONAL RAM 
--DUT_RAMBLOCK: RAM_IN_MATRIX
--port map (
--        clk => tb_clk,
--        reset => tb_reset,
--        enable => tb_init,
--        write_en => tb_write_en,
--       -- addr => tb_addr,
--        data_out => tb_data_out
--        );

			 
			 
 -- STIMULUS generation
 tb_reset <= '1' after 1*period,
              '0' after 2*period;
              
 tb_init <= '0' after 1*period,
            '1' after 2*period ;   -- Start system
 
 
-- process
-- begin
--    tb_write_en  <= '1';
--    wait for period;
----    tb_write_en <= '0';
----    wait for period;  
-- end process;




            
end Behavioral;
