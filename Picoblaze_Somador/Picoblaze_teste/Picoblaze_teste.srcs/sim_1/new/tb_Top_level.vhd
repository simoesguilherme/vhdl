library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top_level is
end tb_top_level;

architecture Behavioral of tb_top_level is

    component top_level is
        Port ( clk      : in STD_LOGIC;
               Switches : in STD_LOGIC_VECTOR (7 downto 0);
               led      : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

          signal clk      :  STD_LOGIC;
          signal Switches : STD_LOGIC_VECTOR (7 downto 0);
          signal led      : STD_LOGIC_VECTOR (7 downto 0);

begin

utt: Top_level port map ( clk => clk,
         switches => switches,
         led => led);

CLK_process : process
    begin
        clk<='0';
        wait for 5 ns;
        clk<='1';
        wait for 5 ns;
    end process;
    
estimulos: process
    begin
        switches <="01011010";
        wait for 10 ns;
        switches <= "01011010";
    end process;          

end Behavioral;