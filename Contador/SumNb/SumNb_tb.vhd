library IEEE;
use IEEE.std_logic_1164.all;


entity SumNb_tb is
end;

architecture SumNb_tb_arq of SumNb_tb is

	

	component SumNb is
		generic(
			N: natural := 10
		);
		port(
			a_i: in std_logic_vector(N-1 downto 0);
			b_i: in std_logic_vector(N-1 downto 0);
			ci_i: in std_logic;
			s_o: out std_logic_vector(N-1 downto 0);
			co_o: out std_logic
		);
	end component;
	
		constant N: natural:=10;
		constant UNO : std_logic_vector(N-1 downto 0) := (N-2 downto 0 => '0') & '1';
		constant CERO : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');
		constant DOS : std_logic_vector(N-1 downto 0) := (N-3 downto 0 => '0') & '1' & '0';
		constant TRES : std_logic_vector(N-1 downto 0) := (N-3 downto 0 => '0') & '1' & '1';
		constant DOSOCHO : std_logic_vector(N-1 downto 0) := "0000011100";
		constant CUATROCERO : std_logic_vector(N-1 downto 0) := "0000101000";
		

		signal a_tb: std_logic_vector(N-1 downto 0):=CERO;
		signal b_tb: std_logic_vector(N-1 downto 0):=UNO;
		signal ci_tb: std_logic:='0';
		signal co_tb: std_logic;
		signal s_tb: std_logic_vector(N-1 downto 0);
		
		
	
		
		
begin


	
	a_tb <= UNO after 200 ns,DOS after 400 ns,TRES after 600 ns,DOSOCHO after 800 ns,CUATROCERO after 1000 ns;
	


	--Instanciacion de componente
	
	DUT: SumNb
		port map(
			a_i	=> a_tb,
			b_i => b_tb,
			ci_i => ci_tb,
			co_o => co_tb,
			s_o => s_tb
			
		);

end;