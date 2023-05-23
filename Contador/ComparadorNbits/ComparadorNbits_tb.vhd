library IEEE;
use IEEE.std_logic_1164.all;


entity ComparadorNbits_tb is
end;

architecture ComparadorNbits_tb_arq of ComparadorNbits_tb is

	component ComparadorNbits is
		generic(
			N : natural	:= 10--Cantidad de bits
		);
		port(		--Aca defino las entradas y salidas
			Comp: in std_logic_vector(N-1 downto 0);	--Valor a comparar
			Valor: in std_logic_vector(N-1 downto 0):="1100100000";	--Valor a deseado
			Q_o: buffer std_logic
		);
	end component;
	
	
		constant N: natural:=10;
		constant UNO : std_logic_vector(N-1 downto 0) := (N-2 downto 0 => '0') & '1';
		constant CERO : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');


		signal Comp_tb: std_logic_vector(N-1 downto 0):="1000100000";
		signal Valor_tb: std_logic_vector(N-1 downto 0):="1100100000";
		signal Q_tb: std_logic;
		
begin


	
	Comp_tb <= "1100000000" after 500 ns,"1100110000" after 1000 ns,"1100100000" after 1800 ns;
	
	


	--Instanciacion de componente
	
	DUT: ComparadorNbits
		port map(
			Comp	=> Comp_tb,
			Valor => Valor_tb,
			Q_o => Q_tb
			
		);

end;