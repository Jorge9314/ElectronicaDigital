library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Divisor_Frecuencia is
    Port ( clk : in  STD_LOGIC;
           Salida : out  STD_LOGIC := '0');
end Divisor_Frecuencia;

architecture arq_Divisor_Frecuencia of Divisor_Frecuencia is

constant repeticion : integer := 5208;
shared variable contador : integer := repeticion;

begin
process begin
	wait until rising_edge(clk);
	Salida <= '0';
	if contador > 0 then
		contador := contador - 1;
	else
		Salida <= '1';
		contador := repeticion;
	end if;
end process;
end arq_Divisor_Frecuencia;