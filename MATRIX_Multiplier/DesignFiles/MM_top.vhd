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
--            start : in std_logic;                                       -- START signal active after load operation is done.
--            in_X_odd , in_X_even : std_logic_vector( 7 downto 0);       -- 8 bits wordlength
--            in_A_odd, in_A_even : std_logic_vector( 6 downto 0);        -- 7 bits wordlength
--            ctrl : in std_logic_vector( 7 downto 0);                       -- control signal from ControlUnit         Not really required if Control unit is integrated
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
        done : in  std_logic_vector(7 downto 0);
        load_count : out unsigned( 1 downto 0);    -- used to select the element to load
        ready: out std_logic;                                   -- Shows status of the system
        datapath_ctrl : out std_logic_vector( 7 downto 0)       -- this signal will activate section of datapath     
        );
end component;
---- Controller Ends here ----

---- DataPath -----
component data_path is
 Port ( 
        clk : in std_logic;
        reset : in std_logic;
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector( 6 downto 0);
        ctrl : in std_logic_vector( 6 downto 0);   -- This has to be mapped to controllers datapath_ctrl which is 8 bits wide
        done : out std_logic_vector(6 downto 0);
        out_Prod: out std_logic_vector( 16 downto 0)
            );
end component;
---- DataPath ends here ----

-- Signals

-- ROM Behavioral Model ----
component COEF_ROM IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
  );
END component;
--- ROM behavioral Model ends here ---


signal data_odd, data_even : out_port;                  -- is an array of std_logic_vector(7 downo 0) : SIZE = 16
signal out_Prod : std_logic_vector( 16 downto 0);
signal done : std_logic_vector( 7 downto 0);
signal datapath_ctrl : std_logic_vector( 7 downto 0);
signal busy: std_logic;                                 -- will be used to indicate STATUS of the system.
signal load_count  : unsigned( 1 downto 0);
signal X_even, X_odd : std_logic_vector( 7 downto 0);
signal A_odd, A_even : std_logic_vector( 6 downto 0);   
signal row_count, next_row_count : unsigned( 1 downto 0);

-- ROM data load signals
signal address: unsigned( 3 downto 0);
signal ROM_address : std_logic_vector( 4 downto 0 );
signal dataROM : std_logic_vector( 13 downto 0);    -- Elements of Co-efficient Matrix
signal ROM_enable : std_logic;                      -- ROM enable Signal

begin


LOADER: load_module 
  Port map( 
            clk => clk,
            reset => reset,
            i_x => Input_Mat,
            i_enable => datapath_ctrl(0),               
            o_data_odd =>data_odd ,
            o_data_even => data_even ,
            o_done => done(0)
  );


controller: MM_controller
  Port map ( 
        clk => clk,
        reset => reset,
        done => done,                        -- comes from datapath, loader and RAM store units
        load_count => load_count,
        ready => busy,
        datapath_ctrl => datapath_ctrl       -- this signal will activate section of datapath     
        );
        
 ROM_address <= "0" & std_logic_vector( address );  
      
ROM: COEF_ROM
  PORT map (
    clka => clk,
    ena => datapath_ctrl(0),
    addra =>ROM_address,
    douta =>dataROM
  );

---- END ROM here 

datapath :data_path
 Port map ( 
        clk=> clk,
        reset => reset,
        in_X_odd => X_odd,
        in_X_even => X_even,
        in_A_odd => A_odd,
        in_A_even => A_even,
        ctrl => datapath_ctrl( 7 downto 1),
        done => done( 7 downto 1),
        out_Prod => out_Prod
            );

-- Process to update input register of DataPath

mem_map:process( load_count, row_count )
begin
        case row_count is
         when "00" =>
            case load_count is
            -- Counter for 1st element of product matrix
            when "00" =>
            address <= x"0";
            X_odd <= data_odd(0);
            X_even <= data_odd(2);
            
            when "01" =>
            address <= x"1";
            X_odd <= data_odd(4);
            X_even <= data_odd(6);          
            
            when "10" =>
            address <= x"2";
            X_odd <= data_odd(8);
            X_even <= data_odd(10);  
            when "11" =>
            address <= x"3";
            X_odd <= data_odd(12);
            X_even <= data_odd(14);
            end case;
        -- Counter for 2nd element
       when "01" =>  
            case load_count is
            when "00" =>
            address <= x"4";
            X_odd <= data_even(0);
            X_even <= data_even(2); 
            when "01" =>
            address <= x"5";
            X_odd <= data_even(4);
            X_even <= data_even(6); 
            when "10" =>
            address <= x"6";
            X_odd <= data_even(8);
            X_even <= data_even(10);
            when "11" =>
            address <= x"7";
            X_odd <= data_even(12);
            X_even <= data_even(14); 
            end case;
            -- Counter for 3rd element
       when "10" =>
        case load_count is     
            when "00" =>
            address <= x"8";
            X_odd <= data_odd(1);
            X_even <= data_odd(3); 
            when "01" =>
            address <= x"9";
            X_odd <= data_odd(5);
            X_even <= data_odd(7); 
            when "10" =>
            address <= x"a";
            X_odd <= data_odd(9);
            X_even <= data_odd(11); 
            when "11" =>
            address <= x"b";
            X_odd <= data_odd(13);
            X_even <= data_odd(15); 
            end case;
            -- Counter for 4th element
       when "11" =>
        case load_count is             
            when "00" =>
            address <= x"c";
            X_odd <= data_even(1);
            X_even <= data_even(3); 
            when "01" =>
            address <= x"d";
            X_odd <= data_even(5);
            X_even <= data_even(7); 
            when "10" =>
            address <= x"e";
            X_odd <= data_even(9);
            X_even <= data_even(11); 
            when "11" =>
            address <= x"f";
            X_odd <= data_even(13);
            X_even <= data_even(15);                                                                                                                                                                     
            end case;
            
        when others =>
            X_odd <= (others => '0');
            X_even <= (others => '0');
            end case;
end process;

rowCounter :process( load_count, row_count )
    begin
        if load_count = "11" then
        next_row_count <= row_count + 1;
        elsif row_count = "11" then
        next_row_count <= "00";
        else
        next_row_count <= row_count;
        end if;  
    end process;

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

ROM_Read : process( clk, address, ROM_enable )
    begin
    if ROM_enable = '1' then
        if rising_edge(clk) then
        A_odd <= dataROM(6 downto 0);
        A_even <= dataROM( 13 downto 7);
        end if;
    else
        A_odd <= (others =>'0');
        A_even <= (others =>'0');
    end if;     
    end process;
end Behavioral;
