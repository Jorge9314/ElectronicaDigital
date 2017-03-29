library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Rx is
    Port ( Divisor_Frecuencia : in  STD_LOGIC;
           Entrada : in  STD_LOGIC;
           Mensaje : out  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
           Confirmado : out  STD_LOGIC := '0');
end Rx;

architecture arq_Rx of Rx is

signal ParidadPAR : boolean := True;
-- Significa que el estado par es VERDADERO o que es PAR

signal estado : std_logic_vector(3 downto 0) := "0000";
-- El estado va a ser de la siguiente manera
-- "0000" o estado 0 significa el estado de IDLE hasta que llegue un '0'
-- "0001" o estado 1 significa que recibe el primer bit de información
-- "0010" o estado 2 significa que recibe el segundo bit de información
-- ................. significa que recibe los demas bits de información
-- "1011" o estado 11 significa que recibe el BIT DE PARIDAD PAR '0' para par y '1' para impar
-- "1100" o estado 12 significa que recibe el primer BIT DE FINALIZACION '1'
-- "1101" o estado 13 significa que recibe el segundo BIT DE FINALIZACION '1'
-- "0000" o estado 14 significa que vuelve a estar en IDLE hasta el proximo '0'

signal ConfirmadoAux : std_logic := '0';

begin
process begin
	wait until rising_edge(Divisor_Frecuencia);
	Confirmado <= '0';
	case(estado) is
		when "0000" =>
			if Entrada = '0' then
				ParidadPAR <= False;	-- En este caso decimos que si no hay 1s es PAR
				estado <= "0001";
			end if;
		when "0001" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(7) <= Entrada;
			estado <= "0010";
			
		when "0010" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(6) <= Entrada;
			estado <= "0011";
			
		when "0011" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(5) <= Entrada;
			estado <= "0100";
			
		when "0100" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(4) <= Entrada;
			estado <= "0101";
			
		when "0101" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(3) <= Entrada;
			estado <= "0111";
			
		when "0111" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(2) <= Entrada;
			estado <= "1000";
			
		when "1000" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(1) <= Entrada;
			estado <= "1001";
			
		when "1001" =>
			if Entrada = '1' then
				if not ParidadPAR then
					ParidadPAR <= True;	-- Es IMPAR
				else
					ParidadPAR <= False;	-- Es PAR
				end if;
			end if;
			Mensaje(0) <= Entrada;
			estado <= "1011";
			
		when "1011" =>
			if ParidadPAR then
				if Entrada = '1' then
					ConfirmadoAux <= '1';
				end if;
			else
				if Entrada = '0' then
					ConfirmadoAux <= '1';
				end if;
			end if;
			estado <= "1100";
			
		when "1100" =>
			-- Si el bit de parada es 1 se continua normal
			-- SI NO pasamos a un estado de error y no se confirma el mensaje
			if Entrada = '1' then
				estado <= "1101";
			else
				estado <= "1110"; -- Estado de error (No se envia el mensaje)
			end if;
		
		when "1101" =>
			if Entrada = '1' then
				if ConfirmadoAux = '1' then
					Confirmado <= '1';
				end if;
				estado <= "0000";
				ConfirmadoAux <= '0';
			else
				estado <= "0000";
				ConfirmadoAux <= '0';
			end if;
		
		when others =>
			estado <= "0000";
			ConfirmadoAux <= '0';
	end case;
	-- Si el mensaje se termino de recibir y esta correcto entoces
	-- Confirmado es verdadero y se le asigna el Valor a Mensaje
	-- y se confirma para que se pueda utilizar el mensaje
end process;
end arq_Rx;



