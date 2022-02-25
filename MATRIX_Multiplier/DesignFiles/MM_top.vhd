--  New Top file for Matrix Multiplier

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity MM_top is
    Port (
            clk : in std_logic;
            reset : in std_logic;
            in_X_odd , in_X_even : std_logic_vector( 7 downto 0);       -- 8 bits wordlength
            in_A_odd, in_A_even : std_logic_vector( 6 downto 0);        -- 7 bits wordlength
            ctrl : in std_logic_vector( 7 downto 0);                       -- control signal from ControlUnit
            prod_elem : out std_logic_vector( 15 downto 0) ;            -- This will hold 2 elements of product matrix
            status : out std_logic                                      -- Goes HIGH when the system is computing 
                                                                        -- ( i.e till RAM is filled with product elements)
            );
end MM_top;

architecture Behavioral of MM_top is

-- Components

---- Controller ----
component MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in  std_logic_vector(7 downto 0);
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


begin


end Behavioral;
