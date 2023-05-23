library IEEE;
use IEEE.std_logic_1164.all;


entity TripleCounterBCD_tb is
end;

architecture TripleCounterBCD_tb_arq of TripleCounterBCD_tb is

	component TripleCounterBCD is
		port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Y1: buffer std_logic_vector (3 downto 0); --3 salidas de 4 bits
		Y2: buffer std_logic_vector (3 downto 0);
		Y3: buffer std_logic_vector (3 downto 0)
		
	);
	end component;


		signal clk_tb: std_logic:='0';
		signal ena_tb: std_logic:='1';
		signal rst_tb: std_logic:='1';
		signal Y1_tb: std_logic_vector (3 downto 0);
		signal Y2_tb: std_logic_vector (3 downto 0);
		signal Y3_tb: std_logic_vector (3 downto 0);
		
		
begin


	
	rst_tb <= '0' after 100 ns,'1' after 6500 ns,'0' after 8500 ns;
	clk_tb <= not(clk_tb) after 10 ns;

	


	--Instanciacion de componente
	
	DUT: TripleCounterBCD
		port map(
			clk_i	=> clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			Y1 => Y1_tb,
			Y2 => Y2_tb,
			Y3 => Y3_tb
			
			
		);

end;