library IEEE;
use IEEE.std_logic_1164.all;

entity Contador_VIO is
	port(		--Aca defino las entradas y salidas
		clk_i: in std_logic
	);
end;

architecture Contador_VIO_arq of Contador_VIO is


    component Contador is
        generic(
            N : natural := 7;
            DutyCycle: std_logic_vector :="0100101";
            MaxCycle: std_logic_vector :="0100100" 
        );
        port(		--Aca defino las entradas y salidas
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            Qv_o: buffer std_logic_vector (6 downto 0);
            FlagDuty: buffer std_logic;
            FlagMax: buffer std_logic;
            pwm_o: buffer std_logic
        );
    end component;
    
    COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    END COMPONENT;

    signal N_probe: natural;
    signal clk_i_probe, rst_i_probe, ena_i_probe, FlagDuty_probe, FlagMax_probe, pwm_o_probe : std_logic;
	signal Qv_o_probe: std_logic_vector(6 downto 0);
	signal pwm_o_vector, out_VIO: std_logic_vector(0 downto 0);


begin
    
    Count_inst: Contador
        port map(
            rst_i => rst_i_probe,
            clk_i => clk_i_probe,
            ena_i => ena_i_probe,
            Qv_o => Qv_o_probe,
            FlagDuty => FlagDuty_probe,
            FlagMax  => FlagMax_probe,
            pwm_o  => pwm_o_probe
        );
        
        pwm_o_vector <= (0 => pwm_o_probe);
        --out_VIO <= (0 => ena_i_probe);
        
      your_instance_name : vio_0
          PORT MAP (
            clk => clk_i,
            probe_in0 => pwm_o_vector
          );
	 
	
end;