----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2018 10:45:34
-- Design Name: 
-- Module Name: t_registrador - Behavioral
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

entity t_registrador is
--  Port ( );
end t_registrador;

architecture Behavioral of t_registrador is
    component registrador
        Port ( clk : in std_logic;
             x : in std_logic_vector(7 downto 0);
             y : out std_logic_vector(7 downto 0);
             enable : in std_logic );
    end component;
    
    signal s_clk    : std_logic;
    signal s_x      : std_logic_vector(7 downto 0);
    signal s_y      : std_logic_vector(7 downto 0);
    signal s_enable : std_logic );
    
begin
    uut: registrador port map(s_clk, s_x, s_y, s_enable);
    
    

end Behavioral;
