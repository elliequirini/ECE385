library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


package rand is

component randGen	-- loadable LFSR random number generator
	port
	(
		clk:	in std_logic;		-- main clock input
		cke:	in std_logic;		-- clock enable
		ld:		in std_logic;		-- load enable for seed
		seed:	in std_logic_vector(7 downto 0);		-- random number seed value
		rand:	out std_logic_vector(7 downto 0)		-- output for random number
	);
end component;

end package rand;


-- loadable LFSR random number generator
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity randGen is
	port
	(
		clk:	in std_logic;		-- main clock input
		cke:	in std_logic;		-- clock enable
		ld:		in std_logic;		-- load enable for seed
		seed:	in std_logic_vector(7 downto 0);		-- random number seed value
		rand:	out std_logic_vector(7 downto 0)		-- output for random number
	);
end randGen;

architecture arch of randGen is
	signal r : std_logic_vector(7 downto 0);	-- random number shift register
	signal new_bit : std_logic;		-- feedback bit into LSb of LFSR
begin
	-- use the length parameter to select the bits in the shift register
	-- which will be XOR'ed to compute the bit fed back into the 
	-- least significant bit of the shift register
	new_bit <= 	r(7)  xor r(5)  xor r(4)  xor r(3);

	update_shift_register:
	process(clk)
	begin
		if clk'EVENT and clk='1' then	-- update register on rising clock edge
			if cke = '0' then	-- reload current value if clock disabled
				r <= r;
			elsif ld='1' then	-- load with seed value
				r <= seed;
				--r <= (others=>'1');
			else						-- otherwise, shift register left and append feedback bit
				r <= r(6 downto 0) & new_bit;
			end if;
		end if;
	end process;

	rand <= r;	-- output the random number in the shift register

end arch;
