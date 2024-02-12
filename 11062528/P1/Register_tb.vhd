library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_tb is
end entity Register_tb;

architecture tb_arch of Register_tb is
  signal input_data: STD_LOGIC_VECTOR(7 downto 0) := "11001100";
  signal output_data: STD_LOGIC_VECTOR(7 downto 0);
  signal clk: STD_LOGIC := '0';
begin
  UUT: entity work.Reg
    generic map (
      INPUT_WIDTH => 8
    )
    port map (
      clk    => clk,
      reset  => '0',  -- Assuming active-high synchronous reset
      input  => input_data,
      output => output_data
    );

  clk <= not clk after 10 ns;

  process
  begin
    wait for 10 ns;  -- Allow for some simulation time
    report "Input Data: " & integer'image(to_integer(unsigned(input_data)));
    report "Output Data: " & integer'image(to_integer(unsigned(output_data)));
    wait;
  end process;
end architecture tb_arch;
