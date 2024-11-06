library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Use numeric_std for arithmetic operations

entity tb_mod25_up_down_counter is
end tb_mod25_up_down_counter;

architecture testbench of tb_mod25_up_down_counter is
    -- Component Declaration for the Counter
    component mod25_up_down_counter
        Port (
            clk     : in  STD_LOGIC;         
            reset   : in  STD_LOGIC;
				prst 	  : in  STD_LOGIC; 
            up_down : in  STD_LOGIC;         
            count   : out STD_LOGIC_VECTOR(4 downto 0)
        );
    end component;

    -- Signals for the testbench
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
	 signal prst   : STD_LOGIC := '0';
    signal up_down : STD_LOGIC := '1';  -- Start counting up
    signal count   : STD_LOGIC_VECTOR(4 downto 0);

    -- Clock period
    constant clk_period : time := 20 ns;

begin
    -- Instantiate the counter
    uut: mod25_up_down_counter
        Port map (
            clk => clk,
            reset => reset,
				prst => prst,
            up_down => up_down,
            count => count
        );

    -- Generate clock signal
    clk_process : process
    begin
        while true loop
            clk <= '1';
            wait for clk_period / 2;
            clk <= '0';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Test process
    stimulus_process : process
    begin
        -- Initial reset
--        reset <= '1';  -- Assert reset
--        wait for clk_period; -- Wait for one clock cycle
--        reset <= '0';  -- Deassert reset
--        wait for clk_period; -- Wait for another clock cycle
--
--        -- Count Up for 25 clock cycles
--        for i in 0 to 24 loop
--            wait for clk_period; -- Wait for clock
--        end loop;
--
--        -- Reset the counter
--        reset <= '1';  -- Assert reset
--        wait for clk_period; -- Wait for one clock cycle
--        reset <= '0';  -- Deassert reset
--        wait for clk_period; -- Wait for another clock cycle
--
--        -- Change direction to Count Down
--        up_down <= '0';  -- Change to count down
--
--        -- Count Down for 25 clock cycles
--        for i in 24 downto 0 loop
--            wait for clk_period; -- Wait for clock
--        end loop;

        -- Finish simulation
		  reset <= '1';  -- Assert reset
        wait for clk_period; -- Wait for one clock cycle
        reset <= '0';  -- Deassert reset
		  prst <= '1';  
        wait for clk_period; -- Wait for another clock cycle
		  prst<= '0';
		  
		   --up_down <= '1';
		  wait for 520 ns;
		  
		   up_down <= '0';  -- Change to count down
		  wait for 500 ns;
		  
		  
		  --use run for time specified on toolbar to increase time beyond 1000ns
		  
 
    end process;
end testbench;