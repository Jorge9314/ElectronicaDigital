library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity div_frecuencia_motor is
    Port ( CLK : in  STD_LOGIC;
           b : out  STD_LOGIC);
end div_frecuencia_motor;

architecture Behavioral of div_frecuencia_motor is

signal contador : integer := 2500000;

begin
process begin
wait until rising_edge(CLK); 
b <= '0';
if contador < 2500000 then
	contador <= contador + 1;
end if;
if contador >= 2500000 then
	b <= '1';
	contador <= '0';
end if;
end process;
end Behavioral;

