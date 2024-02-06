library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb2 is
end adder_tb2;


architecture TB of adder_tb2 is

    constant TEST_WIDTH : positive := 4;

    signal x      : std_logic_vector(TEST_WIDTH-1 downto 0) := "1001";
	signal y      : std_logic_vector(TEST_WIDTH-1 downto 0) := "0110";
    signal cin    : std_logic;
    signal s      : std_logic_vector(TEST_WIDTH-1 downto 0);
    signal cout   : std_logic;

begin  -- TB

       -- instantiate Ripple Carry Adder
    U_RC : entity work.adder(RIPPLE_CARRY)
        generic map (
            WIDTH => 4
		)
        port map (
            x         => x,
            y         => y,
            carry_in  => cin,     
            s         => s,
            carry_out => cout
	);


    --U_CL : entity work.adder(CARRY_LOOKAHEAD)
    --    generic map (
    --        WIDTH => 4
	--	)
    --    port map (
	--	      x         => x,
	--        y         => y,
	--        carry_in  => cin,     
    --        s         => s,
    --        carry_out => cout
	--);


    process
        
    begin
		
		cin <= '0';
		
		wait for 10 ns;
		
        report "Addition result     : " & integer'image(to_integer(unsigned(s)));
		
		cin <= '1';
		
		wait for 200 ns;
		
        report "Addition result     : " & integer'image(to_integer(unsigned(s)));

        wait;

    end process;

end TB;