library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operacional is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           soma_clr : in STD_LOGIC;
           soma_ld  : in STD_LOGIC;
           cont_clr : in STD_LOGIC;
           cont_ld  : in STD_LOGIC;
           AB_rd    : in STD_LOGIC;
           sad_reg_ld : in STD_LOGIC;
           sad : out STD_LOGIC_VECTOR (15 downto 0);
           i_lt_256 : out STD_LOGIC);
end operacional;

architecture Behavioral of operacional is

    component I is
       Port (  load : in  STD_LOGIC;
               clk : in  STD_LOGIC;
               clear: in Std_Logic;
               i_out : out  STD_LOGIC_VECTOR (8 downto 0));
    end component;
    
    component abs_dif is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               dif : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component comparador is
        Port ( A : in std_logic_vector(8 downto 0);
               menor: out std_logic );
    end component;
    
    component registrador_SAD is
        Port ( clear : in  STD_LOGIC;
               load : in  STD_LOGIC;
               clk : in  STD_LOGIC;
               E : in  STD_LOGIC_VECTOR (15 downto 0);
               S : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component registrador_soma is
        Port (  clear : in  STD_LOGIC;
                load : in  STD_LOGIC;
                clk : in  STD_LOGIC;
                I : in  STD_LOGIC_VECTOR (15 downto 0);
                Q : out  STD_LOGIC_VECTOR (15 downto 0));                 
    end component;
    
    component somador is
        Port (   X : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
                 Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
                 S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) );
    end component;
    
    component ROM1 is
      Port ( a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
             spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
    
    component ROM2 IS
      Port ( a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
             spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
    
    signal s_i_out : STD_LOGIC_VECTOR (8 downto 0);
    signal s_A, s_B, s_dif : STD_LOGIC_VECTOR (7 downto 0);
    signal S_somador, Q_somador : STD_LOGIC_VECTOR (15 downto 0);
    
begin

    U1 : I port map ( load => cont_ld,
                      clk => clk,
                      clear => cont_clr,
                      i_out => s_i_out);
                      
    U2 : ROM1 port map ( a => s_i_out(7 downto 0),
                         spo => s_A);
                         
    U3 : ROM2 port map ( a => s_i_out(7 downto 0),
                         spo => s_B);
                         
    U4 : abs_dif port map ( A => s_A,
                            B => s_B,
                            dif => s_dif);
                            
    U5 : comparador port map ( A => s_i_out,
                               menor => i_lt_256);
    
    U6 : registrador_soma port map ( clear => soma_clr,
                                     load => soma_ld,
                                     clk => clk,
                                     I => S_somador,
                                     Q => Q_somador);
    
    U7 : somador port map ( X => s_dif,
                            Y => Q_somador,
                            S => S_somador);
                            
                               
    U8 : registrador_SAD port map ( clear => reset,
                                    load => sad_reg_ld,
                                    clk => clk,
                                    E => Q_somador,
                                    S => sad);
  
end Behavioral;
