library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Encoder is 
    port(
        clk : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(3 downto 0)
    );
end entity Encoder;

architecture Behavioral of Encoder is
    signal data_out_int : std_logic_vector(3 downto 0);

begin
    process(clk, reset)
    begin
        if reset = '1' then
            data_out_int <= "0000";
        elsif rising_edge(clk) then
            case data_in is
                when "00000000" => data_out_int <= "0000";
                when "00000001" => data_out_int <= "0001";
                when "00000010" => data_out_int <= "0010";
                when "00000100" => data_out_int <= "0011";
                when "00001000" => data_out_int <= "0100";
                when "00010000" => data_out_int <= "0101";
                when "00100000" => data_out_int <= "0110";
                when "01000000" => data_out_int <= "0111";
                when "10000000" => data_out_int <= "1000";
                when others => data_out_int <= "1001";
            end case;
        end if;
    end process;

    data_out <= data_out_int;
end architecture Behavioral;
```
