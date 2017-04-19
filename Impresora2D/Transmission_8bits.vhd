library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Transmission_8bits is
    Port ( Divisor_Frecuencia : in  STD_LOGIC;
           Entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Activo : in  STD_LOGIC;
           Salida : out  STD_LOGIC := '1');
end Transmission_8bits;

architecture arq_Transmission_8bits of Transmission_8bits is

signal ParidadPAR : boolean := True;
-- Significa que el estado par es VERDADERO o que es PAR

signal estado : std_logic_vector(3 downto 0) := "0000";
-- El estado va a ser de la siguiente manera
-- "0000" o estado 0 significa el estado de IDLE hasta que Activo sea 1
-- Si Activo es 1 se envia el BIT DE INICIO ('0')
-- "0001" o estado 1 significa que envia el primer bit de información
-- "0010" o estado 2 significa que envia el segundo bit de información
-- ................. significa que envia los demas bits de información
-- "1011" o estado 11 significa que envia el BIT DE PARIDAD PAR '0' para par y '1' para impar
-- "1100" o estado 12 significa que envia el primer BIT DE FINALIZACION '1'
-- "1101" o estado 13 significa que envia el segundo BIT DE FINALIZACION '1'
-- "0000" o estado 14 significa que vuelve a estar en IDLE hasta que
-- El proximo activo sea igual a '1'

begin
process begin
	wait until rising_edge(Divisor_Frecuencia);
	case(estado) is
		when "0000" =>
			if Activo = '1' then
				Salida <= '0';
				ParidadPAR <= False;	-- En este caso decimos que si no hay 1s es PAR
				estado <= "0001";
			end if;
		when "0001" =>
			if Entrada(7) = '1' then
					ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(7);
			estado <= "0010";
			
		when "0010" =>
			if Entrada(6) = '1' then
					ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(6);
			estado <= "0011";
			
		when "0011" =>
			if Entrada(5) = '1' then
					ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(5);
			estado <= "0100";
			
		when "0100" =>
			if Entrada(4) = '1' then
					ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(4);
			estado <= "0101";
			
		when "0101" =>
			if Entrada(3) = '1' then
				ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(3);
			estado <= "0111";
			
		when "0111" =>
			if Entrada(2) = '1' then
				ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(2);
			estado <= "1000";
			
		when "1000" =>
			if Entrada(1) = '1' then
				ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(1);
			estado <= "1001";
			
		when "1001" =>
			if Entrada(0) = '1' then
				ParidadPAR <= not ParidadPar;	-- Es IMPAR
			end if;
			Salida <= Entrada(0);
			estado <= "1011";
			
		when "1011" =>
			if ParidadPAR then
				Salida <= '1';
			else
				Salida <= '0';
			end if;
			estado <= "1100";
			
		when "1100" =>
			Salida <= '1';
			estado <= "1101";
		when others =>
			Salida <= '1';
			estado <= "0000";
	end case;
end process;
end arq_Transmission_8bits;

