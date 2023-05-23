library IEEE;
use IEEE.std_logic_1164.all;

entity VGA is
	generic(
		N : natural := 10;
	);
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		red_i: in std_logic;
		grn_i: in std_logic;
		blu_i: in std_logic;
		
		red_o: buffer std_logic;
		grn_o: buffer std_logic;
		blu_o: buffer std_logic;
		hs: buffer std_logic;
		vs: buffer std_logic;
		pixel_x: buffer std_logic;
		pixel_y: buffer std_logic
	);
end;

architecture VGA_arq of VGA is

	constant CERO : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');
	signal ci_i,co_o,ena_f,rst_f: std_logic;
	signal D_f,Q_f: std_logic_vector(N-1 downto 0);
	
	constant UNO : std_logic_vector(N-1 downto 0) := (N-2 downto 0 => '0') & '1';
	
	component Registro is
		generic(
		
			N: natural
	
		);
		port(		--Aca defino las entradas y salidas
			clk_i: in std_logic;
			rst_i: in std_logic;
			ena_i: in std_logic;
			D_i: in std_logic_vector(N-1 downto 0);
			Q_o: buffer std_logic_vector(N-1 downto 0)
		);
	end component;
	
	
	
	
	component SumNb is
		generic(
			N: natural
		);
		port(
			a_i: in std_logic_vector(N-1 downto 0);
			b_i: in std_logic_vector(N-1 downto 0);
			ci_i: in std_logic;
			s_o: out std_logic_vector(N-1 downto 0);
			co_o: out std_logic
		);
	end component;
	
	
	
	component ComparadorNbits is
		generic(
			N : natural	--Cantidad de bits
		);
		port(		--Aca defino las entradas y salidas
			Comp: in std_logic_vector(N-1 downto 0);	--Valor a comparar
			Valor: in std_logic_vector(N-1 downto 0);	--Valor a deseado
			Q_o: buffer std_logic
		);
	end component;
	

	-- hs y vs son contadores de BCD asi que podria declarar aca directamente CounterBCD.vhd




begin
	Reg: Registro generic map (N) port map(clk_i,rst_f,'1',D_f,Q_f);
	
	
	sumador: SumNb generic map (N) port map(Q_f,UNO,'0',D_f,co_o); 
	
	
	comparador: ComparadorNbits generic map (N) port map(Q_f,MaxCount,QC); 
	
	
	--comparador2: ComparadorNbits generic map (N) port map(Q_f2,P_F,QC2); 
	
	
	--Y <= QC and not(QC2)
	
	ci_i <= co_o;
	rst_f <= rst_i or Y;
end;