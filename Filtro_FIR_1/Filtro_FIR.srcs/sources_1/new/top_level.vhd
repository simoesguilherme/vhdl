library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( cl : in STD_LOGIC;
           ca1 : in STD_LOGIC;
           ca0 : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end top_level;

architecture Behavioral of top_level is
    component FIR3taps
        Port ( cl: in std_logic;
               ca1 : in std_logic;
               ca0 : in std_logic;
               x : in std_logic_vector(7 downto 0);
               clk : in std_logic;
               y : out std_logic_vector(7 downto 0));
    end component;
    
    component hex2bcd
        port ( hex_in  : in  std_logic_vector (11 downto 0) ;
               bcd_tho : out std_logic_vector (3 downto 0) ;
               bcd_hun : out std_logic_vector (3 downto 0) ;
               bcd_ten : out std_logic_vector (3 downto 0) ;
               bcd_uni : out std_logic_vector (3 downto 0) ) ;
    end component;
    
    component display
        Port ( clk : in std_logic;
               an : out std_logic_vector (3 downto 0);
               bcd_tho : in std_logic_vector (3 downto 0) ;
               bcd_hun : in std_logic_vector (3 downto 0) ;
               bcd_ten : in std_logic_vector (3 downto 0) ;
               bcd_uni : in std_logic_vector (3 downto 0) ;
               seg_out : out std_logic_vector (6 downto 0));
    end component;
    
    signal s_hex_in  :  std_logic_vector (11 downto 0) ;
    signal s_bcd_tho :  std_logic_vector (3 downto 0) ;
    signal s_bcd_hun :  std_logic_vector (3 downto 0) ;
    signal s_bcd_ten :  std_logic_vector (3 downto 0) ;
    signal s_bcd_uni :  std_logic_vector (3 downto 0) ;
    signal s_y   :  std_logic_vector(7 downto 0);
    signal clk_128hz : std_logic := '0';
    signal cont : integer:= 0;
begin
    s_hex_in(7 downto 0) <= s_y;
    s_hex_in(11 downto 8) <= "0000";

    process(clk)
    begin
        if rising_edge(clk) then
            cont<= cont +1;
            if cont = 390625 then
                clk_128hz <= not clk_128hz;
                cont <= 0;
            end if;
        end if;
    end process;
    
    tapsfir: FIR3taps port map (cl, ca1, ca0, x, clk, s_y);
    hex2bcdd: hex2bcd port map (s_hex_in, s_bcd_tho, s_bcd_hun, s_bcd_ten, s_bcd_uni);
    displayy: display port map(clk_128hz, an, s_bcd_tho, s_bcd_hun, s_bcd_ten, s_bcd_uni, seg);
     
end Behavioral;
