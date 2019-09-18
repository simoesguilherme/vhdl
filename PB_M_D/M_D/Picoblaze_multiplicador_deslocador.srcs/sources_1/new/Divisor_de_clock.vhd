library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Divisor_de_clock is
  Port ( clk      : in STD_LOGIC;
         reset    : in STD_LOGIC;
         clk_anodo : out std_logic;
         clk_led  : out std_logic
         );
end Divisor_de_clock;

architecture Behavioral of Divisor_de_clock is

  signal counter  : integer:=0;
  signal temp     : std_logic:='1';

  signal counter2  : integer:=0;
  signal temp2     : std_logic:='1';

begin

process (clk, reset)
begin
-- 50MHz para 1Hz - 50.000.000 / 1 = 50.000.000 / 2 = 25.000.000
if reset = '1' then
   counter <= 0;
   temp <= '1';

elsif rising_edge(clk) then
   if counter = 41666 then
      temp <= not temp;
      counter <= 0;
   else
      counter <= counter + 1;
   end if;
end if;
end process;

process (clk, reset)
begin
-- 50MHz para 1Hz - 50.000.000 / 1 = 50.000.000 / 2 = 25.000.000
if reset = '1' then
   counter2 <= 0;
   temp2 <= '1';
elsif rising_edge(clk) then
   if counter2 = 1999999 then
      temp2 <= not temp2;
      counter2 <= 0;
   else
      counter2 <= counter2 + 1;
   end if;
end if;
end process;

clk_anodo <= temp;
clk_led <= temp2;

end Behavioral;