LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Utilidad_RS232 IS
END TB_Utilidad_RS232;

ARCHITECTURE behavior OF TB_Utilidad_RS232 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Utilidad_RS232
    PORT(
         clk : IN  std_logic;
         Recibo : IN  std_logic;
         Devuelvo : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Recibo : std_logic := '0';

 	--Outputs
   signal Devuelvo : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Utilidad_RS232 PORT MAP (
          clk => clk,
          Recibo => Recibo,
          Devuelvo => Devuelvo
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
