library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- gives dt like logic,vector
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- perform arithmetic operations 
use IEEE.NUMERIC_STD.all;   -- use for arith on unsigned and signed 

entity alu_4bit is
    port (
        A, B   : in  std_logic_vector(3 downto 0);  -- 4-bit inputs
        F      : in  std_logic_vector(2 downto 0);  -- Operation selector (3-bit)
        Y      : out std_logic_vector(3 downto 0);  -- 4-bit output result
        C_B    : out std_logic                     -- Carry/Borrow for arithmetic
    );
end alu_4bit;

architecture Behavioral of alu_4bit is
    signal result : std_logic_vector(4 downto 0) := "00000";  -- Intermediate result to handle carry
begin
    process(A, B, F)
    begin
	 -- 0 & before var is cancating single bit binary sting 0 to input
	 -- new signal will have  prefix '0' or '1'
	 -- a and b are 4 bit and result is 5 bit so we add 1 bit at start
        case F is
            when "000" => 
                result <= '0' & (A AND B);           -- AND operation
            when "001" =>
                result <= '0' & (A NAND B);          -- NAND operation
            when "010" => 
                result <= '0' & (A OR B);            -- OR operation
            when "011" =>
                result <= '0' & (A XOR B);           -- XOR operation
            when "100" => 
                result <= '0' & (A XNOR B);          -- XNOR operation
            when "101" =>
                result <= '0' & (A NOR B);           -- NOR operation
            when "110" =>
--                result <= ('0' & A) + ('0' & B);     -- Addition
						result <= '0' & (A + B);
            when others=>
				if(A<B) then
					-- 1st do b-a calculation and then add 5th bit to recognise -ve number
					result<='1' & (B-A);
				else
					result<= ('0'&A) -('0'& B);
				end if;
        end case;
		end process;
        Y <= result(3 downto 0);        -- Assign the lower 4 bits to the output result
        C_B <= result(4);               -- Assign the 5th bit (carry/borrow)
    
end Behavioral;