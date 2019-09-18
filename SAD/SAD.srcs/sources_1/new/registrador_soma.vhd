library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registrador_soma is
          Port (  clear : in  STD_LOGIC;
                 load : in  STD_LOGIC;
                 clk : in  STD_LOGIC;
                 I : in  STD_LOGIC_VECTOR (15 downto 0);
                 Q : out  STD_LOGIC_VECTOR (15 downto 0));
                 
end registrador_soma;

architecture Behavioral of registrador_soma is

begin

process(clk, clear)
	begin
		if rising_edge(clk) then
			if clear = '1' then
				Q <= (others => '0');
			elsif load = '1' then
				 Q <= I;
			end if;
		end if;
	end process;

end Behavioral;
