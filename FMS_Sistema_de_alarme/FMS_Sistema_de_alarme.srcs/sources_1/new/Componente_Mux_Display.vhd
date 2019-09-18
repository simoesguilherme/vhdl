library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Mux_Display is
  Port ( clk      : in STD_LOGIC;
         reset    : in STD_LOGIC;
         disp1    : in std_logic_vector(3 downto 0);
         disp2    : in std_logic_vector(3 downto 0);
         disp4    : in std_logic_vector(3 downto 0);
         seg      : out STD_LOGIC_VECTOR (6 DOWNTO 0);
         an       : out STD_LOGIC_VECTOR (3 DOWNTO 0)
         );
end Mux_Display;

architecture Behavioral of Mux_Display is

  signal disp3           : std_logic_vector(3 downto 0) := "1111";
  signal sel_mux      :    std_logic_vector(1 downto 0):="00";
  signal out_mux      :    std_logic_vector(3 downto 0):="0000";
  
  signal an_cnt       :    std_logic_vector(18 downto 0) := (others=>'0');
  signal enable       :    std_logic := '0';


begin

  -- contador de 300 Hz para multiplexar anodos e selecionar mux ------------------------------------------------------------------------------
  process(clk,reset)
  variable anodo_var : bit_vector(3 downto 0) := "1110";
  begin
      if reset='1' then
          an_cnt <= (others=>'0');
          anodo_var := "1110";
          sel_mux <= "00";
      elsif rising_edge(clk) then
          if an_cnt = "1010001011000010101" then
              anodo_var := anodo_var rol 1; -- desloca anodos
              sel_mux <= sel_mux + '1';-- mudar sel_mux
              an_cnt <= (others=>'0');
          else
              an_cnt <= an_cnt + '1';
          end if;
          an <= to_stdlogicvector(anodo_var);
      end if;
  end process;
  
  -- multiplexador 4 para 1 -------------------------------------------------------------------------------------------------------------------
  with sel_mux select
       out_mux <= disp1 when "00",
                  disp2 when "01",
                  disp3 when "10",
                  disp4 when others; 
  
  -- decodificador de binario para 7 segmentos -------------------------------------------------------------------------------------------------
  process(out_mux)
  begin
  	case out_mux is
  		when "0000" => seg <= "1000000"; -- 1
  		when "0001" => seg <= "1111001"; -- 2
  		when "0010" => seg <= "0100100"; -- 3
  		when "0011" => seg <= "0110000"; -- 4
  		when "0100" => seg <= "0011001"; -- 5
  		when "0101" => seg <= "0010010"; -- 6
  		when "0110" => seg <= "0000010"; -- 7
  		when "0111" => seg <= "1111000"; -- 8
  		when "1000" => seg <= "0000000"; -- 9
  		when "1001" => seg <= "0010000"; 
  		when "1010" => seg <= "0001000"; -- CODIGO NA FORMA DE A
  		when "1011" => seg <= "0000011";
  		when "1100" => seg <= "1000110";
  		when "1101" => seg <= "0100001";
  		when "1110" => seg <= "0000110";
  		when "1111" => seg <= "1111111"; -- troquei de lugar com o de baixo
  		when others => seg <= "0001110"; -- troquei de lugar com o de cima
  	end case;
  end process; 

end Behavioral;
