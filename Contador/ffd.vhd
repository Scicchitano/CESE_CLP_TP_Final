library IEEE;
use IEEE.std_logic_1164.all;

entity ffd is
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		D_i: in std_logic;
		Q_o: buffer std_logic
	);
end;

architecture ffd_arq of ffd is

--Aca van las declaraciones o inclusiones de componentes

begin
	process(clk_i)
	begin
		if rising_edge(clk_i) then
			if rst_i='1' then
				Q_o <= '0';
			elsif ena_i='1' then
				Q_o <= D_i;
			end if;
		end if;
	end process;
	
end;