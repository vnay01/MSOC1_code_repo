library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.array_pkg.all;



entity LOADER is
    Port (  
            clk : in std_logic;
            enable : in std_logic;                  ------ comes from datapath_ctrl(2)
            reset : in std_logic;
            col_count : in unsigned( 1 downto 0);             -- I donot know what it'll do for now!!!!!! I do NoW
            row_count : in unsigned( 1 downto 0);
            SWITCH : in unsigned( 1 downto 0);                      -- Used to switch elements from ROM access.
            in_mat_elem : in out_port;                  ----- array of elements of Input Matrix         -- Connects with READER Block
            out_x_pe_1: out std_logic_vector( 7 downto 0);       ----individual element of Input Matrix for calculation
            out_x_pe_2: out std_logic_vector( 7 downto 0);      ----individual element of Input Matrix for calculation
            out_a_pe_1: out std_logic_vector( 6 downto 0);      ---- individual element of co-efficient matrix for calculation
            out_a_pe_2 : out std_logic_vector( 6 downto 0)     ---- individual element of co-efficient matrix for calculation
--            done : out std_logic                                ---- goes HIGH when loading is done...... will be useful when timing has to be met!!!
            
             );
end LOADER;


architecture Behavioral of LOADER is


------------    COMPONENTS -------------------


--------- ROM for COEFFICIENT MATRIX --------
component COEF_ROM IS
   PORT (
  clka : IN STD_LOGIC;
  ena : IN STD_LOGIC;
  addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  douta : OUT STD_LOGIC_VECTOR(19 DOWNTO 0)
);
END component;

--------------------------------------------

--------------------SIGNALS ----------------------------
--- Input Matrix signal
--signal x_mat_buffer : std_logic_vector(255 downto 0);       -- will be used to store 32 elements of input Matrix
signal x_mat_buffer : out_port;
signal x_pe_1, x_pe_1_reg: std_logic_vector(7 downto 0);
signal x_pe_2, x_pe_2_reg : std_logic_vector(7 downto 0);

--- ROM coefficients signal ----
signal dataROM : std_logic_vector(19 downto 0);
signal a_pe_1, a_pe_1_reg : std_logic_vector(6 downto 0);
signal a_pe_2, a_pe_2_reg : std_logic_vector(6 downto 0);
signal address, address_next : unsigned( 6 downto 0);

---- counters ---
signal elem_counter : unsigned(3 downto 0) ; ---- appended col & row 
 

begin


COEFF_ROM :COEF_ROM
    port map( 
              clka => clk,
              ena => enable,
              addra => std_logic_vector(address),
              douta => dataROM          
            );



elem_counter <= col_count & row_count;

----- Samples Input matrix 
data_sampling: process(clk, reset, in_mat_elem, x_pe_1_reg, x_pe_2_reg, a_pe_1_reg, a_pe_2_reg)         
begin
    if reset = '1' then
        x_mat_buffer <= (others => (others => '0'));
        out_a_pe_1 <= (others => '0');
        out_a_pe_2 <=(others => '0');
        else
             if rising_edge(clk) then
        x_mat_buffer <= in_mat_elem;
        out_x_pe_1 <=x_pe_1_reg;
        out_x_pe_2 <=x_pe_2_reg;

        end if;
        out_a_pe_1 <= a_pe_1_reg;
        out_a_pe_2 <=a_pe_2_reg;
        end if;
end process;
-----------------------------------------------------------------
-------- Needs to be integrated with ROM behavioral Model -----------
----------- Using Xilinx IP generator in the absence of ROM beh. model

ROM_Read : process( clk, address, enable )
    begin
    if rising_edge(clk) then
        if enable = '1' then    
        a_pe_1 <= dataROM(6 downto 0);
        a_pe_2 <= dataROM( 19 downto 13);       -- 12 downto 7 --- Used as Padding between two ROM co-eff. elements
    end if;
   
  end if;     
    end process;
    
    ----------------------------- THIS IS SO DUMB! ------------------------------
    ---------------- CALCULATING INDIVIDUAL ELEMENTS AT A TIME-------------------
    -----------------------------------------------------------------------------
    ---- Assuming all ROM coefficients have been stored in 
    ------- Needs to be cleared ------
element_selection: process( elem_counter, SWITCH,a_pe_1,a_pe_2, x_mat_buffer  )
begin

----------------- Switches position of coeff elements!!   
  
        case elem_counter is        -- (ROW, COL)
    
    
           when "0000" =>              -- (1,1)
                 case SWITCH is
                 
                    when "00" =>
                    address <= "0000000";        -- gets a11 , a21
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(0);
                    x_pe_2_reg <= x_mat_buffer(4);
                    
                    when "01" =>
                    address <= "0000001";        -- gets a31 , a41
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(8);
                    x_pe_2_reg <= x_mat_buffer(12);       
                    
                    
                    when "10" =>
                    address <= "0000010";        -- gets a51 , a61
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(16);
                    x_pe_2_reg <= x_mat_buffer(20);
                    
                    when "11" =>
                    address <= "0000011";        -- gets a11 , a21
                    a_pe_1_reg <= a_pe_1;
                    a_pe_2_reg <= a_pe_2;
                    x_pe_1_reg <= x_mat_buffer(24);
                    x_pe_2_reg <= x_mat_buffer(28);        
                    when others =>
                    NULL;
                    
                    end case;
                
         when "0001" =>                     -- (2,1)
                
                   case SWITCH is
                
                   when "00" =>
                   address <= "0000000";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(1);
                   x_pe_2_reg <= x_mat_buffer(5);
                   
                   when "01" =>
                   address <= "0000001";        -- gets a31 , a41
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(9);
                   x_pe_2_reg <= x_mat_buffer(13);       
                   
                   
                   when "10" =>
                   address <= "0000010";        -- gets a51 , a61
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(17);
                   x_pe_2_reg <= x_mat_buffer(21);
                   
                   when "11" =>
                   address <= "0000011";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(25);
                   x_pe_2_reg <= x_mat_buffer(29);        
                   when others =>
                   NULL;
                   
                   end case;
                   
                   
        when "0010" =>                      --(3,1)
                
                 case SWITCH is
                
                   when "00" =>
                   address <= "0000000";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(2);
                   x_pe_2_reg <= x_mat_buffer(6);
                   
                   when "01" =>
                   address <= "0000001";        -- gets a31 , a41
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(10);
                   x_pe_2_reg <= x_mat_buffer(14);       
                   
                   
                   when "10" =>
                   address <= "0000010";        -- gets a51 , a61
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(18);
                   x_pe_2_reg <= x_mat_buffer(22);
                   
                   when "11" =>
                   address <= "0000011";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(26);
                   x_pe_2_reg <= x_mat_buffer(30);        
                   when others =>
                   NULL;
                   
                   end case;    
                   
          when "0011" =>                        -- (4,1)
                 case SWITCH is
                
                   when "00" =>
                   address <= "0000000";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(3);
                   x_pe_2_reg <= x_mat_buffer(7);
                   
                   when "01" =>
                   address <= "0000001";        -- gets a31 , a41
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(11);
                   x_pe_2_reg <= x_mat_buffer(15);       
                   
                   
                   when "10" =>
                   address <= "0000010";        -- gets a51 , a61
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(19);
                   x_pe_2_reg <= x_mat_buffer(23);
                   
                   when "11" =>
                   address <= "0000011";        -- gets a11 , a21
                   a_pe_1_reg <= a_pe_1;
                   a_pe_2_reg <= a_pe_2;
                   x_pe_1_reg <= x_mat_buffer(27);
                   x_pe_2_reg <= x_mat_buffer(31);        
                   when others =>
                   NULL;
                   
                   end case;    
      
      
       when "0100" =>                            -- (1,2)        
        
--    address <= "0000100";       -- gets a12, a22
     
                     case SWITCH is
                     
                        when "00" =>
                        address <= "0000100";        -- gets a11 , a21
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(0);
                        x_pe_2_reg <= x_mat_buffer(4);
                        
                        when "01" =>
                        address <= "0000101";        -- gets a31 , a41
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(8);
                        x_pe_2_reg <= x_mat_buffer(12);       
                        
                        
                        when "10" =>
                        address <= "0000110";        -- gets a51 , a61
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(16);
                        x_pe_2_reg <= x_mat_buffer(20);
                        
                        when "11" =>
                        address <= "0000111";        -- gets a11 , a21
                        a_pe_1_reg <= a_pe_1;
                        a_pe_2_reg <= a_pe_2;
                        x_pe_1_reg <= x_mat_buffer(24);
                        x_pe_2_reg <= x_mat_buffer(28);        
                        when others =>
                        NULL;
                        
                        end case;
                    
          
           when "0101" =>                       -- (2,2)
                    
                      case SWITCH is
                    
                       when "00" =>
                       address <= "0000100";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(1);
                       x_pe_2_reg <= x_mat_buffer(5);
                       
                       when "01" =>
                       address <= "0000101";        -- gets a31 , a41
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(9);
                       x_pe_2_reg <= x_mat_buffer(13);       
                       
                       
                       when "10" =>
                       address <= "0000110";        -- gets a51 , a61
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(17);
                       x_pe_2_reg <= x_mat_buffer(21);
                       
                       when "11" =>
                       address <= "0000111";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(25);
                       x_pe_2_reg <= x_mat_buffer(29);        
                       when others =>
                       NULL;
                       
                       end case;
                       
                       
         when "0110" =>                              -- (3,2)
                    
                     case SWITCH is
                    
                       when "00" =>
                       address <= "0000100";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(2);
                       x_pe_2_reg <= x_mat_buffer(6);
                       
                       when "01" =>
                       address <= "0000101";        -- gets a31 , a41
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(10);
                       x_pe_2_reg <= x_mat_buffer(14);       
                       
                       
                       when "10" =>
                       address <= "0000110";        -- gets a51 , a61
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(18);
                       x_pe_2_reg <= x_mat_buffer(22);
                       
                       when "11" =>
                       address <= "0000111";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(26);
                       x_pe_2_reg <= x_mat_buffer(30);        
                       when others =>
                       NULL;
                       
                       end case;    
        when "0111" =>                            -- (4,2)
                     case SWITCH is
                    
                       when "00" =>
                       address <= "0000100";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(3);
                       x_pe_2_reg <= x_mat_buffer(7);
                       
                       when "01" =>
                       address <= "0000101";        -- gets a31 , a41
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(11);
                       x_pe_2_reg <= x_mat_buffer(15);       
                       
                       
                       when "10" =>
                       address <= "0000110";        -- gets a51 , a61
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(19);
                       x_pe_2_reg <= x_mat_buffer(23);
                       
                       when "11" =>
                       address <= "0000111";        -- gets a11 , a21
                       a_pe_1_reg <= a_pe_1;
                       a_pe_2_reg <= a_pe_2;
                       x_pe_1_reg <= x_mat_buffer(27);
                       x_pe_2_reg <= x_mat_buffer(31);        
                       when others =>
                       NULL;
                       
                       end case;    
-- Column 3
    when "1000" =>                          -- (1,4)
                     case SWITCH is
   
                          when "00" =>
                          address <= "0001000";        -- gets a11 , a21
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(3);
                          x_pe_2_reg <= x_mat_buffer(7);
                          
                          when "01" =>
                          address <= "0001001";        -- gets a31 , a41
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(11);
                          x_pe_2_reg <= x_mat_buffer(15);       
                          
                          
                          when "10" =>
                          address <= "0001010";        -- gets a51 , a61
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(19);
                          x_pe_2_reg <= x_mat_buffer(23);
                          
                          when "11" =>
                          address <= "0001011";        -- gets a11 , a21
                          a_pe_1_reg <= a_pe_1;
                          a_pe_2_reg <= a_pe_2;
                          x_pe_1_reg <= x_mat_buffer(27);
                          x_pe_2_reg <= x_mat_buffer(31);        
                          when others =>
                          NULL;
                          
                          end case;
    
    when "1001" =>                           -- (2,4)
                     case SWITCH is
      
                             when "00" =>
                             address <= "0001000";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001001";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001010";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001011";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    
    when "1010" =>                           -- (3,4)
                         case SWITCH is
      
                             when "00" =>
                             address <= "0001000";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001001";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001010";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001011";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1011" =>                          --(3,4)
                        case SWITCH is
      
                             when "00" =>
                             address <= "0001000";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001001";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001010";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001011";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1100" =>              --(4,4)
                        case SWITCH is
      
                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1101" =>
                         case SWITCH is

                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    
    when "1110" =>
                          case SWITCH is

                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when "1111" =>
                           case SWITCH is

                             when "00" =>
                             address <= "0001100";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(3);
                             x_pe_2_reg <= x_mat_buffer(7);
                             
                             when "01" =>
                             address <= "0001101";        -- gets a31 , a41
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(11);
                             x_pe_2_reg <= x_mat_buffer(15);       
                             
                             
                             when "10" =>
                             address <= "0001110";        -- gets a51 , a61
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(19);
                             x_pe_2_reg <= x_mat_buffer(23);
                             
                             when "11" =>
                             address <= "0001111";        -- gets a11 , a21
                             a_pe_1_reg <= a_pe_1;
                             a_pe_2_reg <= a_pe_2;
                             x_pe_1_reg <= x_mat_buffer(27);
                             x_pe_2_reg <= x_mat_buffer(31);        
                             when others =>
                             NULL;
                             
                             end case;
    when others =>
    NULL;
    end case;
end process;

  



end Behavioral;
