LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Transmission_8bits IS
END TB_Transmission_8bits;
 
ARCHITECTURE behavior OF TB_Transmission_8bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Transmission_8bits
    PORT(
         Divisor_Frecuencia : IN  std_logic;
         Entrada : IN  std_logic_vector(7 downto 0);
         Activo : IN  std_logic;
         Salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Divisor_Frecuencia : std_logic := '0';
   signal Entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal Activo : std_logic := '0';

 	--Outputs
   signal Salida : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Divisor_Frecuencia_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Transmission_8bits PORT MAP (
          Divisor_Frecuencia => Divisor_Frecuencia,
          Entrada => Entrada,
          Activo => Activo,
          Salida => Salida
        );

   -- Clock process definitions
   Divisor_Frecuencia_process :process
   begin
		Divisor_Frecuencia <= '0';
		wait for Divisor_Frecuencia_period/2;
		Divisor_Frecuencia <= '1';
		wait for Divisor_Frecuencia_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		Entrada <= "11111111";
		-- IDLE --
		Activo <= '1';
      wait for 20 ns;
		Activo <= '0';
		wait for 300 ns;
		
		Entrada <= "01010101";
		Activo <= '1';
      wait for 20 ns;
		Activo <= '0';
		wait for 300 ns;
		
		Entrada <= "10010001";
		Activo <= '1';
      wait for 20 ns;
		Activo <= '0';
		wait for 300 ns;
		
   end process;

END;
