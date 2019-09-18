
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           comece : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           sad : out STD_LOGIC_VECTOR (15 downto 0));
end top_level;

architecture Behavioral of top_level is

    component FSM is
        Port ( comece : in STD_LOGIC;
               reset : in STD_LOGIC;
               i_lt_256: in STD_LOGIC;
               clk : in STD_LOGIC;
               soma_clr : out STD_LOGIC;
               soma_ld : out STD_LOGIC;
               cont_clr : out STD_LOGIC;
               cont_ld : out STD_LOGIC;
               AB_rd : out STD_LOGIC;
               sad_reg_ld : out STD_LOGIC);
    end component;
    
    component operacional is
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
    end component;
    
    component display is
        Port ( numero : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               an : out STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal s_i_lt_256, s_soma_clr, s_soma_ld, s_cont_clr, s_cont_ld, s_AB_rd, s_sad_reg_ld : STD_LOGIC;
    signal s_sad : STD_LOGIC_VECTOR (15 downto 0);
    
begin

    U1 : FSM port map ( comece => comece,
                        reset => reset,
                        i_lt_256 => s_i_lt_256,
                        clk => clk,
                        soma_clr => s_soma_clr,
                        soma_ld => s_soma_ld,
                        cont_clr => s_cont_clr,
                        cont_ld => s_cont_ld,
                        AB_rd => s_AB_rd,
                        sad_reg_ld => s_sad_reg_ld);
    
    U2 : operacional port map ( clk => clk,
                                reset => reset,
                                soma_clr => s_soma_clr,
                                soma_ld => s_soma_ld,
                                cont_clr => s_cont_clr,
                                cont_ld => s_cont_ld,
                                AB_rd => s_AB_rd,
                                sad_reg_ld => s_sad_reg_ld,
                                sad => s_sad,
                                i_lt_256 => s_i_lt_256);
    
    U3 : display port map ( numero => s_sad,
                            clk => clk,
                            an => an,
                            seg => seg);
    
    sad <= s_sad;
    
end Behavioral;
