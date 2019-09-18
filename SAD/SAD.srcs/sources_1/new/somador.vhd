library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity somador is
     Port ( X : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
            S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) );
end somador;

architecture Behavioral of somador is

begin

    S <= X + Y;
         
end Behavioral;
