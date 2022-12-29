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
       read: in std_logic;
       input_matrix : in std_logic_vector( 7 downto 0 );        -- Can be combined with output port LSB
       status : out std_logic;                              -- controller will update this
       output_matrix : out std_logic_vector( 15 downto 0 );  -- Goes to RAM store controller 
       mem_flag : out std_logic;
       gold_read_en: out std_logic                              --- ADDING test signals to enable reading from Golden Data RAM
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

component input_matrix_read is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;  -- use this signal to start reading
        output : out std_logic_vector(15 downto 0)
        );
end component;

component golden_data_read is
  Port (
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        output : out std_logic_vector(16 downto 0) 
        );
end component;

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

--------- DFT compoennts -------
component DFT_MM is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        start_test : in std_logic;
        read_test : in std_logic;
        dut_status : out std_logic;
        dut_mem_flag: out std_logic;        
        dft_status : out std_logic_vector(1 downto 0);
        test_output : out std_logic_vector(16 downto 0);
        gold_output: out std_logic_vector(16 downto 0)
        );
end component;

component DFT_CONTROLLER is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        test_init : in std_logic;       -- Will start the test sequence
        dut_status : in std_logic;
        dut_mem_flag : in std_logic;
        dft_status : in std_logic_vector(1 downto 0);
        start_test : out std_logic;
        read_test : out std_logic
  );
end component;



--component TOP_DFT_EMM is
--  Port ( 
--         clk : in std_logic;
--         reset : in std_logic;
--         test_init : in std_logic;
--         matrix_output : out std_logic_vector(16 downto 0);
--         gold_data : out std_logic_vector(16 downto 0)
--        );
--end component;

component TOP_DFT_EMM is
  Port ( 
         clk : in std_logic;
         reset : in std_logic;
         test_init : in std_logic;
         seven_seg : out std_logic_vector(6 downto 0);
         anode : out std_logic_vector(3 downto 0);
         matrix_output : out std_logic_vector(16 downto 0);
         gold_data : out std_logic_vector(16 downto 0)
        );
end component;

-- signals
signal tb_clk: std_logic;
signal tb_reset : std_logic;


-- SIGNALs for CONTROLLER
signal tb_init : std_logic;
--signal tb_start_comp : std_logic;

---- MATRIX_MULTIPLIER connections
--signal tb_input_matrix : std_logic_vector( 7 downto 0) ;
--signal tb_status : std_logic;
--signal tb_output_matrix : std_logic_vector( 15 downto 0 );
--signal tb_read : std_logic;
--signal tb_dft_status : std_logic_vector(1 downto 0);
--signal tb_dut_status : std_logic;
--signal tb_dut_mem_flag : std_logic;

-- SIGNALs for MEMORY CONTROLLER
--signal tb_init : std_logic;                 -- enables CONTROLLER
--signal tb_read_enable : std_logic;
--signal tb_write_en : std_logic;
--signal tb_addr : std_logic_vector(5 downto 0);
signal tb_data_out : std_logic_vector(16 downto 0);
signal tb_gold_output : std_logic_vector(16 downto 0);

-- SIGNALS for DFT Controller
--signal tb_test_init : std_logic;
--signal tb_status : std_logic;
--signal tb_start_test : std_logic;
--signal tb_read_test : std_logic;
signal tb_seven_seg : std_logic_vector(6 downto 0);
signal tb_anode : std_logic_vector(3 downto 0);




signal period : time := 10 ns;
constant N:integer         :=  8;
constant dataskew:time     :=  1 ns;

--signal logic_1 : std_logic;
--signal clock_counter : integer ;

begin

-- clock
clock: CLOCKGENERATOR 
  generic map ( clkhalfperiod => 5 ns )
  port map( clk => tb_clk);

--FILE_READ_BLOCK:FILE_READ
---- generic map ( file_name => "/h/d1/s/vi7715si-s/Desktop/ICP1/Design_Files/ExtendedMM/Test_Ready/testvectors.txt" , width => N , datadelay =>dataskew) 
--generic map ( file_name => "E:\ICP2\DesignFiles\testvectors.txt" , width => N , datadelay =>dataskew) 
--port map( 
--          CLK => tb_clk,
--          RESET => logic_1,
--          Q => tb_input_matrix
--          );

-- logic_1 <= '1';
  
--  DUT_MATRIX_MULTIPLIER: MATRIX_MULTIPLIER
--     Port map( 
--                clk => tb_clk,
--                reset => tb_reset,
--                start => tb_init,
--		        read => tb_read,
--                input_matrix => tb_input_matrix,
--                status => tb_status,
--                output_matrix => tb_output_matrix 
--       );

			 
			 
 -- STIMULUS generation
 tb_reset <= '1' after 1*period,
              '0' after 2*period;
              
tb_init <= '0' after 1*period,
            '1' after 2*period;
--            '0' after 3*period ;   -- Start system
            


DUT_DFT_EMM: TOP_DFT_EMM
              Port map ( 
                     clk => tb_clk,
                     reset => tb_reset,
                     test_init => tb_init,
                     seven_seg => tb_seven_seg,
                     anode => tb_anode,
                     matrix_output => tb_data_out,
                     gold_data => tb_gold_output
                    );

                    
--tb_read <= '0' after 1*period,
--           '1' after 1035*period,
--           '0' after 1440*period;             
 
 
--DUT_IM: input_matrix_read
--              Port map( 
--                    clk => tb_clk,
--                    reset => tb_reset,
--                    enable => tb_init,
--                    output => tb_data_out
--                    );                 

--    DUT_GoldenData:golden_data_read
--              Port map( 
--                    clk => tb_clk,
--                    reset => tb_reset,
--                    enable => tb_init,
--                    output => tb_data_out
--                    ); 

----- MAIN MODULE TEST DOWN HERE -------

--DUT_DFT_CONTROLLER: DFT_CONTROLLER
--  Port map( 
--        clk => tb_clk,
--        reset => tb_reset,
--        test_init => tb_init,
--        dut_status => tb_dut_status,
--        dut_mem_flag => tb_dut_mem_flag,
--        dft_status => tb_dft_status,
--        start_test => tb_start_test,
--        read_test => tb_read_test
--  );
  
  

--DUT_DFT:DFT_MM
--        Port map (
--                clk => tb_clk,
--                reset => tb_reset,
--                start_test => tb_start_test,
--                read_test => tb_read_test,
--                dft_status => tb_dft_status,
--                dut_status => tb_dut_status,
--                dut_mem_flag => tb_dut_mem_flag,                
--                test_output => tb_data_out,
--                gold_output => tb_gold_output                                               
--                );
            
end Behavioral;
