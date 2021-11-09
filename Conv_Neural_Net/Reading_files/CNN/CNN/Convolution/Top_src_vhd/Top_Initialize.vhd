----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2018 11:12:22 PM
-- Design Name: 
-- Module Name: Top_Initialize - Behavioral
-- Project Name: Initialize the coefficients
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created Shenbagaraman Ramakrishnan
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_Initialize is
    port (
        clk             : in std_logic;
        rst             : in std_logic;
        start_in        : in std_logic;
        f_in            : out std_logic_vector(3 downto 0);        
        valid_in_f      : out std_logic;        
        k_FC1_in        : out std_logic_vector(3 downto 0);
        valid_k_FC1_in  : out std_logic;
        k_FC2_in        : out std_logic_vector(3 downto 0);
        valid_k_FC2_in  : out std_logic;
        start_read      : out std_logic
	 );
end TOP_Initialize;

architecture Behavioral of Top_Initialize is

type state_type_fin is (idle,counter,finish);
signal curr_state_fin, next_state_fin : state_type_fin;
type state_type_fc1 is (idle,counter,finish);
signal curr_state_fc1, next_state_fc1 : state_type_fc1;
type state_type_fc2 is (idle,counter,finish);
signal curr_state_fc2, next_state_fc2 : state_type_fc2;
type state_type_read is (idle,counter,finish);
signal curr_state_read, next_state_read : state_type_read;
signal count_fin,count_fc1,count_fc2,next_count_fin,next_count_fc1,next_count_fc2,count_fc1_del,count_fc1_del2 : unsigned (5 downto 0);
signal count_start_read,next_count_start_read : unsigned (6 downto 0);
signal start_sig,start_sig_del :std_logic;
type array_type_fin is array (0 to 15) of std_logic_vector(3 downto 0); --Initializing the filter weights of convolution
type array_type_fc1 is array (0 to 47) of std_logic_vector(3 downto 0); --Initializing the filter weights of FC1
type array_type_fc2 is array (0 to 2) of std_logic_vector(3 downto 0);  --Initializing the filter weights of FC2
signal rom_mem_fin: array_type_fin:= (  "1101",
                                        "1111",
                                        "0001",
                                        "1111",
                                        "0010",
                                        "1110",
                                        "0000",
                                        "0000",
                                        "0000",
                                        "0011",
                                        "0000",
                                        "1101",
                                        "1111",
                                        "1110",
                                        "1110",
                                        "0100"   
                                     );
 signal rom_mem_fc1 : array_type_fc1 := ("0010",
                                         "0010",
                                         "0010",
                                         "0101",
                                         "0011",
                                         "0100",
                                         "0110",
                                         "0101",
                                         "0011",
                                         "0101",
                                         "0011",
                                         "0011",
                                         "0011",
                                         "0100",
                                         "0010",
                                         "0010",
                                         "0010",
                                         "1010",
                                         "0010",
                                         "1110",
                                         "1101",
                                         "0001",
                                         "1110",
                                         "1011",
                                         "0000",
                                         "1110",
                                         "1111",
                                         "1101",
                                         "0000",
                                         "1110",
                                         "1110",
                                         "0011",
                                         "0000",
                                         "0011",
                                         "1111",
                                         "1101",
                                         "0011",
                                         "1000",
                                         "0001",
                                         "1100",
                                         "0000",
                                         "1110",
                                         "1010",
                                         "1101",
                                         "0000",
                                         "1110",
                                         "0001",      
                                         "1101"                       
                                         );
   signal rom_mem_fc2 : array_type_fc2 := ( "1000",
                                            "0111",
                                            "0111"                               
                                           );

begin

sequential:
  process (clk,rst)
  begin  
     if(rst = '1') then
        curr_state_fin   <= idle;
        curr_state_fc1   <= idle;
        curr_state_fc2   <= idle;
        curr_state_read  <= idle;
        count_fin        <= (others => '0'); --To index the rom to the particular signal
        count_fc1        <= (others => '0');
        count_fc2        <= (others => '0');
        count_start_read <= (others => '0');
        
     elsif(clk'event and clk='1') then
        curr_state_fin   <= next_state_fin;
        curr_state_fc1   <= next_state_fc1;
        curr_state_fc2   <= next_state_fc2;
        curr_state_read  <= next_state_read;
        count_fin        <= next_count_fin;
        count_fc1        <= next_count_fc1;
        count_fc2        <= next_count_fc2;
        count_start_read <= next_count_start_read;
     end if;     
 end process sequential;  
 
 f_in <= rom_mem_fin(to_integer(count_fin));
 k_FC1_in <= rom_mem_fc1 (to_integer(count_fc1));
 k_FC2_in <= rom_mem_fc2 (to_integer(count_fc2));

-- next_count_fin <= (others => '0') when count_fin = 15 else count_fin + 1;
-- next_count_fc1 <= (others => '0') when count_fc1 = 47 else count_fc1 + 1;
-- next_count_fc2 <= (others => '0') when count_fc2 = 2 else count_fc2 + 1;
 
 
Writing_F_in:
 process(start_in,curr_state_fin,count_fin)
 begin
  
 --default declarations
 next_state_fin <= curr_state_fin;
 next_count_fin   <= (others => '0');
 valid_in_f     <= '0';
            
     case curr_state_fin is
         when idle =>
             if(start_in = '1') then
                 next_state_fin <= counter;
             else
                 next_state_fin <= idle;                 
             end if;
             
         when counter =>
                  
            if(count_fin = 15) then
                 next_count_fin <= (others => '0');
                 valid_in_f     <= '1';    
                 next_state_fin <= finish;            
            else  
                 next_count_fin <= count_fin + 1;  
                 valid_in_f     <= '1'; 
                 next_state_fin <= counter;             
            end if; 
            
          when finish =>
                valid_in_f     <= '0'; 
                next_state_fin <= idle;
                
      end case;
 
 end process Writing_F_in;
 
writing_FC1:

process(start_in,curr_state_fc1,count_fc1)
begin
 --default declarations
next_state_fc1   <= curr_state_fc1;
next_count_fc1   <= (others => '0');
valid_k_FC1_in   <= '0';
           
 case curr_state_fc1 is
    when idle =>
        
        if(start_in = '1') then
            next_state_fc1 <= counter;
        else
            next_state_fc1 <= idle;                 
        end if;
        
    when counter =>
            if(count_fc1 = 47) then
                 next_count_fc1 <= (others => '0'); 
                 next_state_fc1 <= idle;
                 valid_k_FC1_in <= '1';               
            else  
                 next_count_fc1  <= count_fc1 + 1;
                 next_state_fc1  <= counter;   
                 valid_k_FC1_in  <= '1';             
            end if;          
 
     
     when finish =>
              valid_k_FC1_in <= '0'; 
              next_state_fc1 <= idle;
              
    end case;
end process writing_FC1; 

writing_FC2:

process(start_in,curr_state_fc2,count_fc2)
begin
 --default declarations
next_state_fc2   <= curr_state_fc2;
next_count_fc2   <= (others => '0');
valid_k_FC2_in   <= '0';
           
 case curr_state_fc2 is
    when idle =>
        
        if(start_in = '1') then
            next_state_fc2 <= counter;
        else
            next_state_fc2 <= idle;                 
        end if;
        
    when counter =>
            if(count_fc2 = 2) then
                 next_count_fc2 <= (others => '0'); 
                 next_state_fc2 <= idle;
                 valid_k_FC2_in <= '1';               
            else  
                 next_count_fc2  <= count_fc2 + 1;
                 next_state_fc2  <= counter;   
                 valid_k_FC2_in  <= '1';             
            end if;
     when finish =>
                     valid_k_FC2_in <= '0'; 
                     next_state_fc2 <= idle;
    end case;
end process writing_FC2;

start_memory_reading:

process(start_in,curr_state_read,count_start_read)
begin
 --default declarations
next_state_read   <= curr_state_read;
next_count_start_read   <= (others => '0');
start_read <= '0';
           
 case curr_state_read is
    
    when idle =>
        
        if(start_in = '1') then
            next_state_read <= counter;
        else
            next_state_read <= idle;                 
        end if;
        
    when others =>
    
        if(count_start_read = 100) then
             next_count_start_read  <= (others => '0'); 
             next_state_read        <= idle;
             start_read             <= '1';               
        else  
             next_count_start_read  <= count_start_read + 1;
             next_state_read        <= counter;   
             start_read             <= '0';             
        end if;

    end case;
end process start_memory_reading;


end Behavioral;
