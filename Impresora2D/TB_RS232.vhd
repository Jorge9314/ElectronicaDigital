LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_RS232 IS
END TB_RS232;
 
ARCHITECTURE behavior OF TB_RS232 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
	
	signal Div_Frec_AUX : STD_LOGIC;
	
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
		Entrada_8bits <= "00110011";
		Activador_Envio_Mensaje <= '0';
		Entrada_1bit <= '1';
      wait for 0.2 ms;
		
		Activador_Envio_Mensaje <= '1';
		wait for 0.10416 ms;
		Activador_Envio_Mensaje <= '0';
		
		-- IDLE --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 2
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 3
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 4
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 5
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 6
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 7
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 8
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;

	
		-- IDLE --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- 2
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 3
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- 4
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 5
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- 6
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 7
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- 8
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		
		-- IDLE --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 2
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 3
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 4
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 5
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 6
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 7
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- 8
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		Entrada_1bit <= '0';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Entrada_1bit <= '1';
      wait for 0.10416 ms;
		Entrada_1bit <= '1';
		
		
		
		wait for 10 ms;
		Entrada_1bit <= '0';
		wait for 2 ms;
		Entrada_1bit <= '1';
		wait;
   end process;
END;
