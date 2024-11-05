--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:59:34 09/06/2024
-- Design Name:   
-- Module Name:   D:/Aditi_42307/FIFO/FIFO_tb.vhd
-- Project Name:  FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FIFO_tb IS
END FIFO_tb;
 
ARCHITECTURE behavior OF FIFO_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         wr_en : IN  std_logic;
         rd_en : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         fifo_full : OUT  std_logic;
         fifo_empty : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal rd_en : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal fifo_full : std_logic;
   signal fifo_empty : std_logic;
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO PORT MAP (
          clk => clk,
          rst => rst,
          wr_en => wr_en,
          rd_en => rd_en,
          data_in => data_in,
          fifo_full => fifo_full,
          fifo_empty => fifo_empty,
          data_out => data_out
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
--   stim_proc_rst: process
--   begin		
--      rst<='1';
--		wait for 10 ns;
--		rst <='0';
--		wait for 122.5 ns;
--		rst<='1';
--		wait for 10 ns;
--		rst<='0';
--      wait;
--   end process;
	
	stim_proc_rd: process
	begin
		rd_en<='0';
		wait for 40 ns;
		rd_en<='1';
		wait for 40 ns;
	end process;
	
	stim_process_wr: process
	begin 
		wr_en<='1';
		wait for 40 ns;
		wr_en<='0';
		wait for 40 ns;
	end process;
	
	stim_process_data: process
	begin
		data_in<="01010101";
		wait for 10 ns;
		data_in<="00001111";
		wait for 10 ns;
		data_in<="11110000";
		wait for 10 ns;
		data_in<="10101010";
		wait for 10 ns;
	end process;	

END;
