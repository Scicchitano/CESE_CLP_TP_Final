library IEEE;
use IEEE.std_logic_1164.all;


entity Contador_tb is
end;

architecture Contador_tb_arq of Contador_tb is

	component Contador is
        generic(
            N : natural := 7;
            DutyCycle: std_logic_vector :="0100101";
            MaxCycle: std_logic_vector :="1100100"
        );
        port(        --Aca defino las entradas y salidas
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            Qv_o: buffer std_logic_vector (6 downto 0);
            FlagDuty: buffer std_logic;
            FlagMax: buffer std_logic;
            pwm_o: buffer std_logic
        );
	end component;


		signal clk_tb: std_logic:='0';
		signal rst_tb: std_logic:='1';
		signal ena_tb: std_logic:='0';
		signal Qv_o_tb: std_logic_vector(6 downto 0):="0000000";
		signal FlagDuty_tb: std_logic:='0';
		signal FlagMax_tb: std_logic:='0';
		signal pwm_o_tb: std_logic:='0';
		
		
begin


	
	rst_tb <= '0' after 45 ns,'1' after 6500 ns,'0' after 8500 ns;
	ena_tb <= '1' after 95 ns;
	clk_tb <= not(clk_tb) after 10 ns;

	


	--Instanciacion de componente
	
	DUT: Contador
		port map(
			clk_i	=> clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			Qv_o => Qv_o_tb,
			FlagDuty => FlagDuty_tb,
			FlagMax => FlagMax_tb,
			pwm_o => pwm_o_tb
		);

end;
