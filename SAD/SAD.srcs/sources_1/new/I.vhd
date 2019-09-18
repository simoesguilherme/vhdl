library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity I is
   Port (  load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clear: in Std_Logic;
           i_out : out  STD_LOGIC_VECTOR (8 downto 0));
end I;

architecture Behavioral of I is

    signal cont : STD_LOGIC_VECTOR(8 downto 0);
    
begin

process(clk, clear)
	begin
		if rising_edge(clk) then
			if clear = '1' then
				cont <= (others => '0');
			elsif load = '1' then
				 cont <= cont + 1;
			end if;
		end if;
	end process;

    i_out <= cont;
    
end Behavioral;
