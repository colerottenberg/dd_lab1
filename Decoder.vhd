library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Decoder: Takes in a 4-bit input and outputs an 8-bit output

entity Decoder is
    port(
        input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(7 downto 0)
    );
end entity Decoder;

architecture Behavioral of Decoder is
begin
    process(input)
    begin
        case input is
            when "0000" => output <= "00000000";
            when "0001" => output <= "00000001";
            when "0010" => output <= "00000010";
            when "0011" => output <= "00000100";
            when "0100" => output <= "00001000";
            when "0101" => output <= "00010000";
            when "0110" => output <= "00100000";
            when "0111" => output <= "01000000";
            when "1000" => output <= "10000000";
            when others => output <= "00000000";
        end case;
    end process;
end architecture Behavioral;
