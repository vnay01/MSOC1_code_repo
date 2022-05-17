library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.reg_pkg.all;

entity LOADER_UNIT is
  Port ( 
        clk:  in std_logic;
        reset : in std_logic;
        enable: in std_logic;                       -- controller enables register update
        col_count : in unsigned( 3 downto 0 );      -- 12 columns
        row_count : in unsigned( 3 downto 0 );      -- 16 rows
        data_block_1A : in rom_out;
        data_block_2A : in rom_out;
        data_block_3A : in rom_out;
        data_block_4A : in rom_out;
        data_block_1B : in rom_out;
        data_block_2B : in rom_out;
        data_block_3B : in rom_out;
        data_block_4B : in rom_out;        
        data_block_6 : in rom_out;
        data_block_7 : in rom_out;
        data_block_8 : in rom_out;
        data_block_9 : in rom_out;
        data_block_10 : in rom_out;
        data_block_11 : in rom_out;
        out_x1 : out std_logic_vector( 7 downto 0 );
        out_x2 : out std_logic_vector( 7 downto 0 );
        out_x3 : out std_logic_vector( 7 downto 0 );
        out_x4 : out std_logic_vector( 7 downto 0 );
        out_a1 : out std_logic_vector( 7 downto 0 );
        out_a2 : out std_logic_vector( 7 downto 0 );
        out_a3 : out std_logic_vector( 7 downto 0 );
        out_a4 : out std_logic_vector( 7 downto 0 )
        );
end LOADER_UNIT;

architecture Behavioral of LOADER_UNIT is

-- SIGNALS
signal w_col_count, w_row_count : unsigned( 3 downto 0 );
signal w_enable : std_logic;

signal reg_out_x1, reg_out_x2, reg_out_x3, reg_out_x4 :std_logic_vector( 7 downto 0 );
signal reg_out_a1, reg_out_a2, reg_out_a3, reg_out_a4 : std_logic_vector( 7 downto 0 ); 

begin

-- GLOBAL connections
w_enable <= enable ;
out_x1 <= reg_out_x1;
out_x2 <= reg_out_x2;
out_x3 <= reg_out_x3;
out_x4 <= reg_out_x4;

out_a1 <= reg_out_a1;
out_a2 <= reg_out_a2;
out_a3 <= reg_out_a3;
out_a4 <= reg_out_a4;

process(clk, reset, w_enable, col_count, row_count)
    begin
        if reset = '1' then
            reg_out_x1 <= ( others =>'0');
            reg_out_x2 <= ( others =>'0');
            reg_out_x3 <= ( others =>'0');
            reg_out_x4 <= ( others =>'0');
            reg_out_a1 <= ( others =>'0');
            reg_out_a2 <= ( others =>'0');
            reg_out_a3 <= ( others =>'0');
            reg_out_a4 <= ( others =>'0');        
        elsif rising_edge( clk ) then
          if w_enable = '1' then
          case col_count is
            when x"0" =>                        -- 1st Column of Product Matrix
                reg_out_a1 <= data_block_7(0);
                reg_out_a2 <= data_block_6(0);
                reg_out_a3 <= data_block_7(1);
                reg_out_a4 <= data_block_6(1);
            when x"1" =>
                reg_out_a1 <= data_block_7(2);
                reg_out_a2 <= data_block_6(2);
                reg_out_a3 <= data_block_7(3);
                reg_out_a4 <= data_block_6(3);
            when x"2" =>
                reg_out_a1 <= data_block_7(4);
                reg_out_a2 <= data_block_6(4);
                reg_out_a3 <= data_block_7(5);
                reg_out_a4 <= data_block_6(5);
            when x"3" =>
                reg_out_a1 <= data_block_7(6);
                reg_out_a2 <= data_block_6(6);
                reg_out_a3 <= data_block_7(7);
                reg_out_a4 <= data_block_6(7);
            when x"4" =>
                reg_out_a1 <= data_block_9(0);
                reg_out_a2 <= data_block_8(0);
                reg_out_a3 <= data_block_9(1);
                reg_out_a4 <= data_block_8(1);
            when x"5" =>
                reg_out_a1 <= data_block_9(2);
                reg_out_a2 <= data_block_8(2);
                reg_out_a3 <= data_block_9(3);
                reg_out_a4 <= data_block_8(3);                                                    
            when x"6" =>
                reg_out_a1 <= data_block_9(4);
                reg_out_a2 <= data_block_8(4);
                reg_out_a3 <= data_block_9(5);
                reg_out_a4 <= data_block_8(5);
            when x"7" =>
                reg_out_a1 <= data_block_9(6);
                reg_out_a2 <= data_block_8(6);
                reg_out_a3 <= data_block_9(7);
                reg_out_a4 <= data_block_8(7);
            when x"8" =>
                reg_out_a1 <= data_block_11(0);
                reg_out_a2 <= data_block_10(0);
                reg_out_a3 <= data_block_11(1);
                reg_out_a4 <= data_block_10(1);
            when x"9" =>
                reg_out_a1 <= data_block_11(2);
                reg_out_a2 <= data_block_10(2);
                reg_out_a3 <= data_block_11(3);
                reg_out_a4 <= data_block_10(3);                                                    
            when x"a" =>
                reg_out_a1 <= data_block_11(4);
                reg_out_a2 <= data_block_10(4);
                reg_out_a3 <= data_block_11(5);
                reg_out_a4 <= data_block_10(5);
            when x"b" =>
                reg_out_a1 <= data_block_11(6);
                reg_out_a2 <= data_block_10(6);
                reg_out_a3 <= data_block_11(7);
                reg_out_a4 <= data_block_10(7);    
           when others =>
                NULL;                   
           end case;
           
                    
           case row_count is               
                    when x"0" =>                    -- Since Input Matrix is fed in column-wise manner 
                    reg_out_x1 <= data_block_1A(0);
                    reg_out_x2 <= data_block_1A(1);
                    reg_out_x3 <= data_block_1A(2);
                    reg_out_x4 <= data_block_1A(3);
                    when x"1" =>
                    reg_out_x1 <= data_block_1A(4);
                    reg_out_x2 <= data_block_1A(5);
                    reg_out_x3 <= data_block_1A(6);
                    reg_out_x4 <= data_block_1A(7);
                    when x"2" =>
                    reg_out_x1 <= data_block_1B(8);
                    reg_out_x2 <= data_block_1B(9);
                    reg_out_x3 <= data_block_1B(10);
                    reg_out_x4 <= data_block_1B(11);
                    when x"3" =>
                    reg_out_x1 <= data_block_1B(12);
                    reg_out_x2 <= data_block_1B(13);
                    reg_out_x3 <= data_block_1B(14);
                    reg_out_x4 <= data_block_1B(15);
                    when x"4" =>
                    reg_out_x1 <= data_block_2A(0);
                    reg_out_x2 <= data_block_2A(1);
                    reg_out_x3 <= data_block_2A(2);
                    reg_out_x4 <= data_block_2A(3); 
                    when x"5" =>
                    reg_out_x1 <= data_block_2A(4);
                    reg_out_x2 <= data_block_2A(5);
                    reg_out_x3 <= data_block_2A(6);
                    reg_out_x4 <= data_block_2A(7);                      
                    when x"6" =>
                    reg_out_x1 <= data_block_2B(8);
                    reg_out_x2 <= data_block_2B(9);
                    reg_out_x3 <= data_block_2B(10);
                    reg_out_x4 <= data_block_2B(11); 
                    when x"7" =>
                    reg_out_x1 <= data_block_2B(12);
                    reg_out_x2 <= data_block_2B(13);
                    reg_out_x3 <= data_block_2B(14);
                    reg_out_x4 <= data_block_2B(15);
                    when x"8" =>
                    reg_out_x1 <= data_block_3A(0);
                    reg_out_x2 <= data_block_3A(1);
                    reg_out_x3 <= data_block_3A(2);
                    reg_out_x4 <= data_block_3A(3); 
                    when x"9" =>
                    reg_out_x1 <= data_block_3A(4);
                    reg_out_x2 <= data_block_3A(5);
                    reg_out_x3 <= data_block_3A(6);
                    reg_out_x4 <= data_block_3A(7);                      
                    when x"a" =>
                    reg_out_x1 <= data_block_3B(8);
                    reg_out_x2 <= data_block_3B(9);
                    reg_out_x3 <= data_block_3B(10);
                    reg_out_x4 <= data_block_3B(11); 
                    when x"b" =>
                    reg_out_x1 <= data_block_3B(12);
                    reg_out_x2 <= data_block_3B(13);
                    reg_out_x3 <= data_block_3B(14);
                    reg_out_x4 <= data_block_3B(15);
                    when x"c" =>
                    reg_out_x1 <= data_block_4A(0);
                    reg_out_x2 <= data_block_4A(1);
                    reg_out_x3 <= data_block_4A(2);
                    reg_out_x4 <= data_block_4A(3); 
                    when x"d" =>
                    reg_out_x1 <= data_block_4A(4);
                    reg_out_x2 <= data_block_4A(5);
                    reg_out_x3 <= data_block_4A(6);
                    reg_out_x4 <= data_block_4A(7);                      
                    when x"e" =>
                    reg_out_x1 <= data_block_4B(8);
                    reg_out_x2 <= data_block_4B(9);
                    reg_out_x3 <= data_block_4B(10);
                    reg_out_x4 <= data_block_4B(11); 
                    when x"f" =>
                    reg_out_x1 <= data_block_4B(12);
                    reg_out_x2 <= data_block_4B(13);
                    reg_out_x3 <= data_block_4B(14);
                    reg_out_x4 <= data_block_4B(15);                                                                                                   
                    when others =>
                    NULL;
                 end case;
          end if;
        end if;
end process;


end Behavioral;
