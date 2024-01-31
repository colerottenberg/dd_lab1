library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Multiplexer: The mux recieves 4 in signals and 2 select signals
-- This Mux has a generic parameter N that defines the number of bits of the input signals
entity mux is
    generic(N: integer := 4);
    port(
        in0, in1, in2, in3: in std_logic_vector(N-1 downto 0);
        sel0, sel1: in std_logic;
        o: out std_logic_vector(N-1 downto 0)
    );
end mux;

architecture mux_arch of mux is
begin
    process(in0, in1, in2, in3, sel0, sel1)
    begin
        if sel0 = '0' and sel1 = '0' then
            o <= in0;
        elsif sel0 = '0' and sel1 = '1' then
            o <= in1;
        elsif sel0 = '1' and sel1 = '0' then
            o <= in2;
        elsif sel0 = '1' and sel1 = '1' then
            o <= in3;
        end if;
    end process;
end mux_arch;
