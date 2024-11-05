LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all; 

ENTITY alu_4bit_tb IS
END alu_4bit_tb;
 
ARCHITECTURE behavior OF alu_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         F : IN  std_logic_vector(2 downto 0);
         Y : OUT  std_logic_vector(3 downto 0);
         C_B : OUT  std_logic
        );
    END COMPONENT;
    
	 --Inputs
signal A : std_logic_vector(3 downto 0) := "0010";
signal B : std_logic_vector(3 downto 0) := "1111";
signal F : std_logic_vector(2 downto 0) := (others => '1');
--Outputs
signal Y : std_logic_vector(3 downto 0);
signal C_B : std_logic;
-- No clocks detected in port list. Replace <clock> below with
-- appropriate port name
BEGIN
uut: ALU_4bit PORT MAP (
A => A,
B => B,
F => F,
Y => Y,
C_B => C_B
);
stim_proc_F: process
begin
F <= F + 1;
wait for 25 ns;
end process;
END;
