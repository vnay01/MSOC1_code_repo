library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.comp_pkg.all;
use work.test_pkg.all;

entity tb_MUL is
--  Port ( );
end tb_MUL;

architecture Behavioral of tb_MUL is

--module TOP_MM_w_Pads(clk_P, reset_P, START_P, READ_P, READY_P, INP_P,
--     UTP_P);
     
     component TOP_MM_w_pads  is
     port (
            clk_P : in std_logic;
            reset_P : in std_logic;
            START_P : in std_logic;
            READ_P : in std_logic;
            READY_P : out std_logic;
            INP_P: in std_logic_vector( 7 downto 0 );
            UTP_P : out std_logic_vector( 7 downto 0 )
                );
               end component;
                
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

--component ADDER_MODULE is
-- Port ( 
--        clk : in std_logic;
--        reset: in std_logic;
--        enable : in std_logic;
--        operand_a: in unsigned(15 downto 0);
--        operand_b: in unsigned(15 downto 0);
--        adder_out: out unsigned( 15 downto 0 )
--        );
--end component;

--component COMPUTE_UNIT is
--  Port (    
--        clk : in std_logic;
--        reset : in std_logic;
--        clear: in std_logic;
--        enable : in std_logic;
--        operand_x1:  in std_logic_vector( 7 downto 0 );
--        operand_x2:  in std_logic_vector( 7 downto 0 );
--        operand_x3:  in std_logic_vector( 7 downto 0 );
--        operand_x4:  in std_logic_vector( 7 downto 0 );
--        operand_a1:  in std_logic_vector( 7 downto 0 );
--        operand_a2:  in std_logic_vector( 7 downto 0 );
--        operand_a3:  in std_logic_vector( 7 downto 0 );
--        operand_a4:  in std_logic_vector( 7 downto 0 );
--        prod_element : out std_logic_vector( 15 downto 0 )
--        );

--end component;

--component CONTROLLER is
--  Port ( 
--        clk : in std_logic;
--        reset : in std_logic;
--        init : in std_logic;       -- initialize signal the controller. Connects to START of MATRIx_MULTIPLIER
--        busy: out std_logic;       -- busy signal . Active when computation is being done
--        block_select : out std_logic_vector( 2 downto 0 );          -- selects Register bank which hold input Matrix elements
--        element_select: out std_logic_vector( 2 downto 0 );         -- enables 1 register from register bank to hold one element of input matrix
--        rom_bank_sel: out std_logic_vector( 3 downto 0 );           -- selects the register bank which hold ROM coefficients
--        rom_enable: out std_logic;
--        rom_address: out std_logic_vector( 6 downto 0 );
--        col_count: out unsigned( 3 downto 0 );
--        row_count: out unsigned( 3 downto 0 );
--        compute_en: out std_logic;
--        compute_clear: out std_logic               
--        );
--end component;

component MATRIX_MULTIPLIER is
 Port ( 
       clk : in std_logic;
       reset : in std_logic;
       start: in std_logic;
       read: in std_logic;
       input_matrix : in std_logic_vector( 7 downto 0 );
       status : out std_logic;                              -- controller will update this
       output_matrix : out std_logic_vector( 15 downto 0 )  -- Goes to RAM store controller 
       );
end component;

-- signals
signal tb_clk: std_logic;
signal tb_reset : std_logic;
--signal tb_clear: std_logic;
--signal tb_enable : std_logic;
--signal tb_operand_x1, tb_operand_x2, tb_operand_x3, tb_operand_x4: std_logic_vector( 7 downto 0 );
--signal tb_operand_a1, tb_operand_a2, tb_operand_a3, tb_operand_a4: std_logic_vector( 7 downto 0 );
--signal tb_prod_element: std_logic_vector( 15 downto 0 );

-- SIGNALs for CONTROLLER
signal tb_init : std_logic;
--signal tb_busy: std_logic;
--signal tb_block_select: std_logic_vector( 2 downto 0 );        
--signal tb_element_sel: std_logic_vector( 2 downto 0 );        
--signal tb_rom_bank_sel:std_logic_vector( 3 downto 0 );       
--signal tb_rom_enable : std_logic;        
--signal tb_rom_address :std_logic_vector( 6 downto 0);
--signal tb_col_count, tb_row_count : unsigned( 3 downto 0 );
--signal tb_compute_en : std_logic;
--signal tb_compute_clear : std_logic;

-- MATRIX_MULTIPLIER connections
signal tb_input_matrix : std_logic_vector( 7 downto 0) ;
signal tb_status : std_logic;
signal tb_output_matrix : std_logic_vector( 15 downto 0 );
signal tb_read : std_logic;
signal period : time := 20 ns;

begin

-- clock
clock: CLOCKGENERATOR 
  generic map ( clkhalfperiod => 10 ns )
  port map( clk => tb_clk);
  
  
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
       
       
-- DUT_MATRIX_MULTIPLIER: TOP_MM_w_pads      
--        port map (
--            clk_P => tb_clk,
--            reset_P => tb_reset,
--            START_P=>  tb_init,
--            READ_P => tb_read,
--            READY_P => tb_status,
--            INP_P => tb_input_matrix,
--            UTP_P => tb_output_matrix
--                );
-- DUT_CONTROLLER : CONTROLLER
--  Port map( 
--        clk => tb_clk,
--        reset => tb_reset,
--        init => tb_init,
--        busy => tb_busy,
--        block_select => tb_block_select,
--        element_select => tb_element_sel,
--        rom_bank_sel => tb_rom_bank_sel,
--        rom_enable => tb_rom_enable,
--        rom_address => tb_rom_address,
--        col_count => tb_col_count,
--        row_count => tb_row_count,
--        compute_en => tb_compute_en,
--        compute_clear => tb_compute_clear               
--        );
        


--DUT_COMPUTE: COMPUTE_UNIT
--port map(
--        clk => tb_clk,
--        reset => tb_reset,
--        clear => tb_clear,
--        enable => tb_enable,
--        operand_x1 => tb_operand_x1,
--        operand_x2 => tb_operand_x2,
--        operand_x3 => tb_operand_x3,
--        operand_x4 => tb_operand_x4,
--        operand_a1 => tb_operand_a1,
--        operand_a2 => tb_operand_a2,
--        operand_a3 => tb_operand_a3,
--        operand_a4 => tb_operand_a4,
--        prod_element => tb_prod_element
--        );
        
 -- STIMULUS generation
 tb_reset <= '1' after 1*period,
              '0' after 2*period;

 tb_init <= '0' after 1*period,
            '1' after 2*period ;   -- Start Controller
            
tb_read <= '0'; 
-- process
-- begin
-- for i in 0 to 64 loop
--    tb_input_matrix <= std_logic_vector( to_unsigned(i, 8)); 
--    wait for period;
--    end loop;
-- end process;
 tb_input_matrix <= x"01" after 2*period,
                    x"02" after 3*period,
                    x"03" after 4*period,
                    x"04" after 5*period,
                    x"05" after 6*period,
                    x"06" after 7*period,
                    x"07" after 8*period,
                    x"08" after 9*period,
                    x"09" after 10*period,
                    x"0a" after 11*period,
                    x"0b" after 12*period,
                    x"0c" after 13*period,
                    x"0d" after 14*period,
                    x"0e" after 15*period,
                    x"0f" after 16*period,
                    x"10" after 17*period,
                         

                    x"11" after 18*period,
                    x"12" after 19*period,
                    x"13" after 20*period,
                    x"14" after 21*period,
                    x"15" after 22*period,
                    x"16" after 23*period,
                    x"17" after 24*period,
                    x"18" after 25*period,
                    x"19" after 26*period,
                    x"1a" after 27*period,
                    x"1b" after 28*period,
                    x"1c" after 29*period,
                    x"1d" after 30*period,
                    x"1e" after 31*period,
                    x"1f" after 32*period,
                    
                    x"20" after 33*period,
                    x"21" after 34*period,
                    x"22" after 35*period,
                    x"23" after 36*period,
                    x"24" after 37*period,
                    x"25" after 38*period,
                    x"26" after 39*period,
                    x"27" after 40*period,
                    x"28" after 41*period,
                    x"29" after 42*period,
                    x"2a" after 43*period,
                    x"2b" after 44*period,
                    x"2c" after 45*period,
                    x"2d" after 46*period,
                    x"2e" after 47*period,
                    x"2f" after 48*period,
                    
                    x"30" after 49*period,
                    x"31" after 50*period,
                    x"32" after 51*period,
                    x"33" after 52*period,
                    x"34" after 53*period,
                    x"35" after 54*period,
                    x"36" after 55*period,
                    x"37" after 56*period,
                    x"38" after 57*period,
                    x"39" after 58*period,
                    x"3a" after 59*period,
                    x"3b" after 60*period,
                    x"3c" after 61*period,
                    x"3d" after 62*period,
                    x"3e" after 63*period,
                    x"3f" after 64*period,
                    x"40" after 65*period,
                    x"00" after 66*period;     
              
-- tb_operand_x1 <= x"00" after 2*period;
-- tb_operand_x2 <= x"01" after 2*period;
-- tb_operand_x3 <= x"02" after 2*period;
-- tb_operand_x4 <= x"03" after 2*period;

--                 x"04" after 6*period,
--                 x"05" after 7*period,
--                 x"06" after 10*period,
--                 x"07" after 11*period,
--                 x"08" after 12*period,
--                 x"09" after 13*period,
--                 x"0a" after 14*period,
--                 x"0b" after 15*period;
 
-- tb_operand_a1 <= x"06" after 2*period;
-- tb_operand_a2 <= x"07" after 2*period;
-- tb_operand_a3 <= x"08" after 2*period;
-- tb_operand_a4 <= x"09" after 2*period;
--                 x"07" after 3*period,
--                 x"08" after 4*period,
--                 x"09" after 5*period,
--                 x"0a" after 6*period,
--                 x"0b" after 7*period,
--                 x"00" after 10*period,
--                 x"01" after 11*period,
--                 x"02" after 12*period,
--                 x"03" after 13*period,
--                 x"04" after 14*period,
--                 x"05" after 15*period;

--tb_clear <= '1' after 1*period,
--            '0' after 2*period;
       
--tb_enable <= '0' after 1*period,
--               '1' after 2*period,
--               '0' after 5*period,
--               '1' after 6*period,
--               '0' after 15*period; 
            
end Behavioral;
