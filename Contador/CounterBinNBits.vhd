library IEEE;
use IEEE.std_logic_1164.all;

entity Contador is
	generic(
		N : natural := 7;
		MaxCount: std_logic_vector :="0010100"
	);
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Dv: in std_logic_vector (6 downto 0);
		Qv_o: buffer std_logic_vector (6 downto 0);
		Flag: buffer std_logic
	);
end;

architecture Contador_arq of Contador is

	signal ci_i,Yg,co_o: std_logic := '0';
	signal sum_in,suma,res: std_logic_vector(6 downto 0) := "0000000";
	constant UNO : std_logic_vector(N-1 downto 0) := (N-2 downto 0 => '0') & '1';
	
	signal c2,c3:std_logic; --Cables 1b
	signal c1:std_logic_vector(6 downto 0); --Cable 4b

	
	component SumNb is
		generic(
			N: natural := 7
		);
		port(
			a_i: in std_logic_vector(N-1 downto 0);
			b_i: in std_logic_vector(N-1 downto 0);
			ci_i: in std_logic;
			s_o: out std_logic_vector(N-1 downto 0);
			co_o: buffer std_logic
		);
	end component;
	

	

	
	component Registro is
		generic(
		
			N: natural := 7
	
		);
		port(		--Aca defino las entradas y salidas
			clk_i: in std_logic;
			rst_i: in std_logic;
			ena_i: in std_logic;
			D_i: in std_logic_vector(N-1 downto 0);
			Q_o: buffer std_logic_vector(N-1 downto 0)
		);
	end component;


	component ComparadorNbits is
		generic(
			N : natural	:= 7--Cantidad de bits
		);
		port(		--Aca defino las entradas y salidas
			Comp: in std_logic_vector(N-1 downto 0);	--Valor a comparar
			Valor: in std_logic_vector(N-1 downto 0);	--Valor a deseado
			Q_o: buffer std_logic
		);
	end component;
	
	component ffd is
        port(        --Aca defino las entradas y salidas
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            D_i: in std_logic;
            Q_o: buffer std_logic
        );
    end component;
	
	
	
	






begin
    Reg: Registro generic map (N) port map(clk_i,rst_i,ena_i,sum_in,suma);
	
	sumador: SumNb generic map (N) port map(suma,UNO,ci_i,res,co_o); 
	
	--flip_flop: ffd port map(clk_i,rst_i,ena_i,co_o,ci_i); 

	--Reg: Registro generic map (N) port map(clk_i,c2,ena_i,Qv_o,Dv);
	
	--sumador: SumNb generic map (N) port map(Dv,UNO,ci_i,suma,co_o); 
	
	Comparador: ComparadorNbits generic map (N) port map(res,Dv,c3); -- Este comparador lo pongo pq hs se resetea en la cuenta

	
	
	
	
	
	--GP: GenPulsos generic map (4,"0010",120,126) port map(clk_i,rst_i,Yg);
	
	--Dv <= suma;
	sum_in <= res;
    Qv_o <= res;
	--ci_i <= co_o;
	--c3 <= Qv_o(0) and not(Qv_o(1)) and not(Qv_o(2)) and not(Qv_o(3)) and not(Qv_o(4)) and not(Qv_o(5)) and Qv_o(6) and not(Qv_o(7)) and not(Qv_o(8)) and not(Qv_o(9)) and Qv_o(10) and Qv_o(11) and not(Qv_o(12)) and Qv_o(13) and not(Qv_o(14)) and Qv_o(15);
	Flag <= c3;
	
	process (clk_i, co_o)
        begin
            if co_o = '1' then
                ci_i <= '1';
            else
                ci_i <= '0';
            end if;
    end process;
	 
	
end;