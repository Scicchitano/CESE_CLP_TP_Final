library IEEE;
use IEEE.std_logic_1164.all;

entity ComparadorNbits is
	generic(
		N : natural	:= 7--Cantidad de bits
	);
	port(		--Aca defino las entradas y salidas
		Comp: in std_logic_vector(N-1 downto 0);	--Valor a comparar
		Valor: in std_logic_vector(N-1 downto 0):="0100100";	--Valor a deseado
		Q_o: buffer std_logic
	);
end;

architecture ComparadorNbits_arq of ComparadorNbits is

--Aca van las declaraciones o inclusiones de componentes
	
	signal aux: std_logic_vector(N downto 0);
	
	

begin
	aux(0) <= '1';
	flag: for i in 0 to N-1 generate
		
			aux(i+1) <= not(Comp(i) xor Valor(i)) and aux(i);
		
	end generate;
	
	Q_o <= aux(N);
end;















