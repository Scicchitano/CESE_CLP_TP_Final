library IEEE;
use IEEE.std_logic_1164.all;


entity FFDNBits_tb is
end;

architecture FFDNBits_tb_arq of FFDNBits_tb is

	component FFDNBits is
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
	end component;

		--constant CERO : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');
		signal clk_tb: std_logic:='0';
		signal rst_tb: std_logic:='1';
		signal ena_tb: std_logic:='1';
		signal D_tb: std_logic_vector(3 downto 0):="0000";
		signal Q_tb: std_logic_vector(3 downto 0);
		
begin


	
	rst_tb <= '0' after 100 ns;
	clk_tb <= not(clk_tb) after 10 ns;
	D_tb <= "0001" after 100 ns,"0011" after 200 ns,"1001" after 350 ns;
	


	--Instanciacion de componente
	
	DUT: FFDNBits
		port map(
			clk_i	=> clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			D_i => D_tb,
			Q_o => Q_tb
			
			
		);

end;