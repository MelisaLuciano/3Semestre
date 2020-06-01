library ieee;
use ieee.std_logic_1164.all;

entity restador4Bits is 
	port(
	modo: in std_logic;
	A,B: in std_logic_vector(0 to 3);
	acarreoS: out std_logic;
	diferencia: out std_logic_vector(0 to 3));
	attribute pin_numbers of restador4Bits: entity is
    "A(0):2 A(1):3 A(2):4 A(3):5 B(0):6 B(1):7 B(2):8 B(3):9 modo:10 diferencia(0):23 diferencia(1):22 diferencia(2):21 diferencia(3):20 acarreoS:19";
end restador4Bits;

architecture restas of restador4Bits is
	signal acarreoES: std_logic_vector(1 to 3);
	attribute synthesis_off of acarreoES:signal is true;
	begin
	process(A,B,modo,acarreoS,acarreoES)
    	--variable acarreoES: std_logic_vector(1 to 3);
		begin
		diferencia(0) <= A(0) xor ((B(0) xor modo) xor modo);
		acarreoES(1) <= ((B(0) xor modo) and modo) or (A(0) and((B(0) xor modo) xor modo));
		diferencia(1) <= A(1) xor ((B(1) xor modo) xor acarreoES(1));
		acarreoES(2) <= ((B(1) xor modo) and acarreoES(1)) or (A(1) and((B(1) xor modo) xor acarreoES(1)));
		diferencia(2) <= A(2) xor ((B(2) xor modo) xor acarreoES(2));
		acarreoES(3) <= ((B(2) xor modo) and acarreoES(2)) or (A(2) and((B(2) xor modo) xor acarreoES(2)));
		diferencia(3) <= A(3) xor ((B(3) xor modo) xor acarreoES(3));
		acarreoS <= ((B(3) xor modo) and acarreoES(3)) or (A(3) and((B(3) xor modo) xor acarreoES(3)));
	end process;
	
end restas;

