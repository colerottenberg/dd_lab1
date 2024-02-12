library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Testbench for the Mux4to1

entity Mux4to1_tb is
end Mux4to1_tb;

architecture Mux4to1_tb_arch of Mux4to1_tb is
  component Mux
    port (
      in0, in1, in2, in3 : in std_logic_vector(3 downto 0);
      sel : in std_logic_vector(1 downto 0);
      o : out std_logic_vector(3 downto 0)
    );
  end component;

  signal in0, in1, in2, in3 : std_logic_vector(3 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal o : std_logic_vector(3 downto 0);

begin
  UUT : Mux
    port map (
      in0 => in0,
      in1 => in1,
      in2 => in2,
      in3 => in3,
      sel => sel,
      o => o
    );

  process
  begin
    sel <= "00";
    in0 <= "0000";
    in1 <= "0001";
    in2 <= "0010";
    in3 <= "0011";
    wait for 10 ns;
    sel <= "01";
    wait for 10 ns;
    sel <= "10";
    wait for 10 ns;
    sel <= "11";
    wait for 10 ns;
    wait;
  end process;
end Mux4to1_tb_arch;
