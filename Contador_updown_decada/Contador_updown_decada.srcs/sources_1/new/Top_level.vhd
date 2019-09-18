----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.04.2019 10:24:29
-- Design Name: 
-- Module Name: Top_level - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_level is
Port (clk       :       in std_logic;
      reset     :       in std_logic; -- button C
      entrada_u :       in std_logic_vector(3 downto 0); -- swotches de 3 a 7
      entrada_d :       in std_logic_vector(3 downto 0); -- swotches de 0 a 3
      preset    :       in std_logic; -- button D
      pause     :       in std_logic; -- switch 15
      updown    :       in std_logic; -- switch 14
      f_select  :       in std_logic; -- switch 13
      clk_out   :       out std_logic;
      saida_u   :       out std_logic_vector(3 downto 0); -- 7 seg display
      saida_d   :       out std_logic_vector(3 downto 0)); -- 7 seg display
end Top_level;

architecture Behavioral of Top_level is

component Divisor_clk
Port (clk       :       in std_logic;
      reset     :       in std_logic;
      f_select  :       in std_logic;
      clk_out   :       out std_logic
      );
end component;

component contador
port(clk       :       in std_logic;                                         
     reset     :       in std_logic; -- button C                             
     entrada_u :       in std_logic_vector(3 downto 0); -- swotches de 3 a 7 
     entrada_d :       in std_logic_vector(3 downto 0); -- swotches de 0 a 3 
     preset    :       in std_logic; -- button D                             
     pause     :       in std_logic; -- switch 15                            
     updown    :       in std_logic; -- switch 14                            
     saida_u   :       out std_logic_vector(3 downto 0); -- 7 seg display    
     saida_d   :       out std_logic_vector(3 downto 0) -- 7 seg display     
     );
end component;

component 7_seg
Port ( reset     :       in std_logic;
       clk       :       in std_logic;
       an        :       out STD_LOGIC_VECTOR (3 downto 0);signal clk_in : std_logic;
       seg       :       out STD_LOGIC_VECTOR (6 downto 0));
end component;
       
begin

utt1: Divisor_clk port map (
      clk_out => clk_out,
      clk => clk,
      reset => reset,
      f_select => f_select
      );
      
utt2: Contador port map (
     clk       => clk      ,
     reset     => reset    ,
     entrada_u => entrada_u,
     entrada_d => entrada_d,
     preset    => preset   ,
     pause     => pause    ,
     updown    => updown   ,
     saida_u   => saida_u  ,
     saida_d   => saida_d 
     );

utt3: 7_seg port map (
    reset => reset ,
    clk   => clk   ,
    an    => an    ,
    seg   => seg   
    );

end Behavioral;
