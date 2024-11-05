
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

 
ENTITY tb_MOD_25 IS
END tb_MOD_25;
 
ARCHITECTURE behavior OF tb_MOD_25 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MOD_25
    PORT(
         rst : IN  std_logic;
         pr : IN  std_logic;
         dir : IN  std_logic;
         clk : IN  std_logic;
         y_out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pr : std_logic := '0';
   signal dir : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal y_out : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MOD_25 PORT MAP (
          rst => rst,
          pr => pr,
          dir => dir,
          clk => clk,
          y_out => y_out
        );

   -- Clock process definitions
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
      -- hold reset state for 100 ns.
		rst<='1';
      wait for 100 ns;	
		rst<='0';
		pr<='1';
		wait for 100 ns;	
		
		pr<='0';
		dir<='1';
		wait for 10 ns;
		
		dir <='0';
		wait for 10 ns;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
