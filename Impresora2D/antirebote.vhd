library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity antirebote is
    Port ( CLK : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : out  STD_LOGIC);
end antirebote;

architecture Behavioral of antirebote is

signal cont : integer := 9999999; 

begin
process begin
wait until rising_edge(CLK); 
-- 10'000.000 -> reloj 50 Hz -> 200*(10**-3) / 20*(10**-9) = 10'000.000
	b <= '0';
	if (a = '0' and cont < 10000000) then
		cont <= cont + 1;
	end if;
	if (a = '1' and cont < 10000000) then
		cont <= cont + 1;
	end if;
	if (a = '1' and cont >= 10000000) then
		b <= '1';
		cont <= 0;
	end if;
end process;
end Behavioral;