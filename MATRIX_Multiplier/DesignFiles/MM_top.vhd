--  New Top file for Matrix Multiplier
-- Integrate ROM behavioral Model 
-- -- For now , I am using IP generator RAM ( same specifications as ROM behavioral model ) 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library work;
use work.array_pkg.all;


entity MM_top is
    Port (
            clk : in std_logic;
            reset : in std_logic;
            Input_Mat : std_logic_vector( 7 downto 0);
            prod_elem : out std_logic_vector( 15 downto 0) ;            -- This will hold 2 elements of product matrix
            status : out std_logic                                      -- Goes HIGH when the system is computing 
                                                                        -- ( i.e till RAM is filled with product elements)
            );
end MM_top;

architecture Behavioral of MM_top is

-- Components

-- Load Module
component load_module 
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(7 downto 0);
            i_enable : in std_logic;                    
            o_data_odd, o_data_even :out out_port;      -- refer array_pkg for type. STORES data alternatively in odd - even registers.
            o_done : out std_logic                      -- '1' bit ready signal goes to controller. STARTS calculation.
  );
end component;


---- Controller ----
component MM_controller is
   Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in  std_logic_vector(5 downto 0);
        load_count : out unsigned( 1 downto 0);    -- used to select the element to load
        ready: out std_logic;                                   -- Shows status of the system
        datapath_ctrl : out std_logic_vector( 5 downto 0)       -- this signal will activate section of datapath     
        );
end component;
---- Controller Ends here ----
component LOADER is
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
end component;

---- DataPath -----
component data_path is
Port ( 
        clk : in std_logic;
        reset : in std_logic;
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector( 6 downto 0);
        ctrl : in std_logic_vector( 5 downto 0);                        -- This has to be mapped to controllers datapath_ctrl which is 8 bits wide
        done : out std_logic_vector(5 downto 0);
        out_Prod: out std_logic_vector( 16 downto 0)                -- will change it later
            );
end component;
---- DataPath ends here ----

-- Multiply and Accumulate --

component sig_altmult_accum is
	port (
		a			: in unsigned(7 downto 0);
		b			: in unsigned (6 downto 0);
		clk			: in std_logic;
		sload		: in std_logic;
		accum_out	: out unsigned (15 downto 0)
	);
	
end component;


-- MACC ends here --

-- Signals

-- ROM Behavioral Model ----
component COEF_ROM IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
  );
END component;
--- ROM behavioral Model ends here ---


--- RAM Behavioral Model ----

component SRAM_SP_WRAPPER is
  port (
    ClkxCI  : in  std_logic;
    CSxSI   : in  std_logic;            -- Active Low
    WExSI   : in  std_logic;            --Active Low
    AddrxDI : in  std_logic_vector (7 downto 0);
    RYxSO   : out std_logic;
    DataxDI : in  std_logic_vector (31 downto 0);
    DataxDO : out std_logic_vector (31 downto 0)
    );
end component;


signal data_odd, data_even : out_port;                  -- is an array of std_logic_vector(7 downo 0) : SIZE = 16
signal out_Prod : std_logic_vector( 16 downto 0);
signal prod_elem_odd, prod_elem_even : unsigned(15 downto 0);               -- will be used to store product elements on RAM.
signal done : std_logic_vector( 5 downto 0);
signal datapath_ctrl : std_logic_vector( 5 downto 0);
signal busy: std_logic;                                 -- will be used to indicate STATUS of the system.
signal load_count  : unsigned( 1 downto 0);
signal X_even, X_odd : std_logic_vector( 7 downto 0);
signal A_odd, A_even : std_logic_vector( 6 downto 0);   
signal row_count, next_row_count : unsigned( 1 downto 0);

-- ROM data load signals
signal address: unsigned( 3 downto 0);
signal ROM_address : std_logic_vector( 3 downto 0 );
signal dataROM : std_logic_vector( 13 downto 0);    -- Elements of Co-efficient Matrix
signal ROM_enable : std_logic;                      -- ROM enable Signal

-- RAM STORE SIGNALS --
  signal LOW  : std_logic;
  signal HIGH : std_logic;
  signal ramAddr : std_logic_vector(7 downto 0);        -- cam point to 256 memory locations
  signal ramData_in , ramData_out : std_logic_vector( 31 downto 0 );      
  signal  RY_SO : std_logic;
  
-- SIGNALS for MACC module
signal MACC_count : unsigned( 2 downto 0);


begin



--done(7) <= '0';             -- Hardcode 7th bit as '0'

controller: MM_controller
  Port map ( 
        clk => clk,
        reset => reset,
        done => done,                        -- comes from datapath, loader and RAM store units
        load_count => load_count,
        ready => busy,
        datapath_ctrl => datapath_ctrl       -- this signal will activate section of datapath     
        );
 
 done(0)<= '1';
 READER: load_module 
  Port map( 
            clk => clk,
            reset => reset,
            i_x => Input_Mat,
            i_enable => datapath_ctrl(1),               
            o_data_odd =>data_odd ,
            o_data_even => data_even ,
            o_done => done(1)
  );
       
 ROM_address <= std_logic_vector( address );  
 ROM_enable <= '1' ;            -- SHOULD COME FROM MM_controller
      
      
  -- removing rom ... using LOADER module
 
  LOAD:LOADER
     Port map (  
            clk=> clk,
            enable=> datapath_ctrl(2),                 ------ comes from datapath_ctrl(2)
            load_signal => load_count,
            in_x_odd=>  data_odd,               ----- array of ODD elements of Input Matrix 
            in_x_even =>data_even,               ----- array of even elements of Input Matrix
            out_x_odd => X_odd,     ----individual element of Input Matrix for calculation
            out_x_even =>X_even,      ----individual element of Input Matrix for calculation
            out_a_odd =>A_odd,      ---- individual element of co-efficient matrix for calculation
            out_a_even =>A_even,
            done => done(2)
             );     



dataPath_odd: sig_altmult_accum
port map(
		a => unsigned((X_odd)),
		b => unsigned((A_odd)),
		clk => clk,
		sload => datapath_ctrl(3),            -- datapath_ctrl(1) must remain HIGH for calculations to complete
		accum_out => prod_elem_odd
            );

dataPath_even: sig_altmult_accum
port map(
		a => unsigned((X_even)),
		b => unsigned((A_even)),
		clk => clk,
		sload => datapath_ctrl(3),            -- datapath_ctrl(1) must remain HIGH for calculations to complete
		accum_out => prod_elem_even
            );
            
 MAC_counter :process(datapath_ctrl(3), clk, MACC_count)
 begin
 if rising_edge(clk) then
    if datapath_ctrl(3) = '1' then
    MACC_count <= MACC_count + 1;
    else
    MACC_count <= (others => '0');
    end if;
    if MACC_count = 7 then
    done(3) <= '1';
    else
    done(3) <= '0';
    end if;
    end if;
 end process;
 
---- RAM STORE Module -----

done(4) <= '0';
  
  LOW  <= '0';
  HIGH <= '1';
 
 RAM_STORE : SRAM_SP_WRAPPER
 port map(
     ClkxCI  => clk,
    CSxSI  => HIGH,           -- Active Low
    WExSI   => HIGH,            --Active Low
    AddrxDI =>  ramAddr,            -- Some address counter
    RYxSO  =>  RY_SO , 
    DataxDI  =>ramData_in ,             --- This gets data from prod_elem
    DataxDO =>  ramData_out
    );
    
    
 ----- END RAM STORE module -----
 
 
 -- Performance Block goes here ----
 -- 
done(5)<= '0';          -- will be updated by PERF_BLOCK eventually
 --
 --
 ---- Performance Block ends ---


register_up:process(clk,out_Prod, busy, row_count)
begin
    if reset = '1' then
    prod_elem <= (others => '0');
    row_count <= "00";
    elsif rising_edge(clk) then
    prod_elem <= out_Prod( 15 downto 0);
    status <= not( busy);
    row_count <= next_row_count; 
    end if;

end process;
-----------------------------------------------------------------
-------- Needs to be integrated with ROM behavioral Model -----------
----------- Using Xilinx IP generator in the absence of ROM beh. model

  
 --- This needs to be fixes ---- RAM STORE
 RAM_STORE_Proc: process( clk,  out_Prod)
 begin
    if rising_edge( clk) then
        ramData_in(15 downto 0) <= std_logic_vector(prod_elem_odd);       -- recheck and match width 
        ramData_in( 31 downto 16 ) <= std_logic_vector(prod_elem_even);
        end if;
 end process; 
 
                
 
end Behavioral;
