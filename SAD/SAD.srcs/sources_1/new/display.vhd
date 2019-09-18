library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port ( numero : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end display;

architecture Behavioral of display is

    signal clk2 : STD_LOGIC;
    signal cont, cont2 : integer := 0;
    signal seg1, seg2, seg3, seg4 : STD_LOGIC_VECTOR(6 downto 0);
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            cont <= cont + 1;
            if cont = 416667 then
                cont <= 0;
                clk2 <= not(clk2);
            end if;
        end if;
    end process;
    
    process(clk2)
    begin
        if rising_edge(clk2) then            
            if cont2 = 0 then
                an <= "1110";
                seg <= seg1;
                cont2 <= cont2 + 1;
            elsif cont2 = 1 then
                an <= "1101";
                seg <= seg2;
                cont2 <= cont2 + 1;
            elsif cont2 = 2 then
                an <= "1011";
                seg <= seg3;
                cont2 <= cont2 + 1;
            elsif cont2 = 3 then
                an <= "0111";
                seg <= seg4;
                cont2 <= 0;
            end if;
        end if;
    end process;
    
    process(numero(3 downto 0))
    begin
        case numero(3 downto 0) is
        when "0000" => seg1 <= "0000001"; -- "0"     
        when "0001" => seg1 <= "1001111"; -- "1" 
        when "0010" => seg1 <= "0010010"; -- "2" 
        when "0011" => seg1 <= "0000110"; -- "3" 
        when "0100" => seg1 <= "1001100"; -- "4" 
        when "0101" => seg1 <= "0100100"; -- "5" 
        when "0110" => seg1 <= "0100000"; -- "6" 
        when "0111" => seg1 <= "0001111"; -- "7" 
        when "1000" => seg1 <= "0000000"; -- "8"     
        when "1001" => seg1 <= "0000100"; -- "9" 
        when "1010" => seg1 <= "0000010"; -- a
        when "1011" => seg1 <= "1100000"; -- b
        when "1100" => seg1 <= "0110001"; -- C
        when "1101" => seg1 <= "1000010"; -- d
        when "1110" => seg1 <= "0110000"; -- E
        when "1111" => seg1 <= "0111000"; -- F
        when others => seg1 <= "1111111";
        end case;
    end process;
    
    process(numero(7 downto 4))
        begin
            case numero(7 downto 4) is
            when "0000" => seg2 <= "0000001"; -- "0"     
            when "0001" => seg2 <= "1001111"; -- "1" 
            when "0010" => seg2 <= "0010010"; -- "2" 
            when "0011" => seg2 <= "0000110"; -- "3" 
            when "0100" => seg2 <= "1001100"; -- "4" 
            when "0101" => seg2 <= "0100100"; -- "5" 
            when "0110" => seg2 <= "0100000"; -- "6" 
            when "0111" => seg2 <= "0001111"; -- "7" 
            when "1000" => seg2 <= "0000000"; -- "8"     
            when "1001" => seg2 <= "0000100"; -- "9" 
            when "1010" => seg2 <= "0000010"; -- a
            when "1011" => seg2 <= "1100000"; -- b
            when "1100" => seg2 <= "0110001"; -- C
            when "1101" => seg2 <= "1000010"; -- d
            when "1110" => seg2 <= "0110000"; -- E
            when "1111" => seg2 <= "0111000"; -- F
            when others => seg2 <= "1111111";
            end case;
        end process;
        
    process(numero(11 downto 8))
            begin
                case numero(11 downto 8) is
                when "0000" => seg3 <= "0000001"; -- "0"     
                when "0001" => seg3 <= "1001111"; -- "1" 
                when "0010" => seg3 <= "0010010"; -- "2" 
                when "0011" => seg3 <= "0000110"; -- "3" 
                when "0100" => seg3 <= "1001100"; -- "4" 
                when "0101" => seg3 <= "0100100"; -- "5" 
                when "0110" => seg3 <= "0100000"; -- "6" 
                when "0111" => seg3 <= "0001111"; -- "7" 
                when "1000" => seg3 <= "0000000"; -- "8"     
                when "1001" => seg3 <= "0000100"; -- "9" 
                when "1010" => seg3 <= "0000010"; -- a
                when "1011" => seg3 <= "1100000"; -- b
                when "1100" => seg3 <= "0110001"; -- C
                when "1101" => seg3 <= "1000010"; -- d
                when "1110" => seg3 <= "0110000"; -- E
                when "1111" => seg3 <= "0111000"; -- F
                when others => seg3 <= "1111111";
                end case;
            end process;

    process(numero(15 downto 12))
        begin
            case numero(15 downto 12) is
            when "0000" => seg4 <= "0000001"; -- "0"     
            when "0001" => seg4 <= "1001111"; -- "1" 
            when "0010" => seg4 <= "0010010"; -- "2" 
            when "0011" => seg4 <= "0000110"; -- "3" 
            when "0100" => seg4 <= "1001100"; -- "4" 
            when "0101" => seg4 <= "0100100"; -- "5" 
            when "0110" => seg4 <= "0100000"; -- "6" 
            when "0111" => seg4 <= "0001111"; -- "7" 
            when "1000" => seg4 <= "0000000"; -- "8"     
            when "1001" => seg4 <= "0000100"; -- "9" 
            when "1010" => seg4 <= "0000010"; -- a
            when "1011" => seg4 <= "1100000"; -- b
            when "1100" => seg4 <= "0110001"; -- C
            when "1101" => seg4 <= "1000010"; -- d
            when "1110" => seg4 <= "0110000"; -- E
            when "1111" => seg4 <= "0111000"; -- F
            when others => seg4 <= "1111111";
            end case;
    end process;

end Behavioral;
