----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:36 02/19/2018 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
--
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
----library UNISIM;
----use UNISIM.VComponents.all;
--
--entity clock_divider is
--    Port ( clk : in  STD_LOGIC;
--			  rst : in STD_LOGIC;
--           clk_div : out  STD_LOGIC);
--end clock_divider;
--
--architecture Behavioral of clock_divider is
--
--signal ctr : STD_LOGIC_VECTOR(1 downto 0) := "00";
--signal clkDiv : STD_LOGIC := '1';
--
--begin
--	clk_div <= clkDiv;
--	
--	PROCESS(clk, rst)
--	BEGIN
--	if rst = '1' then
--		ctr <= "00";
--		clkDiv <= '1';
--	elsif rising_edge(clk) then
--		if ctr >= "10" and rst = '0' then
--			clkDiv <= NOT clkDiv;
--			ctr <= "00";
--		else
--			ctr <= STD_LOGIC_VECTOR(unsigned(ctr) + 1);
--		end if;
--	end if;
--	END PROCESS;
--
--end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
    Port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clock_divider;

architecture Behavioral of clock_divider is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 3 := 0;
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 2) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;
