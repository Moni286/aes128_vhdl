----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:03 02/18/2018 
-- Design Name: 
-- Module Name:    key_scheduler - Behavioral 
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

entity key_scheduler is
    Port ( clk : in  STD_LOGIC;
           w : in  STD_LOGIC;
			  en : in STD_LOGIC;
           dec : in  STD_LOGIC;
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
           original_key : in  STD_LOGIC_VECTOR (127 downto 0);
           round_key : out  STD_LOGIC_VECTOR (127 downto 0);
			  keys_filled : out STD_LOGIC);
end key_scheduler;

architecture Behavioral of key_scheduler is

COMPONENT key_expand is
    Port ( d : in  STD_LOGIC_VECTOR (127 downto 0);
           r : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
END COMPONENT key_expand;

COMPONENT key_ram is
    Port ( clk : in  STD_LOGIC;
           w : in  STD_LOGIC;
           w_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           r_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           w_key : in  STD_LOGIC_VECTOR (127 downto 0);
           r_key : out  STD_LOGIC_VECTOR (127 downto 0));
END COMPONENT key_ram;

type decRound_t is array (0 to 10) of STD_LOGIC_VECTOR(3 downto 0);
constant decRound : decRound_t := (x"a", x"9", x"8", x"7", x"6", x"5", x"4", x"3", x"2", x"1",x"0");

signal w_s : STD_LOGIC;	

signal w_addr : STD_LOGIC_VECTOR(3 downto 0);
signal r_addr : STD_LOGIC_VECTOR(3 downto 0);	

signal w_key : STD_LOGIC_VECTOR(127 downto 0);
signal r_key : STD_LOGIC_VECTOR(127 downto 0);

signal next_key : STD_LOGIC_VECTOR(127 downto 0);
signal curr_key : STD_LOGIC_VECTOR(127 downto 0);
signal keys_filled_s : STD_LOGIC := '0';

signal roundNumberInc : STD_LOGIC_VECTOR(3 downto 0);
signal decRoundNumber : STD_LOGIC_VECTOR(3 downto 0);

begin
	
	keyRAM : key_ram PORT MAP(clk, w_s, w_addr, r_addr, w_key, r_key);
	keyExpand : key_expand PORT MAP(r_key, roundNumberInc, next_key);
	
	round_key <= r_key;
	keys_filled <= keys_filled_s;
	
	roundNumberInc <= STD_LOGIC_VECTOR(unsigned(round_number) + 1);
	decRoundNumber <= STD_LOGIC_VECTOR(unsigned(NOT round_number) - 5);
	--decRoundNumber <= decRound(to_integer(unsigned(round_number)));
	
	with (dec AND keys_filled_s) select r_addr <= 
		round_number when '0',
		decRoundNumber when others;
	
	with w select w_key <= 
		original_key when '1',
		next_key when others;
	
	with w select w_addr <=
		"0000" when '1',
		roundNumberInc when others;
		
	w_s <= w OR (en AND (NOT keys_filled_s));
	
	PROCESS(clk)
	BEGIN
		if rising_edge(clk) then
			if en = '1' then
				if round_number = x"9" then
					keys_filled_s <= '1';
				end if;
			elsif w = '1' then
				keys_filled_s <= '0';
			end if;
		end if;
	END PROCESS;
	
	
end Behavioral;









