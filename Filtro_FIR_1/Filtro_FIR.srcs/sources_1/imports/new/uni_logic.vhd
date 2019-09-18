library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uni_logic is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           x : out STD_LOGIC_VECTOR (7 downto 0));
end uni_logic;

architecture Behavioral of uni_logic is

begin
    with sel select
        x<= not a when "000",
            not b when "001",
            a and b when "010",
            a or b when "011",
            a nand b when "100",
            a nor b when "101",
            a xor b when "110",
            not (a xor b) when others;

end Behavioral;
