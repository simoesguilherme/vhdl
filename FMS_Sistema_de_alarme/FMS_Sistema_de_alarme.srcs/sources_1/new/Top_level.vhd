library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_level is
    Port ( clk        : in STD_LOGIC;
           reset      : in STD_LOGIC;
           door       : in  STD_LOGIC;
           window     : in  std_logic_vector (2 downto 0);
           enable     : in  STD_LOGIC;
           password   : in  STD_LOGIC_VECTOR (7 downto 0);
           led        : out STD_LOGIC_vector (14 downto 0);
           seg        : out STD_LOGIC_VECTOR (6 DOWNTO 0);
           an         : out STD_LOGIC_VECTOR (3 DOWNTO 0)
       );
end Top_level;

architecture Behavioral of Top_level is

component FMS
port (
  clk        : in  STD_LOGIC;
  clk_out    : in  STD_LOGIC;
  reset      : in  STD_LOGIC;
  enable     : in  STD_LOGIC;
  flag_cont  : in  STD_LOGIC;
  window     : in  std_logic_vector (2 downto 0);
  door       : in  std_logic;
  password   : in  STD_LOGIC_VECTOR (7 downto 0);
  disp_A     : out std_logic_vector (3 downto 0);
  flag       : out std_logic;
  policia    : out std_logic
);
end component FMS;

component Piscador
port (
  clk_1Hz : in  STD_LOGIC;
  reset   : in  STD_LOGIC;
  policia : in  STD_LOGIC;
  led     : out STD_LOGIC_VECTOR (13 downto 0)
);
end component Piscador;

component Contador
port (
  clk       : in  STD_LOGIC;
  clk_1Hz   : in  STD_LOGIC;
  flag      : in  STD_LOGIC;
  reset     : in  STD_LOGIC;
  flag_cont : out std_logic;
  led       : out STD_LOGIC;
  unidade   : out STD_LOGIC_VECTOR (3 downto 0);
  dezena    : out STD_LOGIC_VECTOR (3 downto 0)
);
end component Contador;

component Divisor_de_clock
port (
  clk     : in  STD_LOGIC;
  reset   : in  STD_LOGIC;
  clk_out : out std_logic;
  clk_1Hz : out std_logic
);
end component Divisor_de_clock;

component Mux_Display
port (
  clk   : in  STD_LOGIC;
  reset : in  STD_LOGIC;
  disp1 : in  std_logic_vector(3 downto 0);
  disp2 : in  std_logic_vector(3 downto 0);
  disp4 : in  std_logic_vector(3 downto 0);
  seg   : out STD_LOGIC_VECTOR (6 DOWNTO 0);
  an    : out STD_LOGIC_VECTOR (3 DOWNTO 0)
);
end component Mux_Display;

signal clk_1Hz : std_logic;
signal clk_out : std_logic;
signal disp_A : std_logic_vector(3 downto 0);
signal flag : std_logic:='0';
signal policia : std_logic:='0';
signal flag_cont : std_logic:='0';
signal unidade  : STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal dezena  : STD_LOGIC_VECTOR (3 downto 0):="0000";

begin

FMS_i : FMS
port map (
  clk        => clk,
  clk_out    => clk_out,
  reset      => reset,
  enable     => enable,
  flag_cont  => flag_cont,
  window     => window,
  door       => door,
  password   => password,
  disp_A     => disp_A,
  flag       => flag,
  policia    => policia
);

Piscador_i : Piscador
port map (
  clk_1Hz => clk_1Hz,
  reset   => reset,
  policia => policia,
  led(13 downto 0)     => led(13 downto 0)
);

Contador_i : Contador
port map (
  clk       => clk,
  clk_1Hz   => clk_1Hz,
  flag      => flag,
  reset     => reset,
  flag_cont => flag_cont,
  led       => led(14),
  unidade   => unidade,
  dezena    => dezena
);

Divisor_de_clock_i : Divisor_de_clock
port map (
  clk     => clk,
  reset   => reset,
  clk_out => clk_out,
  clk_1Hz => clk_1Hz
);

Mux_Display_i : Mux_Display
port map (
  clk   => clk,
  reset => reset,
  disp1 => unidade,
  disp2 => dezena,
  disp4 => disp_A,
  seg   => seg,
  an    => an
);

end Behavioral;
