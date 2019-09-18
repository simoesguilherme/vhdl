library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display is
    Port ( clk : in std_logic;
           an : out std_logic_vector (3 downto 0);
           bcd_tho : in std_logic_vector (3 downto 0) ;
           bcd_hun : in std_logic_vector (3 downto 0) ;
           bcd_ten : in std_logic_vector (3 downto 0) ;
           bcd_uni : in std_logic_vector (3 downto 0) ;
           seg_out : out std_logic_vector (6 downto 0));
end display;

architecture Behavioral of display is
    signal cont : integer := 0;
begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            case cont is
                when 0 =>
                    CASE bcd_uni IS
                             when "0000" => seg_out <= "1000000";
                             when "0001" => seg_out <= "1111001";
                             when "0010" => seg_out <= "0100100";
                             when "0011" => seg_out <= "0110000";
                             when "0100" => seg_out <= "0011001";
                             when "0101" => seg_out <= "0010010";
                             when "0110" => seg_out <= "0000010";
                             when "0111" => seg_out <= "1111000";
                             when "1000" => seg_out <= "0000000";
                             when "1001" => seg_out <= "0010000";
                             when "1010" => seg_out <= "0001000";
                             when "1011" => seg_out <= "0110000";
                             when "1100" => seg_out <= "1000110";
                             when "1101" => seg_out <= "1110000";
                             when "1110" => seg_out <= "0000110";
                             when "1111" => seg_out <= "0001110";
                             when others => seg_out <= "0010000";
                    end case;
                    an <= "1110";
                    cont <= 1;
                when 1 =>
                    CASE bcd_ten IS                              
                             when "0000" => seg_out <= "1000000";
                             when "0001" => seg_out <= "1111001";
                             when "0010" => seg_out <= "0100100";
                             when "0011" => seg_out <= "0110000";
                             when "0100" => seg_out <= "0011001";
                             when "0101" => seg_out <= "0010010";
                             when "0110" => seg_out <= "0000010";
                             when "0111" => seg_out <= "1111000";
                             when "1000" => seg_out <= "0000000";
                             when "1001" => seg_out <= "0010000";
                             when "1010" => seg_out <= "0001000";
                             when "1011" => seg_out <= "0110000";
                             when "1100" => seg_out <= "1000110";
                             when "1101" => seg_out <= "1110000";
                             when "1110" => seg_out <= "0000110";
                             when "1111" => seg_out <= "0001110";
                             when others => seg_out <= "0010000";
                    end case;                                    
                    an <= "1101";
                    cont <= 2;
                when 2 =>
                    CASE bcd_hun IS                              
                             when "0000" => seg_out <= "1000000";
                             when "0001" => seg_out <= "1111001";
                             when "0010" => seg_out <= "0100100";
                             when "0011" => seg_out <= "0110000";
                             when "0100" => seg_out <= "0011001";
                             when "0101" => seg_out <= "0010010";
                             when "0110" => seg_out <= "0000010";
                             when "0111" => seg_out <= "1111000";
                             when "1000" => seg_out <= "0000000";
                             when "1001" => seg_out <= "0010000";
                             when "1010" => seg_out <= "0001000";
                             when "1011" => seg_out <= "0110000";
                             when "1100" => seg_out <= "1000110";
                             when "1101" => seg_out <= "1110000";
                             when "1110" => seg_out <= "0000110";
                             when "1111" => seg_out <= "0001110";
                             when others => seg_out <= "0010000";
                    end case;                                    
                    an <= "1011";     
                    cont <= 3;  
                when others =>
                    CASE bcd_tho IS                              
                             when "0000" => seg_out <= "1000000";
                             when "0001" => seg_out <= "1111001";
                             when "0010" => seg_out <= "0100100";
                             when "0011" => seg_out <= "0110000";
                             when "0100" => seg_out <= "0011001";
                             when "0101" => seg_out <= "0010010";
                             when "0110" => seg_out <= "0000010";
                             when "0111" => seg_out <= "1111000";
                             when "1000" => seg_out <= "0000000";
                             when "1001" => seg_out <= "0010000";
                             when "1010" => seg_out <= "0001000";
                             when "1011" => seg_out <= "0110000";
                             when "1100" => seg_out <= "1000110";
                             when "1101" => seg_out <= "1110000";
                             when "1110" => seg_out <= "0000110";
                             when "1111" => seg_out <= "0001110";
                             when others => seg_out <= "0010000";
                    end case;                                    
                    an <= "0111";     
                    cont <= 0;             
            end case;
        end if;
    end process;


end Behavioral;
