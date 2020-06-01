library ieee;
use ieee.std_logic_1164.ALL;

Entity sumaresta is
Port(a,b,cin : in std_logic;
	s,co,bo : out std_logic_vector(0 to 1));
attribute pin_numbers of sumaresta: entity is
"a:9 b:10 cin:11 " & "s(0):14 co(0):15 co(1):16 bo(0):17 bo(1):22 s(1):23";
end sumaresta;

architecture arq of sumaresta is
begin
--Medio Sumador
	s(0)<= a xor b;
	co(0)<= a and b;

--Sumador Completo
	s(1)<= a xor b xor cin;
	co(1)<= (cin and b) or (a and b) or (a and cin);
	
--Medio Restador
	--r(0)<= a xor b; mismo que s en sumador medio
	bo(0)<= not a and b;

--Restador Completo
	r(1)<= a xor b xor cin; mismo que s en sumador completo
	bo(1)<=(cin and b) or (not a and b) or (not a and cin);
end arq;

