library IEEE;
use IEEE.std_logic_1164.all;


entity PWM_tb is
end;

architecture PWM_tb_arq of PWM_tb is

	component PWM is
	generic(
		N: natural:=7 
	);
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic;
		duty_i: in std_logic_vector (N-1 downto 0);
		ena_i: in std_logic;
		rst_i: in std_logic;
		
		pwm_o: buffer std_logic
		
	);
	end component;


		signal clk_tb: std_logic:='0';
		signal duty_tb: std_logic:='0';
		signal ena_tb: std_logic:='1';
		signal rst_tb: std_logic:='1';
		signal D_tb: std_logic_vector(6 downto 0):="101000";
		signal pwm_tb: std_logic_vector (6 downto 0);
		
		
begin


	
	rst_tb <= '0' after 100 ns,'1' after 6500 ns,'0' after 8500 ns;
	clk_tb <= not(clk_tb) after 10 ns;

	


	--Instanciacion de componente
	
	DUT: PWM
		port map(
			clk_i	=> clk_tb,
			duty_i	=> duty_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			pwm_o => pwm_tb
			
			
		);

end;

