library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Piscador is
  Port ( clk_1Hz   : in STD_LOGIC;
         reset     : in STD_LOGIC;
         policia   : in STD_LOGIC;
         led       : out STD_LOGIC_VECTOR (13 downto 0)
         );
end Piscador;

architecture Behavioral of Piscador is

signal led_dispara : std_logic_vector (13 downto 0) := "00000000000000";

begin

process (clk_1Hz, policia)
begin
if policia = '1' then
   if rising_edge(clk_1Hz) then
      led_dispara <= not led_dispara;
   end if;
else
   led_dispara <= "00000000000000";
end if;
end process;

led <= led_dispara;

end Behavioral;
