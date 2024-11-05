

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MOD_25 is
    Port ( rst : in  STD_LOGIC;
           pr : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           y_out : out  STD_LOGIC_VECTOR (4 downto 0));
end MOD_25;

architecture MOD_25_arch of MOD_25 is
signal Qtemp : STD_LOGIC_VECTOR(4 downto 0):="00000";
begin
  
	process(rst,pr,clk,dir)
begin 
	if rst='1' then 
		Qtemp<=(OTHERS=>'0');
	elsif pr='1' then 
		Qtemp<=(OTHERS=>'1');
	elsif falling_edge(clk) then 
		if dir = '0' then
						if Qtemp<24 then 
								Qtemp<=Qtemp+1;
						else
								Qtemp<="00000";
						end if;
		else 
						if Qtemp>7 then 
								Qtemp<= Qtemp-1;
						else 
								Qtemp<="11111";
						end if;
		end if;
		end if;
end process;
y_out<=Qtemp;
end MOD_25_arch; 

