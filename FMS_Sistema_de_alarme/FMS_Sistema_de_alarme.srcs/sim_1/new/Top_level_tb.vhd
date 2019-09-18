library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_level_tb is
--  Port ( );
end Top_level_tb;

architecture Behavioral of Top_level_tb is

component Top_level
port (
  clk      : in  STD_LOGIC;
  reset    : in  STD_LOGIC;
  door     : in  STD_LOGIC;
  window   : in  std_logic_vector (2 downto 0);
  enable   : in  STD_LOGIC;
  password : in  STD_LOGIC_VECTOR (7 downto 0);
  led      : out STD_LOGIC_vector (14 downto 0);
  seg      : out STD_LOGIC_VECTOR (6 DOWNTO 0);
  an       : out STD_LOGIC_VECTOR (3 DOWNTO 0)
);
end component Top_level;

signal x_clk      : STD_LOGIC := '0';
signal x_reset    : STD_LOGIC := '0';
signal x_door     : STD_LOGIC := '0';
signal x_window   : std_logic_vector (2 downto 0) := (others => '0');
signal x_enable   : STD_LOGIC := '0';
signal x_password : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal x_led      : STD_LOGIC_vector (14 downto 0);
signal x_seg      : STD_LOGIC_VECTOR (6 DOWNTO 0);
signal x_an       : STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

Top_level_i : Top_level
port map (
  clk      => x_clk,
  reset    => x_reset,
  door     => x_door,
  window   => x_window,
  enable   => x_enable,
  password => x_password,
  led      => x_led,
  seg      => x_seg,
  an       => x_an
);

x_clk <= not x_clk after 5 ns;

    x_enable <= '0', '1' after 200 ns, '0' after 400 ns, 
                     '1' after 1500 ns, '0' after 2000 ns,
                     '1' after 4900 ns;

    x_door <= '0', '1' after 600 ns, '0' after 900 ns, 
                   '1' after 1600 ns, '0' after 4000 ns;
                 
    x_window <= "000", "111" after 800 ns, "000"  after 900 ns;

    x_password <= "00000000", "10011010" after 1000 ns,  "00000000" after 1100 ns, 
                              "10011010" after 4300 ns, "00000000" after 4800 ns;

end Behavioral;
