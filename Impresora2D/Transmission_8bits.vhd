library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Transmission_8bits is
    Port ( clk : in  STD_LOGIC;
			  Divisor_Frecuencia : in  STD_LOGIC;
           Entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Activador_Envio_Mensaje : in  STD_LOGIC;
           Salida : out  STD_LOGIC := '1');
end Transmission_8bits;

architecture arq_Transmission_8bits of Transmission_8bits is

signal ParidadPAR : boolean := True;
-- Significa que el estado par es VERDADERO o que es PAR

signal estado : std_logic_vector(3 downto 0) := "0000";

signal EntradaAUX : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin
process begin
	wait until rising_edge(clk);
	
	if Activador_Envio_Mensaje = '1' then
		if estado = "0000" then
			estado <= "0001";
			EntradaAUX <= Entrada;
		end if;
	end if;
	
	if Divisor_Frecuencia = '1' then
		case(estado) is
			when "0001" =>
				Salida <= '0';
				ParidadPAR <= False;	-- En este caso decimos que si no hay 1s es PAR
				estado <= "0010";

			when "0010" =>
				if EntradaAUX(7) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(7);
				estado <= "0011";
				
			when "0011" =>
				if EntradaAUX(6) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(6);
				estado <= "0100";
				
			when "0100" =>
				if EntradaAUX(5) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(5);
				estado <= "0101";
				
			when "0101" =>
				if EntradaAUX(4) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(4);
				estado <= "0110";
				
			when "0110" =>
				if EntradaAUX(3) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(3);
				estado <= "0111";
				
			when "0111" =>
				if EntradaAUX(2) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(2);
				estado <= "1000";
				
			when "1000" =>
				if EntradaAUX(1) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(1);
				estado <= "1001";
				
			when "1001" =>
				if EntradaAUX(0) = '1' then
					if not ParidadPAR then
						ParidadPAR <= True;	-- Es IMPAR
					else
						ParidadPAR <= False;	-- Es PAR
					end if;
				end if;
				Salida <= EntradaAUX(0);
				estado <= "1010";
				
			when "1010" =>
				if ParidadPAR then
					Salida <= '1';
				else
					Salida <= '0';
				end if;
				estado <= "1011";
				
			when "1011" =>
				Salida <= '1';
				estado <= "1100";
				
			when "1100" =>
				Salida <= '1';
				estado <= "0000";
				
			when others =>
				Salida <= '1';
				estado <= "0000";
		end case;
	end if;
end process;
end arq_Transmission_8bits;

