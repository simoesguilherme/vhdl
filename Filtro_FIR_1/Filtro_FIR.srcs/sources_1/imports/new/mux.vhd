library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC;
           x : out STD_LOGIC_VECTOR (7 downto 0));
end mux;

architecture Behavioral of mux is

begin
    with sel select
        x<= a when '0',
            b when others;

end Behavioral;
