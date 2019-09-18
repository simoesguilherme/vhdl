library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ULA is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end ULA;

architecture Behavioral of ULA is
    component uni_arit
         Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
              b : in STD_LOGIC_VECTOR (7 downto 0);
              sel : in STD_LOGIC_VECTOR (2 downto 0);
              x : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component uni_logic
        Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
               b : in STD_LOGIC_VECTOR (7 downto 0);
               sel : in STD_LOGIC_VECTOR (2 downto 0);
               x : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
        
    component mux
        Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
               b : in STD_LOGIC_VECTOR (7 downto 0);
               sel : in STD_LOGIC;
               x : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal s_a, s_b: std_logic_vector (7 downto 0);
    signal s_arit, s_logic, s_mux : std_logic_vector (7 downto 0);
    signal sel_uni : std_logic_vector (2 downto 0);
    
begin
    aritmetica: uni_arit port map (s_a, s_b, sel_uni, s_arit);
    logica: uni_logic port map (s_a, s_b, sel_uni, s_logic);
    mux2bits: mux port map (s_arit, s_logic, sel(3), s_mux);
    
    s_a <= a;
    s_b <= b;
    y <= s_mux;
    sel_uni <= sel(2 downto 0);

end Behavioral;
