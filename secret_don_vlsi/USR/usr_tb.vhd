
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY usr_tb IS
END usr_tb;
 
ARCHITECTURE behavior OF usr_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT usr
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         Sin : IN  std_logic;
         mode : IN  std_logic_vector(1 downto 0);
         Pin : IN  std_logic_vector(3 downto 0);
         Sout : OUT  std_logic;
         Pout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';
   signal Sin : std_logic := '0';
   signal mode : std_logic_vector(1 downto 0) := (others => '0');
   signal Pin : std_logic_vector(3 downto 0) := "1010";

 	--Outputs
   signal Sout : std_logic;
   signal Pout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: usr PORT MAP (
          rst => rst,
          clk => clk,
          Sin => Sin,
          mode => mode,
          Pin => Pin,
          Sout => Sout,
          Pout => Pout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= NOT(clk);
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
mode<="00";
wait for 80 ns;
mode<="01";
wait for 50 ns;
mode<="10";
wait for 50 ns;
mode<="11";
wait for 20 ns;
end process;
stim_proc_Sin:process
begin
wait for 10 ns;
Sin<='1';
wait for 10 ns;
Sin<='0';
wait for 10 ns;
Sin<='1';
wait for 10 ns;
Sin<='0';
wait for 10 ns;
Sin<= '0';
wait for 40 ns;
Sin<='1';
wait for 10 ns;
Sin<='0';
wait for 10 ns;
Sin<='1';
wait for 10 ns;
Sin<='0';
wait for 10 ns;
Sin<= '0';
wait ;
end process;

stim_proc_rst:process
begin
rst<='0';
wait for 300 ns;
rst<='1';
wait for 10 ns;
end process;

END;
