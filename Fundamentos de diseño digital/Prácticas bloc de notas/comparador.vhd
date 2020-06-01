library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith;

-- +-=<>
entity comparador is
	port(
	a: in std_logic_vector(0 to 3);
	b: in std_logic_vector(0 to 3);
	salida: out std_logic_vector(6 downto 0)
	);
end comparador;

architecture compara of comparador is
	begin
	process(a,b,salida)
		begin
		if(a(0)>b(0))then
			salida<="0000111";
		elsif(a(0)<b(0))then
			salida<="0110001";
		elsif(a(0)=b(0))then
			if(a(1)>b(1))then
				salida<="0000111";
			elsif(a(1)<b(1))then
				salida<="0110001";
			elsif(a(1)=b(1))then
				if(a(2)>b(2))then
					salida<="0000111";
				elsif(a(2)<b(2))then
					salida<="0110001";
				elsif(a(2)=b(2))then
					if(a(3)>b(3))then
						salida<="0000111";
					elsif(a(3)<b(3))then 
						salida<="0110001";
					elsif(a(3)=b(3))then
						salida<="0110111";
					end if;
				end if;
			end if;
		end if;
	end process;
end compara;
