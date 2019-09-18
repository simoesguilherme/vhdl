library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
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
end FSM;

architecture Behavioral of FSM is

    type state is (s0, s1, s2, s3, s4);
    signal current_state, next_state : state := s0;
    
begin

    transicao: process(clk, reset)
    begin
        if reset = '1' then
            current_state <= s0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    estados: process(current_state, comece, i_lt_256)
    begin
        case current_state is
            when s0 =>
                if comece = '0' then
                    next_state <= s0;
                else
                    next_state <= s1;
                end if;
            when s1 =>
                next_state <= s2;
            when s2 =>
                if i_lt_256 = '1' then
                    next_state <= s3;
                else
                    next_state <= s4;
                end if;
            when s3 =>
                next_state <= s2;
            when s4 =>
                next_state <= s0;
        end case;
    end process;
    
    saidas: process(current_state)
    begin
        case current_state is
            when s0 =>
                soma_clr <= '0';
                soma_ld <= '0';
                cont_clr <= '0';
                cont_ld <= '0';
                AB_rd <= '0';
                sad_reg_ld <= '0';
            when s1 =>
                soma_clr <= '1';
                soma_ld <= '0';
                cont_clr <= '1';
                cont_ld <= '0';
                AB_rd <= '0';
                sad_reg_ld <= '0';
            when s2 =>
                soma_clr <= '0';
                soma_ld <= '0';
                cont_clr <= '0';
                cont_ld <= '0';
                AB_rd <= '0';
                sad_reg_ld <= '0';
            when s3 =>
                soma_clr <= '0';
                soma_ld <= '1';
                cont_clr <= '0';
                cont_ld <= '1';
                AB_rd <= '1';
                sad_reg_ld <= '0';
            when s4 =>
                soma_clr <= '0';
                soma_ld <= '0';
                cont_clr <= '0';
                cont_ld <= '0';
                AB_rd <= '0';
                sad_reg_ld <= '1';
        end case;
    end process;

end Behavioral;
