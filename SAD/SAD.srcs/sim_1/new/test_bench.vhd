----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2018 10:51:34
-- Design Name: 
-- Module Name: test_bench - Behavioral
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

entity test_bench is
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is

    component top_level is
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               comece : in STD_LOGIC;
               seg : out STD_LOGIC_VECTOR (6 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0);
               sad : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal s_clk, s_reset, s_comece : STD_LOGIC := '0';
    signal s_seg : STD_LOGIC_VECTOR(6 downto 0);
    signal s_an : STD_LOGIC_VECTOR(3 downto 0);
    signal s_sad : STD_LOGIC_VECTOR(15 downto 0);
    
begin

    UUT: top_level port map( clk => s_clk,
                             reset => s_reset,
                             comece => s_comece,
                             seg => s_seg,
                             an => s_an,
                             sad => s_sad);
    
    clock: process
    begin
        s_clk <= not(s_clk);
        wait for 5 ns;
        s_clk <= not(s_clk);
        wait for 5 ns;
    end process;
    
    stimulus: process
    begin
        s_reset <= '1';
        s_comece <= '0';
        wait for 10 ns;
        s_reset <= '0';
        s_comece <= '1';
        wait for 10 ns;
        s_comece <= '0';
        wait;
    end process;

end Behavioral;
