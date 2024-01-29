library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Encoder_tb is
end entity Encoder_tb;

architecture tb_arch of Encoder_tb is
  signal input_vector: STD_LOGIC_VECTOR(7 downto 0) := "00010000";
  signal encoded_output: STD_LOGIC_VECTOR(7 downto 0);
begin
  UUT: entity work.Encoder
    generic map (
      INPUT_WIDTH => 8
    )
    port map (
      input => input_vector,
      output => encoded_output
    );

  process
  begin
    wait for 10 ns;  -- Allow for some simulation time
    report "Input Vector: " & integer'image(to_integer(unsigned(input_vector)));
    report "Encoded Output: " & integer'image(to_integer(unsigned(encoded_output)));
    wait;
  end process;
end architecture;
