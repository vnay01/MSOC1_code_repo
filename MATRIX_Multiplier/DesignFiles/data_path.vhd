library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity data_path is
 Port ( 
        clk : in std_logic;
        reset : in std_logic;
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector( 6 downto 0);
        ctrl : in std_logic_vector( 5 downto 0);                        -- This has to be mapped to controllers datapath_ctrl which is 8 bits wide
        done : out std_logic_vector(5 downto 0);
        out_Prod: out std_logic_vector( 16 downto 0)                -- will change it later
            );
end data_path;

architecture Behavioral of data_path is
-- signals to store intermediate calculations
signal mul_odd, mul_even : std_logic_vector( 14 downto 0);
signal mul_odd_next, mul_even_next :  std_logic_vector( 14 downto 0);
signal sum_odd_1, sum_even_1 : std_logic_vector( 15 downto 0);
signal sum_odd_1_next, sum_even_1_next : std_logic_vector( 15 downto 0);
signal prod_elem : std_logic_vector( 16 downto 0);
signal prod_elem_next : std_logic_vector( 16 downto 0);

-- Other signals
signal ctrl_next : std_logic_vector( 6 downto 0);
signal out_prod_next : std_logic_vector( 16 downto 0);
signal done_next : std_logic_vector(5 downto 0);


begin

process(clk, reset, out_prod_next, ctrl_next)
    begin   
    if rising_edge(clk) then
    if reset = '1' then
        done <= (others =>'0');
        mul_odd <= ( others => '0');
        mul_even <= ( others => '0');
        sum_odd_1 <= ( others => '0');
        sum_even_1 <= ( others =>'0');
        out_Prod <= ( others => '0');
        else
        done <= done_next ;
        mul_odd <= mul_odd_next;
        mul_even <= mul_even_next;
        sum_odd_1 <=sum_odd_1_next;
        sum_even_1 <= sum_even_1_next;   
        out_Prod <= out_prod_next ;
        end if;
     end if;
    end process;

ALU:process( ctrl, in_X_odd, in_X_even, in_A_odd, in_A_even)
    begin
    done_next <= ( others => '0');
    case ctrl is 
        
        when "000001" =>       -- READ
        mul_odd_next <= (others => '0');
        mul_even_next <= (others => '0');
        sum_odd_1_next <= (others => '0');
        sum_even_1_next<= (others => '0');
        out_prod_next <= (others => '0');
        done_next <= "000001";       
        
        when "000010" =>       -- IDLE
        mul_odd_next <= (others => '0');
        mul_even_next <= (others => '0');
        sum_odd_1_next <= (others => '0');
        sum_even_1_next<= (others => '0');
        out_prod_next <= (others => '0');
        done_next <= "000010";
                
        
        when "000100" =>   -- Multiply                 8
        mul_odd_next <= std_logic_vector(unsigned(in_X_odd) * unsigned(in_A_odd));
        mul_even_next <= std_logic_vector(unsigned(in_X_even) * unsigned(in_A_even));
        sum_odd_1_next <= sum_odd_1;
        sum_even_1_next<= sum_even_1;
        out_prod_next <= (others => '0');
        done_next <= "000100";
        
        when "001000" =>       -- ADD      16
        mul_odd_next <= ( others =>'0');
        mul_even_next <= ( others =>'0');
        sum_odd_1_next <= std_logic_vector(unsigned( mul_odd) + unsigned(sum_odd_1));
        sum_even_1_next<= std_logic_vector(unsigned( mul_even) + unsigned(sum_even_1));
        out_prod_next <= (others => '0');     
        done_next <= "001000";
        
        when "010000" =>       -- ADD _Stage_2   32
        mul_odd_next <= ( others =>'0');
        mul_even_next <= ( others =>'0');
        sum_odd_1_next <= sum_odd_1; 
        sum_even_1_next<= sum_even_1; 
        out_prod_next <= "0" & std_logic_vector(unsigned(sum_odd_1) + unsigned(sum_even_1)); 
        done_next <= "010000";
        
        when "100000" =>            -- RAM STORE -- This needs to be modelled as 32 bit output
        mul_odd_next <= ( others =>'0');
        mul_even_next <= ( others =>'0');
        sum_odd_1_next <= sum_odd_1; 
        sum_even_1_next<= sum_even_1; 
        out_prod_next <= "0" & std_logic_vector(unsigned(sum_odd_1) + unsigned(sum_even_1)); 
        done_next <= "100000";        
--        when "1000000" =>
--         mul_odd_next <= ( others =>'0');
--        mul_even_next <= ( others =>'0');
--        sum_odd_1_next <=(others => '0'); 
--        sum_even_1_next<= (others => '0'); 
--        out_prod_next <= (others => '0');        
        when others =>
        mul_odd_next <= ( others =>'0');
        mul_even_next <= ( others =>'0');
        sum_odd_1_next <= sum_odd_1; 
        sum_even_1_next<= sum_even_1; 
        out_prod_next <= (others => '0'); 
        
        end case;

    end process;
end Behavioral;
