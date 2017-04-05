LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Reception_8bits IS
END TB_Reception_8bits;
 
ARCHITECTURE behavior OF TB_Reception_8bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reception_8bits
    PORT(
         Divisor_Frecuencia : IN  std_logic;
         Entrada : IN  std_logic;
         Mensaje : OUT  std_logic_vector(7 downto 0);
         Confirmado : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Divisor_Frecuencia : std_logic := '0';
   signal Entrada : std_logic := '0';

 	--Outputs
   signal Mensaje : std_logic_vector(7 downto 0);
   signal Confirmado : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Divisor_Frecuencia_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reception_8bits PORT MAP (
          Divisor_Frecuencia => Divisor_Frecuencia,
          Entrada => Entrada,
          Mensaje => Mensaje,
          Confirmado => Confirmado
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
		-- IDLE --
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE INICIO --
		Entrada <= '0';
      wait for 20 ns;
		-- BIT Numero 1 --		
		Entrada <= '1';
      wait for 20 ns;
		-- 2
		Entrada <= '1';
      wait for 20 ns;
		-- 3
		Entrada <= '1';
      wait for 20 ns;
		-- 4
		Entrada <= '1';
      wait for 20 ns;
		-- 5
		Entrada <= '1';
      wait for 20 ns;
		-- 6
		Entrada <= '1';
      wait for 20 ns;
		-- 7
		Entrada <= '1';
      wait for 20 ns;
		-- 8
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE PARIDAD --
		Entrada <= '0';
      wait for 20 ns;
		-- BIT DE FINALIZACION --
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE FINALIZACION --
		Entrada <= '1';
      wait for 20 ns;
		
				-- IDLE --
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE INICIO --
		Entrada <= '0';
      wait for 20 ns;
		-- BIT Numero 1 --		
		Entrada <= '0';
      wait for 20 ns;
		-- 2
		Entrada <= '1';
      wait for 20 ns;
		-- 3
		Entrada <= '0';
      wait for 20 ns;
		-- 4
		Entrada <= '1';
      wait for 20 ns;
		-- 5
		Entrada <= '0';
      wait for 20 ns;
		-- 6
		Entrada <= '1';
      wait for 20 ns;
		-- 7
		Entrada <= '0';
      wait for 20 ns;
		-- 8
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE PARIDAD --
		Entrada <= '0';
      wait for 20 ns;
		-- BIT DE FINALIZACION --
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE FINALIZACION --
		Entrada <= '1';
      wait for 20 ns;
		
		-- IDLE --
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE INICIO --
		Entrada <= '0';
      wait for 20 ns;
		-- BIT Numero 1 --		
		Entrada <= '1';
      wait for 20 ns;
		-- 2
		Entrada <= '1';
      wait for 20 ns;
		-- 3
		Entrada <= '1';
      wait for 20 ns;
		-- 4
		Entrada <= '1';
      wait for 20 ns;
		-- 5
		Entrada <= '1';
      wait for 20 ns;
		-- 6
		Entrada <= '1';
      wait for 20 ns;
		-- 7
		Entrada <= '1';
      wait for 20 ns;
		-- 8
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE PARIDAD --
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE FINALIZACION --
		Entrada <= '1';
      wait for 20 ns;
		-- BIT DE FINALIZACION --
		Entrada <= '1';
      wait for 20 ns;
		Entrada <= '1';
		wait;
   end process;
END;
