library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Utilidad_RS232 is
    Port ( clk : in  STD_LOGIC;
			  Recibo : in  STD_LOGIC;
           Devuelvo : out  STD_LOGIC := '1');
end Utilidad_RS232;

architecture arq_Utilidad_RS232 of Utilidad_RS232 is
component RS232
	Port ( clk : in  STD_LOGIC;
				-- Trasmisor --
           Entrada_8bits : in  STD_LOGIC_VECTOR (7 downto 0);
           Activador_Envio_Mensaje : in  STD_LOGIC;
           Salida_1bit : out  STD_LOGIC;
				-- Receptor --
           Entrada_1bit : in  STD_LOGIC;
           Mensaje_8bits : out  STD_LOGIC_VECTOR (7 downto 0);
           Activador_Entrega_Mensaje : out  STD_LOGIC
	);
end component;

signal Activador : std_logic;
signal Mensaje_Recibido : std_logic_vector(7 downto 0) := "00000000";

begin
	RS232_1 : RS232
	Port map( clk => clk,
				-- Trasmisor --
           Entrada_8bits => Mensaje_Recibido,
           Activador_Envio_Mensaje => Activador,
           Salida_1bit => Devuelvo,
				-- Receptor --
           Entrada_1bit => Recibo,
           Mensaje_8bits => Mensaje_Recibido,
           Activador_Entrega_Mensaje => Activador
	);
end arq_Utilidad_RS232;

