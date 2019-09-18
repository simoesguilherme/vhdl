library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uni_arit is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           x : out STD_LOGIC_VECTOR (7 downto 0));
end uni_arit;

architecture Behavioral of uni_arit is
    
begin
    with sel select
        x<= a+b when "000",
            a+1 when "001",
            a-1 when "010",
            b when "011",
            b+1 when "100",
            b-1 when "101",
            a+1 when "110",
            a(3 downto 0)*b(3 downto 0) when others;


end Behavioral;
