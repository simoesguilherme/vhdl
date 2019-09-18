library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparador is
  Port ( A : in std_logic_vector(8 downto 0);
         menor: out std_logic );
end comparador;

architecture Behavioral of comparador is

begin

   menor <= '1' when (A < "100000000")else '0';  

end Behavioral;
