library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Multiplexer: The mux recieves 4 in signals and 2 select signals
-- This Mux has a generic parameter N that defines the number of bits of the input signals
entity mux is
    generic(N: integer := 4);
    port(
        in0, in1, in2, in3: in std_logic_vector(N-1 downto 0);
        sel : in std_logic_vector(1 downto 0);
        o: out std_logic_vector(N-1 downto 0)
    );
end mux;

architecture mux_arch of mux is
begin
    process(in0, in1, in2, in3, sel)
    begin
        case sel is
            when "00" =>
                o <= in0;
            when "01" =>
                o <= in1;
            when "10" =>
                o <= in2;
            when "11" =>
                o <= in3;
            when others =>
                o <= (others => 'X');
        end case;
    end process;
end mux_arch;
