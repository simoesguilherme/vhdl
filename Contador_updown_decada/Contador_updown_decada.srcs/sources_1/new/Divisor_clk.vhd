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

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Divisor_clk is
Port (clk: in std_logic;
      reset: in std_logic; -- button C
      f_select: in std_logic; -- switch 13
      clk_out: out std_logic
      );
end Divisor_clk;

architecture Behavioral of Divisor_clk is

signal counter: integer:=0;
signal temp: std_logic:='1';
    
begin 

process (clk, reset, f_select)
begin
-- 50MHz para 4Hz - 50.000.000 / 4 = 12.500.000 / 2 = 6.250.000
-- 50MHz para 1Hz - 50.000.000 / 1 = 50.000.000 / 2 = 25.000.000
if reset = '1' then
  counter <= 0;
  temp <= '1';
-- se f_select = 1, clk = 4Hz
elsif f_select = '1' then
   if rising_edge(clk) then
      if counter = 6249999 then
         temp <= not temp;
         counter <= 0;
      else 
         counter <= counter + 1;
      end if;
   end if;
-- se f_select = 0, clk = 1Hz
elsif f_select = '0' then
   if rising_edge(clk) then
      if counter = 6249999 then
         temp <= not temp;
         counter <= 0;
      else      
         counter <= counter + 1;
      end if;
   end if;
end if;
end process;

clk_out <= temp;
    
end Behavioral;