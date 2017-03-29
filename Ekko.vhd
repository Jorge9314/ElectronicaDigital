library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ekko is
    Port ( Recibo : in  STD_LOGIC;
           Devuelvo : out  STD_LOGIC;
           CLK : in  STD_LOGIC);
end Ekko;

architecture arq_Ekko of Ekko is
component RS232
	Port (
				CLK : in std_logic;
				-- Transmision
				Entrada_8bits : in std_logic_vector (7 downto 0);
				Activador_Envio_Mensaje : in std_logic;
				Salida_1bit : out std_logic;
				-- Recepcion 
				Entrada_1bit : in std_logic;
				Activador_Entrega_Mensaje : out std_logic;
				Mensaje_8bits : out std_logic_vector (7 downto 0) := "00000000"
			);
end component;
signal comoustedquiera : std_logic_vector (7 downto 0) := "00000000";
signal comoustedquiera1 : std_logic;

begin
	RS232_1 : RS232 
	port map( 
		CLK => CLK,
		-- Transmision
		Entrada_8bits => comoustedquiera,
		Actiador_Envio_Mensaje => comoustedquiera1,
		Salida_1bit => Devuelvo,
		-- Recepcion
		Entrada_1bit => Recibo,
		Activador_Entrega_Mensaje => comoustedquiera1,
		Mensaje_8bits => comoustedquiera
	);


end arq_Ekko;

