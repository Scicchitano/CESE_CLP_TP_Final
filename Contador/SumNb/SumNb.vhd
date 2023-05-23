library IEEE;
use IEEE.std_logic_1164.all;

entity SumNb is
	generic(
		N: natural := 10
	);
	port(
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		ci_i: in std_logic;
		s_o: out std_logic_vector(N-1 downto 0);
		co_o: buffer std_logic
	);

end;

architecture SumNb_arq of SumNb is

	-- Declaraciones / Inclusion de componentes
	component sum1b is
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			ci_i: in std_logic;
			s_o: out std_logic;
			co_o: out std_logic
		);
	end component;

	signal cy_a: std_logic_vector(N downto 0);

	
begin
	cy_a(0) <= ci_i;
	--s_o(0)<='0';
	--s_o(1)<='0';
	
	
	aaa: for i in 0 to N-1 generate
		
	
		sum1b_1: sum1b
			port map(
				a_i		=> a_i(i),
				b_i		=> b_i(i), 
				ci_i	=> cy_a(i),
				s_o		=> s_o(i),
				co_o	=> cy_a(i+1)
			);
	
	end generate;
	

	
end;
