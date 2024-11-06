library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fifo_4x8 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  checkflag : out  STD_LOGIC;  -- optional just to ad flag to check
           we : in  STD_LOGIC;
           re : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input
           dout : out  STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit output
           full : out  STD_LOGIC;
           empty : out  STD_LOGIC);
end fifo_4x8;

architecture Behavioral of fifo_4x8 is

--wihtin process variable update imediatly but signal update only after the process complete this allows signals to sunc data 

-- Define an array type for the memory block
-- mem_type is new dt defined as array , it has 4 element each of 8 bits this represent mem block of 4x8 bits
type mem_type is array(0 to 3) of std_logic_vector(7 downto 0);
signal mem : mem_type;  -- Signal for the memory block

-- read/write pointers to point to next memory location
signal rd_ptr, wr_ptr : integer:= 0;
--signal rd_ptr, wr_ptr : integer range 0 to 3 := 0;

-- counter for data items in FIFO
signal count : integer range 0 to 4 := 0;

-- internal signals for full and empty
signal full_flag, empty_flag : std_logic;


-- for stdlogic '1' 
-- if it is integer 1 


begin
	process(clk, rst,we,re)
	begin	
		if rst = '1' then
			wr_ptr <= 0;
			rd_ptr <= 0;
			count <= 0;
			dout <= (others => '0');
		elsif rising_edge(clk) then
			checkflag<= '0';
			-- write operation
			if we = '1' and full_flag = '0' then
				mem(wr_ptr) <= din;  -- Write data into memory
				wr_ptr <= (wr_ptr + 1) mod 4;  -- Increment write pointer
				count <= count + 1;
				checkflag<= '1';
			end if;
			
			-- read operation
			if re = '1' and empty_flag = '0' then
				dout <= mem(rd_ptr);  -- Read data from memory
				rd_ptr <= (rd_ptr + 1) mod 4;  -- Increment read pointer
				count <= count - 1;
				checkflag<='1';
			end if;
		end if;
	end process;
	
	-- full and empty flag logic
	full_flag <= '1' when count = 4 else '0';
	empty_flag <= '1' when count = 0 else '0';

	-- Assign the internal flags to the output ports
	full <= full_flag;
	empty <= empty_flag;

end Behavioral;