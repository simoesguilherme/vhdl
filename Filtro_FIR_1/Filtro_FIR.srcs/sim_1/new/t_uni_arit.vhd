----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2018 11:25:01
-- Design Name: 
-- Module Name: t_uni_arit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity t_uni_arit is
--  Port ( );
end t_uni_arit;

architecture Behavioral of t_uni_arit is
    component uni_arit
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               x : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal s_a,s_b : std_logic_vector(3 downto 0);
    signal s_x : std_logic_vector (7 downto 0);
begin
    uut: uni_arit port map(s_a, s_b, s_x);

    stimulus: process
    begin
        s_a<= "0010"; s_b<= "0010";
        wait for 10 ns;
        s_a<= "1000"; s_b<= "1000";
        wait for 10 ns;
    end process;

end Behavioral;
