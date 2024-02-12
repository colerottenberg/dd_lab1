library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic (
        WIDTH : integer := 8
            );
    port (
        x, y : in  std_logic_vector(WIDTH-1 downto 0);
        carry_in : in std_logic;
        s      : out std_logic_vector(WIDTH-1 downto 0);
        carry_out: out std_logic
            );
end entity adder;


architecture RIPPLE_CARRY of adder is
    signal carry : std_logic_vector(WIDTH downto 0);
begin
    carry(0) <= carry_in;
    carry_out <= carry(WIDTH);
    gen : for i in 0 to WIDTH-1 generate
        s(i) <= x(i) xor y(i) xor carry(i);
        carry(i+1) <= (x(i) and y(i)) or (x(i) and carry(i)) or (y(i) and carry(i));
    end generate;
end architecture RIPPLE_CARRY;

architecture CARRY_LOOKAHEAD of adder is
    signal G, P, carry : std_logic_vector(WIDTH downto 0);
begin
    carry(0) <= carry_in;
    carry_out <= carry(WIDTH);
    gen : for i in 0 to WIDTH-1 generate
        G(i) <= x(i) and y(i);
        P(i) <= x(i) xor y(i);
        carry(i+1) <= G(i) or (P(i) and carry(i));
        s(i) <= P(i) xor carry(i);
    end generate gen;
end architecture CARRY_LOOKAHEAD;