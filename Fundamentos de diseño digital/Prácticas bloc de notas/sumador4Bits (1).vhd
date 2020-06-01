library ieee;
use ieee.std_logic_1164.all;

entity sumador4Bits is 
	port(
	--acarreoE: in std_logic_vector(0 to 3);
	acarreoE: in std_logic;
	A,B: in std_logic_vector(0 to 3);
	--acarreoS: out std_logic_vector(0 to 3);
	--acarreoES: inout std_logic_vector(1 to 3);
	acarreoS: out std_logic;
	suma: out std_logic_vector(0 to 3));
	attribute pin_numbers of sumador4Bits: entity is
    "A(0):2 A(1):3 A(2):4 A(3):5 B(0):6 B(1):7 B(2):8 B(3):9 acarreoE:10 suma(0):23 suma(1):22 suma(2):21 suma(3):20 acarreoS:19";
end sumador4Bits;

architecture sumas of sumador4Bits is
	signal acarreoES: std_logic_vector(1 to 3);
	attribute synthesis_off of acarreoES:signal is true;
	begin
	process(A,B,acarreoE,acarreoS,acarreoES)
    	--variable acarreoES: std_logic_vector(1 to 3);
		begin
		suma(0) <= A(0) xor (B(0) xor acarreoE);
		acarreoES(1) <= (B(0) and acarreoE) or (A(0) and(B(0) xor acarreoE));
		
		suma(1) <= A(1) xor (B(1) xor acarreoES(1));
		acarreoES(2) <= (B(1) and acarreoES(1)) or (A(1) and(B(1) xor acarreoES(1)));
		
		suma(2) <= A(2) xor (B(2) xor acarreoES(2));
		acarreoES(3) <= (B(2) and acarreoES(2)) or (A(2) and(B(2) xor acarreoES(2)));
		
		suma(3) <= A(3) xor (B(3) xor acarreoES(3));
		--acarreoES(4) := (B(3) and acarreoES(3)) or (A(3) and(B(3) xor acarreoE(3)));
		acarreoS <= (B(3) and acarreoES(3)) or (A(3) and(B(3) xor acarreoES(3)));
	end process;
	
end sumas;
