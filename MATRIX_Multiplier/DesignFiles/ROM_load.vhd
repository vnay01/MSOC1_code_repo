library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity ROM_load is
  Port ( 
            clk: std_logic;
            reset : std_logic;
            enable : std_logic;         -- comes from  Controller
            column_seg : in std_logic_vector(1 downto 0);     -- comes from controller, selects the column of coefficient matrix
            load_done : out std_logic;                          -- goes to controller
            coef_out : out std_logic_vector(13 downto 0)       -- coefficient matrix element  -- represents two elements 
            
            );
end ROM_load;

architecture Behavioral of ROM_load is

-- Components
component coeff_ROM IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
  );
END component;



signal elem_count, elem_count_next : unsigned(1 downto 0);
signal column_sel,column_sel_next : unsigned(1 downto 0);
signal data_out, data_out_next : std_logic_vector( 13 downto 0);
signal addr_in : std_logic_vector( 3 downto 0);

type state is (idle, read);

signal current_state, next_state : state;



begin


coeff: coeff_ROM
port map(
            clka => clk,
            ena => enable,
            addra => addr_in,
            douta => data_out
        );
        
        
-- State registers
addr_in <= std_logic_vector(column_sel & elem_count) ;

process(clk, reset)
begin
    if reset = '1' then
    current_state <= idle;
    column_sel <= (others => '0');
    elem_count <= (others =>'0');
    coef_out <= ( others => '0');
    else
    if rising_edge(clk) then
    current_state <= next_state;
    column_sel <= column_sel_next + 1;
    coef_out <= data_out_next;
    elem_count <= elem_count_next;
    end if;
    end if;   
end process;

-- State change process
state_upd:process(clk, current_state, column_sel , enable, column_seg, data_out) 
    begin
      if rising_edge(clk) then
      if enable = '1' then
        next_state <= current_state;
        elem_count_next <= elem_count;
        column_sel_next <= column_sel;
        elem_count_next <= elem_count;
        data_out_next <= data_out;
        load_done <= '0';
    
    case current_state is 
        when idle =>
        next_state <= read;
        
        when read =>
        elem_count_next <= elem_count + 1;
        
--        if elem_count = 4  then
--        column_sel_next <= column_sel + 1;
--        end if;
        
        if column_sel = 4 then
        next_state <= idle;
        load_done <= '1';
        end if;
       
       when others =>
            NULL;
        
        end case;
        end if;    
        end if;
    end process;

process(column_seg)
begin
    case column_seg is
        when "00" =>
        column_sel_next <= "00" ;
        
        when "01" =>
        column_sel_next <= "01";
        when "10" =>
        column_sel_next <= "10";
        when "11" =>
        column_sel_next <= "11";
        
        when others =>
        column_sel_next <= "00";
        
        end case;
end process;

end Behavioral;
