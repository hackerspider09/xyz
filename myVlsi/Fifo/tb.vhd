LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_fifo_4x8 IS
END tb_fifo_4x8;

ARCHITECTURE behavior OF tb_fifo_4x8 IS 

    COMPONENT fifo_4x8
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
			checkflag : OUT std_logic;
         we : IN  std_logic;
         re : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(7 downto 0);
         full : OUT  std_logic;
         empty : OUT  std_logic
        );
    END COMPONENT;
    
   -- Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal we : std_logic := '0';
   signal re : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');

   -- Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal full : std_logic;
   signal empty : std_logic;
	signal checkflag : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: fifo_4x8 PORT MAP (
          clk => clk,
          rst => rst,
			 checkflag => checkflag,
          we => we,
          re => re,
          din => din,
          dout => dout,
          full => full,
          empty => empty
        );

    -- Clock process definition
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    -- Stimulus process
    stim_proc: process
    begin		
        -- Step 1: Apply reset to initialize the FIFO
        rst <= '1';  -- Apply reset
        wait for clk_period;
        rst <= '0';  -- Release reset
        wait for clk_period;

        -- Step 2: Write data into FIFO
        -- Writing 4 values to fill the FIFO
        we <= '1'; re <= '0'; -- Enable write, disable read
        din <= "00000001";  -- Write first byte
        wait for clk_period;
        
        din <= "00000010";  -- Write second byte
        wait for clk_period;

        din <= "00000100";  -- Write third byte
        wait for clk_period;

        din <= "00001000";  -- Write fourth byte
        wait for clk_period;
		  
		  din <= "00010000";  -- Write fifth byte
        wait for clk_period;

        -- Disable write after 4th write operation
        we <= '0';
        wait for clk_period;
        
        -- Check if FIFO is full
        assert full = '1' report "FIFO should be full but it is not." severity error;

        -- Step 3: Read data from FIFO
        -- Reading all 4 values from FIFO
        re <= '1'; we <= '0'; -- Enable read, disable write
        wait for clk_period;

        re <= '1'; -- Read second data
        wait for clk_period;

        re <= '1'; -- Read third data
        wait for clk_period;

        re <= '1'; -- Read fourth data
        wait for clk_period;
		  
		  re <= '1'; -- Read fifth data
        wait for clk_period;
		  
        -- Disable read after 5th read operation
        re <= '0';
		  
		  
		  -- Writing 6th values in FIFO
        we <= '1'; -- Enable write, disable read
        din <= "00100000";  -- Write first byte
        wait for clk_period;
		  
		   -- Reading 6th values from FIFO
        re <= '1'; we <= '0'; -- Enable read, disable write
        wait for clk_period;
		  

        -- Check if FIFO is empty
        assert empty = '1' report "FIFO should be empty but it is not." severity error;

        -- Test completed, end simulation
       wait;
    end process;

END behavior;