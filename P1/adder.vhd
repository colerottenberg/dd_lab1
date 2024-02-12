library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic (
        WIDTH : integer := 8
            )
    port (
        x, y : in  unsigned(WIDTH-1 downto 0);
        carry_in : in std_logic;
        s      : out unsigned(WIDTH-1 downto 0)
        carry_out: out std_logic
            );
end entity adder;


architecture rtl of adder is
begin
    process(x, y, carry_in)
    variable temp_sum : unsigned(WIDTH downto 0);
    begin
        temp_sum := resize(unsigned(x) + WIDTH+1) + resize(unsigned(y), WIDTH+1) + unsigned(carry_in);
        s <= std_logic_vector(temp_sum(WIDTH-1 downto 0));
        carry_out <= temp_sum(WIDTH);
    end process;
end architecture rtl;
