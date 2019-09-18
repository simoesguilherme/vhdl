library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FMS is
  Port ( clk           : in STD_LOGIC;
         clk_out       : in STD_LOGIC;
         reset         : in STD_LOGIC;
         enable        : in STD_LOGIC;
         flag_cont     : in STD_LOGIC;  
         window        : in std_logic_vector (2 downto 0);
         door          : in std_logic;       
         password      : in STD_LOGIC_VECTOR (7 downto 0);
         disp_A        : out std_logic_vector (3 downto 0);
         flag          : out std_logic;
         policia       : out std_logic
         );
end FMS;

architecture Behavioral of FMS is

type estado is (inicio, ativo, porta_A, dispara);
signal prox_estado, estado_atual : estado := inicio;

signal s_flag : std_logic := '0'; 

begin

process(clk_out, reset)
begin
  if reset='1' then
     estado_atual <= inicio;
  elsif rising_edge(clk_out) then
     estado_atual <= prox_estado;
  end if;
end process;

process(estado_atual, password, enable, door, window, flag_cont, clk_out)
begin
    if rising_edge(clk_out) then
        case estado_atual is
            when inicio =>
                disp_A <= "1111";
                policia <= '0';
                if enable = '1' then
                    prox_estado <= ativo;
                else
                    prox_estado <= inicio;
                end if;
            when ativo =>
                disp_A <= "1010";
                policia <= '0';
                if password = "10011010" then
                   prox_estado <= inicio;
                elsif door = '1' then
                   prox_estado <= Porta_A;
                elsif door = '0' then -- antes ia para o estado porta fechada
                   if window(0) = '1' then
                      prox_estado <= dispara;
                   elsif window(1) = '1' then
                      prox_estado <= dispara;
                   elsif window(2) = '1' then
                      prox_estado <= dispara;
                   else 
                      prox_estado <= ativo;
                   end if;  -- nada disso acima exstia
                else
                    prox_estado <= ativo;
                end if;
            when porta_A =>
                if password = "10011010" then
                   prox_estado <= inicio;
                elsif flag_cont = '1' then
                   prox_estado <= dispara;
                elsif window(0) = '1' then
                   prox_estado <= dispara;
                elsif window(1) = '1' then
                   prox_estado <= dispara;
                elsif window(2) = '1' then
                   prox_estado <= dispara;
                else
                    prox_estado <= porta_A;
                end if;
            when dispara =>
                if password = "10011010" then
                    policia <= '0';
                    prox_estado <= inicio;
                else
                    policia <= '1';
                    prox_estado <= dispara;
                end if;
            when others =>
                prox_estado <= inicio;
        end case;
    end if;
end process;
    
process (estado_atual, clk_out)
begin
    if rising_edge(clk_out) then
    case estado_atual is
         when inicio =>
         s_flag <= '1';
         when ativo =>
         s_flag <= '1';
         when dispara =>
         s_flag <= '1';
         when porta_A =>
         s_flag <= '0';
         when others =>
         s_flag <= '1';
    end case;
    end if;
end process;

flag <= s_flag;


end Behavioral;
