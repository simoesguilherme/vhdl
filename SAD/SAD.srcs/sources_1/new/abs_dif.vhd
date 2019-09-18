library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity abs_dif is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           dif : out STD_LOGIC_VECTOR (7 downto 0));
end abs_dif;

architecture Behavioral of abs_dif is

    signal s_a, s_b, soma : integer := 0;
    
begin
    
    s_a <= conv_integer(A);
    s_b <= conv_integer(B);
    soma<= abs(s_a - s_b);
    dif <= std_logic_vector(to_unsigned(soma, 8));
   
end Behavioral;
