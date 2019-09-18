library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x4 is
  Port (sel : in std_logic_vector(1 downto 0);
        cl : in std_logic;
        a : out std_logic;
        b : out std_logic;
        c : out std_logic;
        d : out std_logic );
end mux2x4;

architecture Behavioral of mux2x4 is

begin
        a <= cl when sel = "00" else '0';
        b <= cl when sel = "01" else '0';
        c <= cl when sel = "10" else '0';
        d <= cl when sel = "11" else '0';

end Behavioral;
