library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Register: A generic register with generic width called INPUT_WIDTH
-- The reset is synchronous and active high

entity Register is
    generic (
        INPUT_WIDTH : integer := 8
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector(INPUT_WIDTH-1 downto 0);
        output : out std_logic_vector(INPUT_WIDTH-1 downto 0)
    );
end entity Register;

architecture Behavioral of Register is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            output <= (others => '0');
        elsif rising_edge(clk) then
            output <= input;
        end if;
    end process;
end architecture Behavioral;

