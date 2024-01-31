library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Demultiplexer: takes in a generic width of a 4x1 demultiplexer and outputs the selected bus

entity demux is
    generic (width : integer := 8);
    port (  sel : in std_logic_vector(1 downto 0);
            input : in std_logic_vector(width-1 downto 0);
            out0, out1, out2, out3 : out std_logic_vector(width-1 downto 0));
end entity demux;


architecture rtl of demux is
begin
    process (sel, bus)
    begin
        case sel is
            when "00" => out0 <= input;
            when "01" => out1 <= input;
            when "10" => out2 <= input;
            when "11" => out3 <= input;
            when others => out0 <= (others => 'X');
        end case;
    end process;
end architecture rtl;
