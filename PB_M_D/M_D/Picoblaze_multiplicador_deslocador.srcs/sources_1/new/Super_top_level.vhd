----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2019 17:12:31
-- Design Name: 
-- Module Name: Super_top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Super_top_level is
  Port ( clk    : in std_logic;
         reset  : in std_logic;
         led    : out std_logic_vector (15 downto 0);
         an     : out std_logic_vector (3 downto 0);
         sw     : in std_logic_vector (15 downto 0);
         seg    : out std_logic_vector (6 downto 0)
         );
end Super_top_level;

architecture Behavioral of Super_top_level is

component Top_deslocador
port (
  clk : in  std_logic;
  sw  : in  std_logic_vector (15 downto 0);
  led : out std_logic_vector (15 downto 0)
);
end component Top_deslocador;

component Top_multiplicador
port (
  clk : in  std_logic;
  sw  : in  std_logic_vector (15 downto 0);
  hex : out std_logic_vector (11 downto 0)
);
end component Top_multiplicador;

component hex2bcd
port (
  hex_in  : in  std_logic_vector (11 downto 0);
  bcd_tho : out std_logic_vector (3 downto 0);
  bcd_hun : out std_logic_vector (3 downto 0);
  bcd_ten : out std_logic_vector (3 downto 0);
  bcd_uni : out std_logic_vector (3 downto 0)
);
end component hex2bcd;

component display
port (
  clk     : in  std_logic;
  an      : out std_logic_vector (3 downto 0);
  bcd_tho : in  std_logic_vector (3 downto 0);
  bcd_hun : in  std_logic_vector (3 downto 0);
  bcd_ten : in  std_logic_vector (3 downto 0);
  bcd_uni : in  std_logic_vector (3 downto 0);
  seg_out : out std_logic_vector (6 downto 0)
);
end component display;

component Divisor_de_clock
port (
  clk       : in  STD_LOGIC;
  reset     : in  STD_LOGIC;
  clk_anodo : out std_logic;
  clk_led   : out std_logic
);
end component Divisor_de_clock;

signal clk_anodo : std_logic;
signal clk_led   : std_logic;
signal hex_in    : std_logic_vector (11 downto 0);
signal bcd_tho   : std_logic_vector (3 downto 0) := (others => '0');
signal bcd_hun   : std_logic_vector (3 downto 0) := (others => '0');
signal bcd_ten   : std_logic_vector (3 downto 0);
signal bcd_uni   : std_logic_vector (3 downto 0);

begin

Top_deslocador_i : Top_deslocador
port map (
  clk => clk_led,
  sw  => sw,
  led => led
);

Top_multiplicador_i : Top_multiplicador
port map (
  clk => clk,
  sw  => sw,
  hex => hex_in
);

hex2bcd_i : hex2bcd
port map (
  hex_in  => hex_in,
  bcd_tho => bcd_tho,
  bcd_hun => bcd_hun,
  bcd_ten => bcd_ten,
  bcd_uni => bcd_uni
);

display_i : display
port map (
  clk     => clk_anodo,
  an      => an,
  bcd_tho => bcd_tho,
  bcd_hun => bcd_hun,
  bcd_ten => bcd_ten,
  bcd_uni => bcd_uni,
  seg_out => seg
);

Divisor_de_clock_i : Divisor_de_clock
port map (
  clk       => clk,
  reset     => reset,
  clk_anodo => clk_anodo,
  clk_led   => clk_led
);

end Behavioral;
