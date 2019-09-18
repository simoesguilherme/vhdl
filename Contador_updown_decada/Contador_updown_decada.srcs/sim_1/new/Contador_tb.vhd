----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2019 18:51:45
-- Design Name: 
-- Module Name: Main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador_tb is
-- port ();
end Contador_tb;

architecture Behavioral of Contador_tb is

component Contador
Port (clk       :       in std_logic;
      reset     :       in std_logic; -- button C
      entrada_u :       in std_logic_vector(3 downto 0); -- swotches de 3 a 7
      entrada_d :       in std_logic_vector(3 downto 0); -- swotches de 0 a 3
      preset    :       in std_logic; -- button D
      pause     :       in std_logic; -- switch 15
      updown    :       in std_logic; -- switch 14
      an        :       out STD_LOGIC_VECTOR (3 downto 0);
      seg       :       out STD_LOGIC_VECTOR (6 downto 0));
      saida_u   :       out std_logic_vector(3 downto 0); -- 7 seg display
      saida_d   :       out std_logic_vector(3 downto 0) -- 7 seg display
      );
end component;

signal clk       : std_logic:='0';
signal reset     : std_logic:='0';
signal entrada_u : std_logic_vector(3 downto 0):= (others=>'0');
signal entrada_d : std_logic_vector(3 downto 0):= (others=>'0');
signal preset    : std_logic:='0';
signal pause     : std_logic:='0';
signal updown    : std_logic:='1';
signal saida_u   : std_logic_vector(3 downto 0):= (others=>'0');
signal saida_d   : std_logic_vector(3 downto 0):= (others=>'0');

begin

utt: Contador port map (
     clk => clk,
     reset => reset,
     entrada_u => entrada_u,
     entrada_d => entrada_d,
     preset => preset,
     pause => pause,
     updown => updown,
     saida_u => saida_u,
     saida_d => saida_d
     );
     
clk <= not clk after 5 ns;

preset <= '0', '1' after 5 ns, '0' after 15 ns, '1' after 335 ns, '0' after 345 ns;

entrada_u <= "0100", "0011" after 335 ns;

entrada_d <= "0110", "0011" after 335 ns;

pause <= '0', '1' after 325 ns, '0' after 335 ns, '1' after 655 ns;

updown <= '1', '0' after 335 ns; 

end Behavioral;
