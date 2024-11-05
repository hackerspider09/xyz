
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity alu_4bit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           F : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           C_B : out  STD_LOGIC);
end alu_4bit;

architecture Behavioral of alu_4bit is

signal result:STD_LOGIC_VECTOR(4 downto 0):="00000";
begin
process(A,B,F)
begin
CASE F IS
when "000" =>
result <= '0' & (A AND B);
when "001" =>
result <= '0' & (A NAND B);
when "010" =>
result <= '0' & (A OR B);
when "011" =>
result <= '0' & (A XOR B);
when "100" =>
result <= '0' & (A XNOR B);
when "101" =>
result <= '0' & (A NOR B);
when "110" =>
result <= ('0' & A)+('0' & B);
when others =>
if A < B then
result <= '0' & (NOT B);
result <= result+1;
result <= ('0' & A) + result;
result <= (NOT result) +1;
result <= (NOT(('0' & A) + ('0' &(NOT B)) + 1))+1;
else
result <=('0' & A)-('0' & B);
end if ;
end CASE;
end process;
Y <= result(3 downto 0);
C_B <= result(4);

end Behavioral;
