library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_tb is
end demux_tb;

architecture tb of demux_tb is
    constant WIDTH : integer := 8;
    signal sel : std_logic_vector(1 downto 0);
    signal input : std_logic_vector(WIDTH-1 downto 0);
    signal out0, out1, out2, out3 : std_logic_vector(WIDTH-1 downto 0);

    component demux is
        generic (width : integer := 8);
        port (
            sel : in std_logic_vector(1 downto 0);
            input : in std_logic_vector(width-1 downto 0);
            out0, out1, out2, out3 : out std_logic_vector(width-1 downto 0)
        );
    end component;

begin
    UUT: demux
        generic map (WIDTH)
        port map (sel, input, out0, out1, out2, out3);

    stimulus: process
    begin
        -- Test Case 1
        sel <= "00";
        input <= "00000001";
        wait for 10 ns;

        -- Test Case 2
        sel <= "01";
        input <= "00000010";
        wait for 10 ns;

        -- Test Case 3
        sel <= "10";
        input <= "00000100";
        wait for 10 ns;

        -- Test Case 4
        sel <= "11";
        input <= "00001000";
        wait for 10 ns;

        -- End of tests
        wait;
    end process stimulus;
end tb;