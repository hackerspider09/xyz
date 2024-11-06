library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod25_up_down_counter is
    Port (
        clk     : in  STD_LOGIC;         -- Clock input
        reset   : in  STD_LOGIC;         -- Asynchronous reset
		  prst :  in STD_LOGIC;
        up_down : in  STD_LOGIC;         -- Counting direction: 1 for up, 0 for down
        count   : out STD_LOGIC_VECTOR(4 downto 0)  -- 5-bit output for counting 0-24
    );
end mod25_up_down_counter;

architecture Behavioral of mod25_up_down_counter is
    signal counter: STD_LOGIC_VECTOR(4 downto 0) := "00000";
begin
    process(clk, reset,prst,up_down)
    begin
        if reset = '1' then
            counter <= (others => '0');  -- Reset the counter to 0
		  elsif prst = '1' then
				counter <= (others => '1');
        elsif rising_edge(clk) then
            if up_down = '1' then
                if counter = "11000" then  -- 24 in binary
                    counter <= (others => '0');  -- Wrap around to 0
                else
                    counter <= counter + 1;  -- Increment the counter
                end if;
            else
                if counter = "00000" then  -- 0 in binary
                    counter <= "11000";  -- Wrap around to 24
                else
                    counter <= counter - 1;  -- Decrement the counter
                end if;
            end if;
        end if;
    end process;

    count <= counter;  -- Output the counter value
end Behavioral;