LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY rs232_tb IS
END rs232_tb;
 
ARCHITECTURE behavior OF rs232_tb IS 
 
 
    COMPONENT RS232
    PORT(
         clk : IN  std_logic;
         Entrada_8bits : IN  std_logic_vector(7 downto 0);
         Activador_Envio_Mensaje : IN  std_logic;
         Salida_1bit : OUT  std_logic;
         Entrada_1bit : IN  std_logic;
         Mensaje_8bits : OUT  std_logic_vector(7 downto 0);
         Activador_Entrega_Mensaje : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Entrada_8bits : std_logic_vector(7 downto 0) := (others => '0');
   signal Activador_Envio_Mensaje : std_logic := '0';
   signal Entrada_1bit : std_logic := '0';

 	--Outputs
   signal Salida_1bit : std_logic;
   signal Mensaje_8bits : std_logic_vector(7 downto 0);
   signal Activador_Entrega_Mensaje : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS232 PORT MAP (
          clk => clk,
          Entrada_8bits => Entrada_8bits,
          Activador_Envio_Mensaje => Activador_Envio_Mensaje,
          Salida_1bit => Salida_1bit,
          Entrada_1bit => Entrada_1bit,
          Mensaje_8bits => Mensaje_8bits,
          Activador_Entrega_Mensaje => Activador_Entrega_Mensaje
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

-------------------------------------------------------------
	-- Recibo un 11111111 con paridad 0
	-------------------------------------------------------------
		-- IDLE --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		
		-- BIT DE INICIO --
		Recibo <= '0';
      wait for 0.10416 ms;
		
		-- 8 BITS DE INFORMACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		
		-- BIT DE PARIDAD --
		Recibo <= '0';
      wait for 0.10416 ms;
		
		-- BIT DE PARADA --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		
	-------------------------------------------------------------
	-- Recibo un 01111110 con paridad 1			MALO!!!!!!
	-------------------------------------------------------------		
		-- IDLE --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		
		-- BIT DE INICIO --
		Recibo <= '0';
      wait for 0.10416 ms;
		
		-- 8 BITS DE INFORMACION --
		Recibo <= '0';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '0';
      wait for 0.10416 ms;
		
		-- BIT DE PARIDAD --
		Recibo <= '1';
      wait for 0.10416 ms;
		
		-- BIT DE PARADA --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		
	-------------------------------------------------------------
	-- Recibo un 10110110 con paridad 1
	-------------------------------------------------------------		
		-- IDLE --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		
		-- BIT DE INICIO --
		Recibo <= '0';
      wait for 0.10416 ms;
		
		-- 8 BITS DE INFORMACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '0';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '0';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '0';
      wait for 0.10416 ms;
		
		-- BIT DE PARIDAD --
		Recibo <= '1';
      wait for 0.10416 ms;
		
		-- BIT DE PARADA --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		wait;
   end process;

END;