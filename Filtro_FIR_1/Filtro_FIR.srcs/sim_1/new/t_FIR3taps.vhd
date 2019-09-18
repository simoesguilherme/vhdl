library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_FIR3taps is
--  Port ( );
end t_FIR3taps;

architecture Behavioral of t_FIR3taps is
    component FIR3taps
        Port ( cl: in std_logic;
               ca1 : in std_logic;
               ca0 : in std_logic;
               x : in std_logic_vector(7 downto 0);
               clk : in std_logic;
               y : out std_logic_vector(7 downto 0));
    end component;
    
    signal s_cl:  std_logic;                     
    signal s_ca1 :  std_logic;                   
    signal s_ca0 :  std_logic;                   
    signal s_x :  std_logic_vector(7 downto 0);  
    signal s_clk : std_logic;                   
    signal s_y :  std_logic_vector(7 downto 0);
begin
    uut: FIR3taps port map(s_cl, s_ca1, s_ca0, s_x, s_clk, s_y);
    
    process
    begin
        s_clk<= '0';
        wait for 5 ns;
        s_clk <= '1';
        wait for 5 ns;
    end process;

    stimulus: process
    begin
        s_cl<= '1'; s_ca0<= '0'; s_ca1<= '0'; s_x <= "00000100"; 
        wait for 10 ns;
        s_cl<= '1'; s_ca0<= '0'; s_ca1<= '1'; s_x <= "00000100"; 
        wait for 10 ns;
        s_cl<= '1'; s_ca0<= '1'; s_ca1<= '0'; s_x <= "00000100"; 
        wait for 10 ns;
        s_cl<= '1'; s_ca0<= '0'; s_ca1<= '0'; s_x <= "00000011";
        wait for 10 ns;
        s_cl<= '1'; s_ca0<= '0'; s_ca1<= '1'; s_x <= "00000011";
        wait for 10 ns;
        s_cl<= '1'; s_ca0<= '1'; s_ca1<= '0'; s_x <= "00000011";
        wait for 10 ns;
    end process;
end Behavioral;