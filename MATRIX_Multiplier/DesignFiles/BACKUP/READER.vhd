

-- Module for loading input matrix elements into 32 number of 8 bit registers.
-- Assuming 8-bit parallel input to the system
-- How the Input Matrix is entered ... will effect product Matrix
-- Input Matrix is stored column-wise as 32 bit 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;


entity reader is
  Port ( 
            clk : in std_logic;
            reset : in std_logic;
            i_x : in std_logic_vector(31 downto 0);			--- comes from 1 RAM memory location... has 4 input matrix values
            i_enable : in std_logic;                    -- comes from MM_controller [ datapath_ctrl(1) ]
            o_data :out out_port      -- refer array_pkg for type
--            o_done : out std_logic					---- goes HIGH when 8 shifts have been completed
  );
end reader;

architecture Behavioral of reader is

signal done_next : std_logic;
signal input_buffer : std_logic_vector(31 downto 0);
signal counter, counter_next : unsigned(4 downto 0);          -- will be used to count to 16
signal load_done : std_logic;                   -- goes to HIGH when 8 counts have been completed

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
        
--        o_data_buffer(0) <=X_reg(7 downto 0);
--        o_data_buffer(1) <=X_reg(15 downto 8);
--        o_data_buffer(2) <=X_reg(23 downto 16);
--        o_data_buffer(3) <=X_reg(31 downto 24);
--        o_data_buffer(4) <=X_reg(39 downto 32);
--        o_data_buffer(5) <=X_reg(47 downto 40);
--        o_data_buffer(6) <=X_reg(55 downto 48);
--        o_data_buffer(7) <=X_reg(63 downto 56);         
--        o_data_buffer(8) <=X_reg(71 downto 64);
--        o_data_buffer(9) <=X_reg(79 downto 72);
--        o_data_buffer(10) <=X_reg(87 downto 80);
--        o_data_buffer(11) <=X_reg(95 downto 88);
--        o_data_buffer(12) <=X_reg(103 downto 96);
--        o_data_buffer(13) <=X_reg(111 downto 104);
--        o_data_buffer(14) <=X_reg(119 downto 112);
--        o_data_buffer(15) <=X_reg(127 downto 120);        
--        o_data_buffer(16) <=X_reg(135 downto 128);
--        o_data_buffer(17) <=X_reg(143 downto 136);
--        o_data_buffer(18) <=X_reg(151 downto 144);
--        o_data_buffer(19) <=X_reg(159 downto 152);
--        o_data_buffer(20) <=X_reg(167 downto 160);
--        o_data_buffer(21) <=X_reg(175 downto 168);
--        o_data_buffer(22) <=X_reg(183 downto 176);
--        o_data_buffer(23) <=X_reg(191 downto 184);         
--        o_data_buffer(24) <=X_reg(199 downto 192);
--        o_data_buffer(25) <=X_reg(207 downto 200);
--        o_data_buffer(26) <=X_reg(215 downto 208);
--        o_data_buffer(27) <=X_reg(223 downto 216);
--        o_data_buffer(28) <=X_reg(231 downto 224);
--        o_data_buffer(29) <=X_reg(239 downto 232);
--        o_data_buffer(30) <=X_reg(247 downto 240);
--        o_data_buffer(31) <=X_reg(255 downto 248);     
-- o_data_buffer(0) <=X_reg(0 to 7);
-- o_data_buffer(1) <=X_reg(8 to 15);
-- o_data_buffer(2) <=X_reg(16 to 23);
-- o_data_buffer(3) <=X_reg( 24 to 31);
-- o_data_buffer(4) <=X_reg( 32 to 39);
-- o_data_buffer(5) <=X_reg(40 to 47 );
-- o_data_buffer(6) <=X_reg( 48 to 55);
-- o_data_buffer(7) <=X_reg(56 to  63);         
-- o_data_buffer(8) <=X_reg(64 to  71 );
-- o_data_buffer(9) <=X_reg(72 to  79);
-- o_data_buffer(10) <=X_reg(80 to  87);
-- o_data_buffer(11) <=X_reg(88 to  95);
-- o_data_buffer(12) <=X_reg(96 to  103);
-- o_data_buffer(13) <=X_reg(104 to  111);
-- o_data_buffer(14) <=X_reg(112 to  119);
-- o_data_buffer(15) <=X_reg( 120 to  127);        
-- o_data_buffer(16) <=X_reg( 128 to  135);
-- o_data_buffer(17) <=X_reg(136 to  143);
-- o_data_buffer(18) <=X_reg(144 to  151);
-- o_data_buffer(19) <=X_reg(152 to  159);
-- o_data_buffer(20) <=X_reg(160 to  167);
-- o_data_buffer(21) <=X_reg( 168 to  175);
-- o_data_buffer(22) <=X_reg(176 to  183);
-- o_data_buffer(23) <=X_reg(184 to  191);         
-- o_data_buffer(24) <=X_reg( 192 to  199);
-- o_data_buffer(25) <=X_reg(200  to  207);
-- o_data_buffer(26) <=X_reg( 208 to  215);
-- o_data_buffer(27) <=X_reg( 216 to  223);
-- o_data_buffer(28) <=X_reg(224 to  231);
-- o_data_buffer(29) <=X_reg(232 to  239);
-- o_data_buffer(30) <=X_reg( 240 to  247);
-- o_data_buffer(31) <=X_reg( 248 to  255);     
 
        

      end if;               
end process;



end Behavioral;
