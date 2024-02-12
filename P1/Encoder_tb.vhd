library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- New Testbench for the Encoder
-- This testbench is designed to simulate and verify the functionality of the encoder

entity Encoder_tb is
end entity Encoder_tb;

architecture tb_arch of Encoder_tb is
    signal input_vector: STD_LOGIC_VECTOR(7 downto 0);
    signal ia_signal : std_logic;
    signal encoded_output: STD_LOGIC_VECTOR(2 downto 0);
begin
    UUT: entity work.Encoder
        generic map (
            INPUT_WIDTH => 8
        )
        port map (
            input => input_vector,
            ia => ia_signal,
            output => encoded_output
        );

    -- Test process
    test: process is
    begin
        -- Test Case 1
        input_vector <= "00010000";  -- Test input
        wait for 10ns
        report "Test Case 1 - Input Vector: " & integer'image(to_integer(unsigned(input_vector)));
        report "Test Case 1 - Encoded Output: " & integer'image(to_integer(unsigned(encoded_output)));

        -- Test Case 2
        input_vector <= "01000000";  -- Another test input
        wait for 10ns
        report "Test Case 2 - Input Vector: " & integer'image(to_integer(unsigned(input_vector)));
        report "Test Case 2 - Encoded Output: " & integer'image(to_integer(unsigned(encoded_output)));
        -- Finish the simulation
        wait;
    end process;
end architecture tb_arch;
