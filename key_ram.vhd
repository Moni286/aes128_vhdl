----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:32 02/18/2018 
-- Design Name: 
-- Module Name:    key_ram - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity key_ram is
    Port ( clk : in  STD_LOGIC;
           w : in  STD_LOGIC;
           w_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           r_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           w_key : in  STD_LOGIC_VECTOR (127 downto 0);
           r_key : out  STD_LOGIC_VECTOR (127 downto 0));
end key_ram;

architecture Behavioral of key_ram is

type keys_t is array (0 to 15) of STD_LOGIC_VECTOR(127 downto 0);
	signal keys : keys_t := (others => x"00000000000000000000000000000000");

begin

	r_key <= keys(to_integer(unsigned(r_addr)));

	PROCESS(clk)
	BEGIN
	if rising_edge(clk) then
		if w = '1' then
			keys(to_integer(unsigned(w_addr))) <= w_key;
		end if;
	end if;
	END PROCESS;
	
end Behavioral;




