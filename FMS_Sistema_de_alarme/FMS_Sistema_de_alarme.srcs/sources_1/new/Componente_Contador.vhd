library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador is
  Port ( clk      : in STD_LOGIC;
         clk_1Hz  : in STD_LOGIC;
         flag     : in STD_LOGIC;
         reset    : in STD_LOGIC;
         flag_cont: out std_logic;
         led      : out STD_LOGIC;
         unidade  : out STD_LOGIC_VECTOR (3 downto 0);
         dezena   : out STD_LOGIC_VECTOR (3 downto 0)
         );
end Contador;

architecture Behavioral of Contador is

signal led_count : std_logic := '0';
signal count_u : std_logic_vector (3 downto 0);
signal count_d : std_logic_vector (3 downto 0);

begin

process (flag, clk_1Hz)
begin
if flag = '1' then
   if rising_edge(clk_1Hz) then
      if count_d = "0010" then -- 2
--         count_u <= "0000";
--         count_d <= "0000";
         flag_cont <= '1';
         led_count <= '0';
      else
         if count_u = "1001" then
            count_u <= "0000";
            count_d <= count_d + '1';
            led_count <= not led_count;
         else
            count_u <= count_u + '1'; -- contagem normal
            led_count <= not led_count;
         end if;
      end if;
   end if;
else
    led_count <= '0';
    flag_cont <= '0';
    count_u <= "0000";
    count_d <= "0000";
end if;
end process;

unidade <= count_u;
dezena  <= count_d;
led <= led_count;

end Behavioral;
