library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Reception_8bits is
    Port ( clk : in  STD_LOGIC;
			  Divisor_Frecuencia : in  STD_LOGIC;
           Entrada : in  STD_LOGIC;
           Mensaje : out  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
			  
			  --Prueba : out  STD_LOGIC;
			  
           Confirmado : out  STD_LOGIC := '0'
			  );
end Reception_8bits;

architecture arq_Reception_8bits of Reception_8bits is

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

signal Warning : std_logic_vector(1 downto 0) := "00";
-- Donde 00 significa que el funcionamiento es normal
-- Donde 01 significa que el funcionamiento es normal pero se recibio un 0
-- Donde 10 significa que se pudo haber perdido la conexión
-- Donde 11 significa que se perdio la conexión

signal Mensaje_RecibidoAUX : std_logic_Vector(7 downto 0);

begin
process begin
	wait until rising_edge(clk);
	if Divisor_Frecuencia = '1' then
		Confirmado <= '0';
		if Warning /= "11" then
			case(estado) is
				when "0000" =>
					if Entrada = '0' then
						ParidadPAR <= True;	-- En este caso decimos que si no hay 1s es PAR
						estado <= "0001";
						if Warning = "00" then
							Warning <= "01";
						end if;
						--Prueba <= '1';
					end if;
					
				when "0001" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(0) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(0) <= '0';
					end if;
					
					estado <= "0010";
					--Prueba <= '0';
					
				when "0010" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(1) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(1) <= '0';
					end if;
					
					estado <= "0011";
					--Prueba <= '1';
					
				when "0011" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(2) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(2) <= '0';
					end if;
					
					estado <= "0100";
					--Prueba <= '0';
					
				when "0100" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(3) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(3) <= '0';
					end if;
					
					estado <= "0101";
					--Prueba <= '1';
					
				when "0101" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(4) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(4) <= '0';
					end if;
					
					estado <= "0111";
					--Prueba <= '0';
					
				when "0111" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(5) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(5) <= '0';
					end if;
					
					estado <= "1000";
					--Prueba <= '1';
					
				when "1000" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(6) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(6) <= '0';
					end if;
					
					estado <= "1001";
					--Prueba <= '0';
					
				when "1001" =>
					if Entrada = '1' then
						Mensaje_RecibidoAUX(7) <= '1';
						if not ParidadPAR then
							ParidadPAR <= True;	-- Es IMPAR
						else
							ParidadPAR <= False;	-- Es PAR
						end if;
					else
						Mensaje_RecibidoAUX(7) <= '0';
					end if;
					
					estado <= "1011";
					--Prueba <= '1';
					
				when "1011" =>
					if ParidadPAR then
						if Entrada = '0' then
							ConfirmadoAux <= '1';
						else
							ConfirmadoAux <= '0';
						end if;
					else
						if Entrada = '1' then
							ConfirmadoAux <= '1';
						else
							ConfirmadoAux <= '0';
						end if;
					end if;
					estado <= "1100";
					--Prueba <= '0';
					
				when "1100" =>
					-- Si el bit de parada es 1 se continua normal
					-- SI NO pasamos a un estado de error y no se confirma el mensaje
					if Entrada = '1' then
						Warning <= "00";
						estado <= "1101";
					else
						estado <= "1110"; -- Estado de error (No se envia el mensaje)
						if Warning = "01" then
							Warning <= "10";
						end if;
					end if;
					--Prueba <= '1';
				
				when "1101" =>
					if Entrada = '1' then
						if ConfirmadoAux = '1' then
							Mensaje <= Mensaje_RecibidoAUX;
							Confirmado <= '1';
						else
							Confirmado <= '0';
						end if;
						estado <= "0000";
						ConfirmadoAux <= '0';
					else
						estado <= "0000";
						ConfirmadoAux <= '0';
					end if;
					--Prueba <= '0';
				
				when others =>
					estado <= "0000";
					ConfirmadoAux <= '0';
					if Warning = "10" then
						Warning <= "11";
					end if;
					--Prueba <= '0';
			end case;
			-- Si el mensaje se termino de recibir y esta correcto entoces
			-- Confirmado es verdadero y se le asigna el Valor a Mensaje
			-- y se confirma para que se pueda utilizar el mensaje
		else
			if Entrada = '1' then
				Warning <= "00";
			end if;
		end if;
	end if;
end process;
end arq_Reception_8bits;