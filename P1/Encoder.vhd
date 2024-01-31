library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- An encoder takes in a set of 8 bits and outputs a 4 bit code corresponding to the input
-- The encoder needs to take a INPUT_WIDTH generic to determine the number of bits in the input

entity encoder is
    generic (
        INPUT_WIDTH : integer := 8
    );
    port (
        input : in std_logic_vector(INPUT_WIDTH-1 downto 0);
        ia : out std_logic;
        output : out std_logic_vector(integer(ceil(log2(real(INPUT_WIDTH))))-1 downto 0)
    );
end entity encoder;

architecture rtl of encoder is
    constant NUM_OUTPUT_BITS : integer := integer(ceil(log2(real(INPUT_WIDTH))));
begin

    process(input)
    begin
        ia <= '0';
        output <= (others => '0');

        for i in 0 to INPUT_WIDTH-1 loop
            if input(i) = '1' then
                ia <= '1';
                output <= std_logic_vector(to_unsigned(i, NUM_OUTPUT_BITS));
            end if;
        end loop;
    end process;
end architecture rtl;
