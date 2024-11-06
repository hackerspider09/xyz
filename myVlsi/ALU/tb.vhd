library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity alu_4bit_tb is
end alu_4bit_tb;

architecture Behavioral of alu_4bit_tb is
    signal A, B   : std_logic_vector(3 downto 0);  -- Input signals for testing
    signal F      : std_logic_vector(2 downto 0);  -- Function selector
    signal Y      : std_logic_vector(3 downto 0);  -- Output result
    signal C_B    : std_logic;                     -- Carry/borrow flag for arithmetic
begin
    -- Instantiate the ALU component
    uut: entity work.alu_4bit
        port map (A => A, B => B, F => F, Y => Y, C_B => C_B);

    -- Stimulus process to apply inputs and test the ALU operations
    stim_proc: process
    begin
        -- Test AND operation
        A <= "0010"; B <= "0001"; F <= "000"; wait for 10 ns;

        -- Test NAND operation
        A <= "0010"; B <= "0001"; F <= "001"; wait for 10 ns;

        -- Test OR operation
        A <= "0010"; B <= "0001"; F <= "010"; wait for 10 ns;

        -- Test XOR operation
        A <= "0010"; B <= "0001"; F <= "011"; wait for 10 ns;

        -- Test XNOR operation
        A <= "0010"; B <= "0001"; F <= "100"; wait for 10 ns;

        -- Test NOR operation
        A <= "0010"; B <= "0001"; F <= "101"; wait for 10 ns;

        -- Test Addition (A + B)
        A <= "0001"; B <= "0001"; F <= "110"; wait for 10 ns;

        -- Test Subtraction (A - B)
        A <= "0001"; B <= "1111"; F <= "111"; wait for 10 ns;

        -- End simulation
        --wait;
    end process;
end Behavioral;