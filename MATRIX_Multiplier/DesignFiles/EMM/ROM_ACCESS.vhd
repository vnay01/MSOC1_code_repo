library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity ROM_ACCESS is
 Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;                      -- used here because ST_ROMHS_128x20m16_L has enable pin ( CSN )
        address: in std_logic_vector( 6 downto 0 );
        dataROM : out std_logic_vector( 19 downto 0 )    
        );
end ROM_ACCESS;

architecture Behavioral of ROM_ACCESS is

signal read_data: std_logic_vector( 19 downto 0); 
signal read_delay_2:std_logic_vector( 19 downto 0);
begin

ROM_Read : process( clk, reset, enable, read_data )
    begin
        if reset = '1' then
        dataROM <= ( others => '0');
        read_delay_2 <= ( others => '0');

    elsif rising_edge(clk) then
        if enable = '1' then 
        read_delay_2 <= read_data;          -- assignment at next rising clock
        dataROM <= read_delay_2;            -- Total delayed by 2 clock cycles    
        else
        read_delay_2 <= (others =>'0');
        dataROM <= (others =>'0');
    end if;

  end if;     
    end process;

process( address )
	begin
	
	case address is
	
	when "0000000" =>
	read_data <= "00000110000000010110";
	when "0000001" =>
	read_data <= "00010110000000000001"; 
	when "0000010" =>
	read_data <= "00010000000000000011"; 
	when "0000011" =>
	read_data <= "00000010000000000010"; 
	when "0000100" =>
	read_data <= "00010000000000001111";
	when "0000101" =>
	read_data <= "00000100000000000100";
	when "0000110" =>
	read_data <= "00011000000000000110";
	when "0000111" =>
	read_data <="00000010000000000010"; 
	when "0001000" =>
	read_data <="00100100000000101000";
	when "0001001" =>
	read_data <="00000110000000000010"; 
	when "0001010" =>
	read_data <= "00100000000000001001";
	when "0001011" =>
	read_data <= "00000010000000000010"; 
	when "0001100" =>
	read_data <= "00000010000000001010";
	when "0001101" =>
	read_data <="00001000000000000000"; 
	when "0001110" =>
	read_data <= "00000100000000001100";
	when "0001111" =>
	read_data <="00000010000000000010"; 
	when "0010000" =>          
	read_data <= "00000110000000010110";
	when "0010001" =>
	read_data <= "00000010000000000010";
	when "0010010" =>          
	read_data <= "00001000000000000000";
	when "0010011" =>
	read_data <= "00011000000000000110";
	when "0010100" =>
	read_data <="00000010000000000010"; 
	when "0010101" =>          
	read_data <= "00000010000000001010";
	when "0010110" =>
	read_data <= "00000100000000001100";
	when "0010111" =>          
	read_data <= "00000110000000010110";
    when others=>
	read_data <= (others => '0');
end case;

end process;


end Behavioral;
