library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FIR3taps is
  Port ( cl: in std_logic;
         ca1 : in std_logic;
         ca0 : in std_logic;
         x : in std_logic_vector(7 downto 0);
         clk : in std_logic;
         y : out std_logic_vector(7 downto 0));
end FIR3taps;

architecture Behavioral of FIR3taps is
    component mux2x4
        Port (sel : in std_logic_vector(1 downto 0);
            cl : in std_logic;
            a : out std_logic;
            b : out std_logic;
            c : out std_logic;
            d : out std_logic );
    end component;
    
    component registrador
     port(   clk : in std_logic;
             x : in std_logic_vector(7 downto 0);
             y : out std_logic_vector(7 downto 0);
             enable : in std_logic );
    end component;
    
    component ULA
        Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
               b : in STD_LOGIC_VECTOR (7 downto 0);
               sel : in STD_LOGIC_VECTOR (3 downto 0);
               y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    
    signal s_clk: std_logic;
    signal s_x : std_logic_vector(7 downto 0);
    signal s_xt0 : std_logic_vector(7 downto 0);
    signal s_xt1 : std_logic_vector(7 downto 0);
    signal s_xt2 : std_logic_vector(7 downto 0);
    signal s_c_in : std_logic_vector(2 downto 0);
    signal s_c0_out : std_logic_vector(7 downto 0);
    signal s_c1_out : std_logic_vector(7 downto 0);
    signal s_c2_out : std_logic_vector(7 downto 0);
    signal s_mult0 : std_logic_vector(7 downto 0);
    signal s_mult1 : std_logic_vector(7 downto 0);
    signal s_mult2 : std_logic_vector(7 downto 0);
    signal s_soma0 : std_logic_vector(7 downto 0);
    signal s_soma1 : std_logic_vector(7 downto 0);
    signal ca1ca0 : std_logic_vector(1 downto 0);
begin
    ca1ca0(0) <= ca0;
    ca1ca0(1) <= ca1;
    s_clk <= clk;
    s_x <= x;

    mux24: mux2x4 port map (ca1ca0, cl, s_c_in(0), s_c_in(1), s_c_in(2), OPEN);
    c0: registrador port map (s_clk, s_x, s_c0_out, s_c_in(0)); 
    c1: registrador port map (s_clk, s_x, s_c1_out, s_c_in(1));
    c2: registrador port map (s_clk, s_x, s_c2_out, s_c_in(2));
    xt0: registrador port map(s_clk, s_x, s_xt0, '1');
    xt1: registrador port map(s_clk, s_xt0, s_xt1, '1');
    xt2: registrador port map(s_clk, s_xt1, s_xt2,'1');
    mult_0: ULA port map (s_xt0, s_c0_out, "0111",s_mult0);
    mult_1: ULA port map (s_xt1, s_c1_out, "0111",s_mult1);
    mult_2: ULA port map (s_xt2, s_c2_out, "0111",s_mult2);
    soma_0: ULA port map (s_mult0, s_mult1,"0000", s_soma0);
    soma_1: ULA port map (s_mult2, s_soma0 ,"0000", s_soma1);
    yreg: registrador port map (s_clk, s_soma1, y, '1');     
end Behavioral;
