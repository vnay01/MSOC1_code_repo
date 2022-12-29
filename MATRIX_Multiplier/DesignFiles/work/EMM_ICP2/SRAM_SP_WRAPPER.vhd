library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



-- -- ST_SPHDL_640x32_mem2011
--words = 640
--bits  = 32

entity SRAM_SP_WRAPPER is
  port (
    ClkxCI  : in  std_logic;
    CSxSI   : in  std_logic;            -- Active Low       -- Use address to select each bank
    WExSI   : in  std_logic;            --Active HIGH for Xilinx Block RAM
    AddrxDI : in  std_logic_vector (9 downto 0);
    RYxSO   : out std_logic;
    DataxDI : in  std_logic_vector (16 downto 0);
    DataxDO : out std_logic_vector (16 downto 0)
    );
end SRAM_SP_WRAPPER;


architecture rtl of SRAM_SP_WRAPPER is

-- XILINX Block RAM
component BRAM_1024x16 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
  );
END component;

signal LOW  : std_logic;
signal HIGH : std_logic;
signal w_RY : std_logic_vector(1 downto 0);
--signal w_RY : std_logic;
signal CS : std_logic;
signal w_wea : std_logic_vector(0 downto 0);

begin

  LOW  <= '0';
  HIGH <= '1';


--  Used with Xilinx Block RAM
RYxSO <= '0';       
w_wea(0) <= WExSI;
CS <= (CSxSI);


  DUT_ST_SPHDL_640x32m16_L_1 : BRAM_1024x16
  PORT map (
  clka => ClkxCI,
  ena => CS,
  wea => w_wea,
  addra => AddrxDI,
  dina => DataxDI,
  douta => DataxDO
);


end rtl;

