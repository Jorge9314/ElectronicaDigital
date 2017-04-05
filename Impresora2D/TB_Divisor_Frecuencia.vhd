LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_Divisor_Frecuencia IS
END TB_Divisor_Frecuencia;
 
ARCHITECTURE behavior OF TB_Divisor_Frecuencia IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Divisor_Frecuencia
    PORT(
         clk : IN  std_logic;
         Salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal Salida : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Divisor_Frecuencia PORT MAP (
          clk => clk,
          Salida => Salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      wait;
   end process;

END;
