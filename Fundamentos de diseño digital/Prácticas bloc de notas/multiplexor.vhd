library ieee;
use ieee.std_logic_1164.all;

entity multiplexor is
	port(
	sel: in std_logic_vector(1 to 2);
	e: in std_logic_vector(1 to 4);
	h: in std_logic;
	salida: out std_logic
	);
	attribute pin_numbers of multiplexor: entity is
	"sel(1):2 sel(2):3 e(1):11 e(2):10 e(3):9 e(4):8 h:5 salida:23";
end multiplexor;

architecture mux of multiplexor is 
	signal aux: std_logic_vector(0 to 3);
	attribute synthesis_off of aux:signal is true;
	begin
	aux(0)<= e(1) and ((not sel(1)) and ((not sel(2)) and (not h)));
	aux(1)<= e(2) and (sel(1) and ((not sel(2)) and (not h)));
	aux(2)<= e(3) and ((not sel(1)) and (sel(2) and (not h)));
	aux(3)<= e(4) and (sel(1) and (sel(2) and (not h)));
	salida<= aux(0) or (aux(1) or (aux(2) or aux(3)));


end mux;
