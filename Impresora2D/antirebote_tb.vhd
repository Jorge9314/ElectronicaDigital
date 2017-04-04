LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY antirebote_tb IS
END antirebote_tb;
 
ARCHITECTURE behavior OF antirebote_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirebote
    PORT(
         CLK : IN  std_logic;
         a : IN  std_logic;
         b : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal a : std_logic := '0';

 	--Outputs
   signal b : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirebote PORT MAP (
          CLK => CLK,
          a => a,
          b => b
        );

   -- Clock process definitions
   CLK_process : process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		a <= '0';
		wait for 100ms;
		a <= '1';
		wait for 100ms;
		a <= '0';
		wait for 10ms;
		a <= '1';
		wait for 50ms;
		a <= '0';
		wait for 60ms;
		a <= '1';
		wait for 50ms;
		a <= '0';
      wait;
   end process;

END;
