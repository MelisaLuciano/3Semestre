library ieee;
use ieee.std_logic_1164.all ;
 entity ffsr is port (
 S,R,clk: in std_logic;
Q, Qn: inout std_logic);
 end ffsr;
 architecture a_ffsr of ffsr is
 begin
 process (clk, S, R)
 begin
 if (clk'event and clk = '1') then
 if (S ='0' and R ='1') then
 Q <= '0';
 Qn <= '1' ;
 elsif (S = '1' and R = '0') then
 Q <= '1';
 Qn <= '0';
 elsif (S = '0' and R = '0') then
 Q <= Q;
 Qn <= Qn;
 else
 Q <= '-';
 Qn <= '-';
 end if;
 end if;
 end process;
 end a_ffsr;