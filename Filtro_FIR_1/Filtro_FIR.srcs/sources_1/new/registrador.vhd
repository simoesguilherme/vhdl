library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registrador is
  Port ( clk : in std_logic;
         x : in std_logic_vector(7 downto 0);
         y : out std_logic_vector(7 downto 0);
         enable : in std_logic );
end registrador;

architecture Behavioral of registrador is

begin
    process(clk, enable)
    begin
        if rising_edge(clk) and enable = '1' then
            y<=x;
        end if;
    end process;

end Behavioral;
