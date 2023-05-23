library IEEE;
use IEEE.std_logic_1164.all;


entity Registro_tb is
end;

architecture Registro_tb_arq of Registro_tb is

	component Registro is
		generic(
		
		N: natural ;		-- N=4
	
	);
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		D_i: in std_logic_vector(2 downto 0,N-1 downto 0);
		Q_o: buffer std_logic_vector(2 downto 0,N-1 downto 0)
	);
	end component;


		signal clk_tb: std_logic:='0';
		signal rst_tb: std_logic:='1';
		signal ena_tb: std_logic:='1';
		signal D_i: std_logic:=("0000","0001","0100");
		
		
begin


	
	rst_tb <= '0' after 100 ns;
	clk_tb <= not(clk_tb) after 10 ns;
	D_i <= ("0000","0001","0110"); after 100 ns,("0110","0101","0101"); after 200 ns,("0010","0101","0000"); after 350 ns;
	


	--Instanciacion de componente
	
	DUT: Registro
		port map(
			clk_i	=> clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			D_i => D_tb,
			Q_o => Q_tb,
			
			
		);

end;