library IEEE;
use IEEE.std_logic_1164.all;



entity TripleCounterBCD is

	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Y1: buffer std_logic_vector (3 downto 0); --3 salidas de 4 bits
		Y2: buffer std_logic_vector (3 downto 0);
		Y3: buffer std_logic_vector (3 downto 0)
		
	);
end;

architecture TripleCounterBCD_arq of TripleCounterBCD is
	
	signal D1,D2,D3 : std_logic_vector(3 downto 0);
	signal Flag1,Flag2,Flag3,clk1,clk2 : std_logic;
	
	component CounterBCD is
		port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Qv_o: buffer std_logic_vector (3 downto 0);
		Flag: buffer std_logic
		
	);
	end component;
	
	





begin
	-- Vcc= D1.D2D3
	CBCD0: CounterBCD port map(clk_i,rst_i,ena_i,Y3,Flag1);
	CBCD1: CounterBCD port map(clk1,rst_i,ena_i,Y2,Flag2);
	CBCD2: CounterBCD port map(clk2,rst_i,ena_i,Y1,Flag3);
	clk1 <= Flag1 or rst_i;
	clk2 <= Flag2 or rst_i;
	
	 
end;