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

entity Contador is
Port ( clk      :       in std_logic;
       reset    :       in std_logic; -- button C
       entrada_u:       in std_logic_vector(3 downto 0); -- swotches de 3 a 7
       entrada_d:       in std_logic_vector(3 downto 0); -- swotches de 0 a 3
       preset   :       in std_logic; -- button D
       pause    :       in std_logic; -- switch 15
       updown   :       in std_logic; -- switch 14
       saida_u  :       out std_logic_vector(3 downto 0); -- 7 seg display
       saida_d  :       out std_logic_vector(3 downto 0) -- 7 seg display
      );
end Contador;

architecture Behavioral of Contador is

signal count_u : std_logic_vector(3 downto 0) := "0000";
signal count_d : std_logic_vector(3 downto 0) := "0000";
    
begin

-- contador unidade
process (clk, reset)
begin
    if rising_edge(clk) then
       if reset = '1' then
          count_u <= (others=>'0');
       elsif preset = '1' then
          count_u <= entrada_u;
          count_d <= entrada_d;
       elsif pause = '0' then
          if updown = '1' then
             if count_u = "1001" then
                if count_d = "1001" then
                   count_d <= "0000";
                   count_u <= "0000";
                else
                   count_u <= "0000";
                   count_d <= count_d + '1';
                end if;
             else
                count_u <= count_u + '1'; -- contagem normal
             end if;
          elsif updown = '0' then
             if count_u = "0000" then
                if count_d = "0000" then
                   count_d <= "1001";
                   count_u <= "1001";
                else
                   count_u <= "1001";
                   count_d <= count_d - '1';
                end if;
             else
                count_u <= count_u - '1'; -- contagem regreciva
             end if;
          end if;
       end if;
    end if; 
end process;

saida_u <= count_u;
saida_d <= count_d;

end Behavioral;