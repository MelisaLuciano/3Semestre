library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity operaciones is port(
	h : in std_logic_vector(1 downto 0);
	a,b : in std_logic_vector(1 downto 0);
	display : out std_logic_vector(5 downto 0);
	s : out std_logic_vector(3 downto 0)
);
--attribute pin_numbers of operaciones: entity is
--"h(1):1 h(0):2 a(1):3 a(0):4 b(1):5 b(0):6 s(3):23 s(2):22 s(1):21 s(0):20 display(5):19 display(4):18 display(3):17 display(2):16 display(1):15 display(0):14";
end operaciones;

architecture arq of operaciones is
begin
operacion: process(h,a,b)
variable Z: std_logic_vector(1 downto 0);
begin
if (h="00") then
	s(3)<='0';
	s(2)<=(a(1) and b(1)) or (a(1) and a(0) and b(0)) or (a(0) and b(1) and b(0));
	s(1)<=((not a(1)) and (not a(0)) and b(1)) or ((not a(1)) and b(1) and (not b(0))) or (a(1) and (not b(1)) and (not b(0))) or 
	(a(1) and (not a(0)) and (not b(1))) or ((not a(1)) and a(0) and (not b(1)) and b(0)) or (a(1) and a(0) and b(1) and b(0));
	s(0)<=((not a(0)) and b(0)) or (a(0) and (not b(0)));
elsif (h="01") then
	s(3) <= ((not a(1)) and b(1)) or ((not a(1)) and (not a(0)) and b(0)) or ((not a(0)) and b(1) and b(0));
    s(2) <= '0';
	s(1) <= (a(1) and (not b(1)) and (not b(0))) or (a(1) and a(0) and (not b(1))) or ((not a(1)) and b(1) and b(0)) or ((not a(1))
	and (not a(0)) and b(1));
	s(0) <= a(0) xor b(0);

elsif (h="10") then
	if (a > b) then
	Z := "10";
	elsif (a < b) then
	Z := "01";
	else Z := "11";
	end if;

		case Z is
 	    when "10" => display<= "111100";
		when "01" => display <= "100111";
		when "11" => display <= "100100";
        when others => display <= "000000";
	end case;

elsif (h="11") then
	s(3) <= a(1) and a(0) and b(1) and b(0);
	s(2) <= a(1) and b(1) and (not(a(0) and b(0)));
	s(1) <= (a(0) and b(1)) xor (a(1) and b(0));
	s(0) <= a(0) and b(0);	
			
end if;
end process operacion;
end arq;
