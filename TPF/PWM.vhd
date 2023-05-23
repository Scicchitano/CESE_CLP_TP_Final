library IEEE;
use IEEE.std_logic_1164.all;

entity PWM is
	generic(
		N : natural := 7
	);
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		duty_i: in std_logic_vector (N-1 downto 0);
		ena_i: in std_logic;
		rst_i: in std_logic;
		
		pwm_o: buffer std_logic
	);
end;

architecture PWM_arq of PWM is

	signal pwm_cnt : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');
	constant UNO : std_logic_vector(N-1 downto 0) := (N-2 downto 0 => '0') & '1';
	constant CERO : std_logic_vector(N-1 downto 0) := (N-1 downto 0 => '0');
	signal ci_i,co_o,ena_f,rst_f: std_logic;
	signal res_f,Q_f: std_logic_vector(N-1 downto 0);
	
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


begin	
	sumador: SumNb generic map (N) port map(pwm_cnt,UNO,'0',res_f,co_o); 
	
	process (clk_i, rst_i,res_f,duty_i)
	begin
		if rising_edge(clk_i) then
			if rst_i = '1' then
			pwm_cnt <= CERO;--(others => '0');
			pwm_o <= '0';
			else
				if res_f < duty_i then
					pwm_o <= '1';
					--pwm_cnt <= pwm_cnt + 1;
				else
					pwm_cnt <= CERO;--(others => '0');
					pwm_o <= '0';
					
				end if;
			end if;
		end if;
		
		ci_i <= co_o;
	end process;
end;