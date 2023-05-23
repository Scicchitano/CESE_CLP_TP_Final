library IEEE;
use IEEE.std_logic_1164.all;

entity FFDNBits is
	generic(
		N: natural:=4  
	);
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		D_i: in std_logic_vector(N-1 downto 0);
		Q_o: buffer std_logic_vector(N-1 downto 0)
	);
end;

architecture FFDNBits_arq of FFDNBits is

--Aca van las declaraciones o inclusiones de componentes
	constant CERO : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');

begin
	process(clk_i)
	begin
		if rising_edge(clk_i) then
			if rst_i='1' then
				Q_o <= CERO;
			elsif ena_i='1' then
				Q_o <= D_i;
			end if;
		end if;
	end process;
	
end;