library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity randtop is
    Port (
	 	clk_en: in std_logic;
	 	clk: in std_logic;
		load_seed: in std_logic;
		seed: in std_logic_vector(7 downto 0);
		rand_out: out std_logic_vector(7 downto 0)
	 );
end randtop;

architecture Behavioral of randtop is

component randgen
port
	(
		clk:	in std_logic;		-- main clock input
		cke:	in std_logic;		-- clock enable
		ld:		in std_logic;		-- load enable for seed
		seed:	in std_logic_vector(7 downto 0);		-- random number seed value
		rand:	out std_logic_vector(7 downto 0)		-- output for random number
	);
end component;

--signal one: std_logic;

begin

--one <= '1';

rg: randgen port map(clk=>clk, cke=>clk_en, ld=>load_seed, seed=>seed, rand=>rand_out);

end Behavioral;
