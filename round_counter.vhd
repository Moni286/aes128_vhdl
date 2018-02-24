----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:19 02/18/2018 
-- Design Name: 
-- Module Name:    round_counter - Behavioral 
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

entity round_counter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           round_number : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end round_counter;

architecture Behavioral of round_counter is

signal ctr : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal round : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
	round_number <= round;
	
--	PROCESS(clk)
--	BEGIN
--		if rising_edge(clk) then
--			if en = '1' then
--				if ctr = "10" then
--					ctr <= "00";
--					if round < x"a" then
--						round <= STD_LOGIC_VECTOR(unsigned(round) + 1);
--					else
--						round <= "0000";
--					end if;
--				else
--					ctr <= STD_LOGIC_VECTOR(unsigned(ctr) + 1);
--				end if;
--			else
--				ctr <= "00";
--				round <= "0000";
--			end if;
--		end if;
--	END PROCESS;

	PROCESS(clk)
	BEGIN
		if rising_edge(clk) then
			if en = '1' then
				if round < x"a" then
					round <= STD_LOGIC_VECTOR(unsigned(round) + 1);
				else
					round <= "0000";
				end if;
			else
				round <= "0000";
			end if;
		end if;
	END PROCESS;
	
end Behavioral;






