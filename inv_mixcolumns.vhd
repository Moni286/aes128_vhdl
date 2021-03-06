----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:24 02/18/2018 
-- Design Name: 
-- Module Name:    inv_mixcolumns - Behavioral 
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

entity inv_mixcolumns is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           q : out  STD_LOGIC_VECTOR (31 downto 0));
end inv_mixcolumns;

architecture Behavioral of inv_mixcolumns is

type mult_t is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	constant x0E : mult_t := (
		x"00", x"0e", x"1c", x"12", x"38", x"36", x"24", x"2a", x"70", x"7e", x"6c", x"62", x"48", x"46", x"54", x"5a",
		x"e0", x"ee", x"fc", x"f2", x"d8", x"d6", x"c4", x"ca", x"90", x"9e", x"8c", x"82", x"a8", x"a6", x"b4", x"ba",
		x"db", x"d5", x"c7", x"c9", x"e3", x"ed", x"ff", x"f1", x"ab", x"a5", x"b7", x"b9", x"93", x"9d", x"8f", x"81",
		x"3b", x"35", x"27", x"29", x"03", x"0d", x"1f", x"11", x"4b", x"45", x"57", x"59", x"73", x"7d", x"6f", x"61",
		x"ad", x"a3", x"b1", x"bf", x"95", x"9b", x"89", x"87", x"dd", x"d3", x"c1", x"cf", x"e5", x"eb", x"f9", x"f7",
		x"4d", x"43", x"51", x"5f", x"75", x"7b", x"69", x"67", x"3d", x"33", x"21", x"2f", x"05", x"0b", x"19", x"17",
		x"76", x"78", x"6a", x"64", x"4e", x"40", x"52", x"5c", x"06", x"08", x"1a", x"14", x"3e", x"30", x"22", x"2c",
		x"96", x"98", x"8a", x"84", x"ae", x"a0", x"b2", x"bc", x"e6", x"e8", x"fa", x"f4", x"de", x"d0", x"c2", x"cc",
		x"41", x"4f", x"5d", x"53", x"79", x"77", x"65", x"6b", x"31", x"3f", x"2d", x"23", x"09", x"07", x"15", x"1b",
		x"a1", x"af", x"bd", x"b3", x"99", x"97", x"85", x"8b", x"d1", x"df", x"cd", x"c3", x"e9", x"e7", x"f5", x"fb",
		x"9a", x"94", x"86", x"88", x"a2", x"ac", x"be", x"b0", x"ea", x"e4", x"f6", x"f8", x"d2", x"dc", x"ce", x"c0",
		x"7a", x"74", x"66", x"68", x"42", x"4c", x"5e", x"50", x"0a", x"04", x"16", x"18", x"32", x"3c", x"2e", x"20",
		x"ec", x"e2", x"f0", x"fe", x"d4", x"da", x"c8", x"c6", x"9c", x"92", x"80", x"8e", x"a4", x"aa", x"b8", x"b6",
		x"0c", x"02", x"10", x"1e", x"34", x"3a", x"28", x"26", x"7c", x"72", x"60", x"6e", x"44", x"4a", x"58", x"56",
		x"37", x"39", x"2b", x"25", x"0f", x"01", x"13", x"1d", x"47", x"49", x"5b", x"55", x"7f", x"71", x"63", x"6d",
		x"d7", x"d9", x"cb", x"c5", x"ef", x"e1", x"f3", x"fd", x"a7", x"a9", x"bb", x"b5", x"9f", x"91", x"83", x"8d"
	);
	
	constant x0B : mult_t := (
		x"00", x"0b", x"16", x"1d", x"2c", x"27", x"3a", x"31", x"58", x"53", x"4e", x"45", x"74", x"7f", x"62", x"69",
		x"b0", x"bb", x"a6", x"ad", x"9c", x"97", x"8a", x"81", x"e8", x"e3", x"fe", x"f5", x"c4", x"cf", x"d2", x"d9",
		x"7b", x"70", x"6d", x"66", x"57", x"5c", x"41", x"4a", x"23", x"28", x"35", x"3e", x"0f", x"04", x"19", x"12",
		x"cb", x"c0", x"dd", x"d6", x"e7", x"ec", x"f1", x"fa", x"93", x"98", x"85", x"8e", x"bf", x"b4", x"a9", x"a2",
		x"f6", x"fd", x"e0", x"eb", x"da", x"d1", x"cc", x"c7", x"ae", x"a5", x"b8", x"b3", x"82", x"89", x"94", x"9f",
		x"46", x"4d", x"50", x"5b", x"6a", x"61", x"7c", x"77", x"1e", x"15", x"08", x"03", x"32", x"39", x"24", x"2f",
		x"8d", x"86", x"9b", x"90", x"a1", x"aa", x"b7", x"bc", x"d5", x"de", x"c3", x"c8", x"f9", x"f2", x"ef", x"e4",
		x"3d", x"36", x"2b", x"20", x"11", x"1a", x"07", x"0c", x"65", x"6e", x"73", x"78", x"49", x"42", x"5f", x"54",
		x"f7", x"fc", x"e1", x"ea", x"db", x"d0", x"cd", x"c6", x"af", x"a4", x"b9", x"b2", x"83", x"88", x"95", x"9e",
		x"47", x"4c", x"51", x"5a", x"6b", x"60", x"7d", x"76", x"1f", x"14", x"09", x"02", x"33", x"38", x"25", x"2e",
		x"8c", x"87", x"9a", x"91", x"a0", x"ab", x"b6", x"bd", x"d4", x"df", x"c2", x"c9", x"f8", x"f3", x"ee", x"e5",
		x"3c", x"37", x"2a", x"21", x"10", x"1b", x"06", x"0d", x"64", x"6f", x"72", x"79", x"48", x"43", x"5e", x"55",
		x"01", x"0a", x"17", x"1c", x"2d", x"26", x"3b", x"30", x"59", x"52", x"4f", x"44", x"75", x"7e", x"63", x"68",
		x"b1", x"ba", x"a7", x"ac", x"9d", x"96", x"8b", x"80", x"e9", x"e2", x"ff", x"f4", x"c5", x"ce", x"d3", x"d8",
		x"7a", x"71", x"6c", x"67", x"56", x"5d", x"40", x"4b", x"22", x"29", x"34", x"3f", x"0e", x"05", x"18", x"13",
		x"ca", x"c1", x"dc", x"d7", x"e6", x"ed", x"f0", x"fb", x"92", x"99", x"84", x"8f", x"be", x"b5", x"a8", x"a3"
	);	

	constant x0D : mult_t := (
		x"00", x"0d", x"1a", x"17", x"34", x"39", x"2e", x"23", x"68", x"65", x"72", x"7f", x"5c", x"51", x"46", x"4b",
		x"d0", x"dd", x"ca", x"c7", x"e4", x"e9", x"fe", x"f3", x"b8", x"b5", x"a2", x"af", x"8c", x"81", x"96", x"9b",
		x"bb", x"b6", x"a1", x"ac", x"8f", x"82", x"95", x"98", x"d3", x"de", x"c9", x"c4", x"e7", x"ea", x"fd", x"f0",
		x"6b", x"66", x"71", x"7c", x"5f", x"52", x"45", x"48", x"03", x"0e", x"19", x"14", x"37", x"3a", x"2d", x"20",
		x"6d", x"60", x"77", x"7a", x"59", x"54", x"43", x"4e", x"05", x"08", x"1f", x"12", x"31", x"3c", x"2b", x"26",
		x"bd", x"b0", x"a7", x"aa", x"89", x"84", x"93", x"9e", x"d5", x"d8", x"cf", x"c2", x"e1", x"ec", x"fb", x"f6",
		x"d6", x"db", x"cc", x"c1", x"e2", x"ef", x"f8", x"f5", x"be", x"b3", x"a4", x"a9", x"8a", x"87", x"90", x"9d",
		x"06", x"0b", x"1c", x"11", x"32", x"3f", x"28", x"25", x"6e", x"63", x"74", x"79", x"5a", x"57", x"40", x"4d",
		x"da", x"d7", x"c0", x"cd", x"ee", x"e3", x"f4", x"f9", x"b2", x"bf", x"a8", x"a5", x"86", x"8b", x"9c", x"91",
		x"0a", x"07", x"10", x"1d", x"3e", x"33", x"24", x"29", x"62", x"6f", x"78", x"75", x"56", x"5b", x"4c", x"41",
		x"61", x"6c", x"7b", x"76", x"55", x"58", x"4f", x"42", x"09", x"04", x"13", x"1e", x"3d", x"30", x"27", x"2a",
		x"b1", x"bc", x"ab", x"a6", x"85", x"88", x"9f", x"92", x"d9", x"d4", x"c3", x"ce", x"ed", x"e0", x"f7", x"fa",
		x"b7", x"ba", x"ad", x"a0", x"83", x"8e", x"99", x"94", x"df", x"d2", x"c5", x"c8", x"eb", x"e6", x"f1", x"fc",
		x"67", x"6a", x"7d", x"70", x"53", x"5e", x"49", x"44", x"0f", x"02", x"15", x"18", x"3b", x"36", x"21", x"2c",
		x"0c", x"01", x"16", x"1b", x"38", x"35", x"22", x"2f", x"64", x"69", x"7e", x"73", x"50", x"5d", x"4a", x"47",
		x"dc", x"d1", x"c6", x"cb", x"e8", x"e5", x"f2", x"ff", x"b4", x"b9", x"ae", x"a3", x"80", x"8d", x"9a", x"97"
	);

	constant x09 : mult_t := (
		x"00", x"09", x"12", x"1b", x"24", x"2d", x"36", x"3f", x"48", x"41", x"5a", x"53", x"6c", x"65", x"7e", x"77",
		x"90", x"99", x"82", x"8b", x"b4", x"bd", x"a6", x"af", x"d8", x"d1", x"ca", x"c3", x"fc", x"f5", x"ee", x"e7",
		x"3b", x"32", x"29", x"20", x"1f", x"16", x"0d", x"04", x"73", x"7a", x"61", x"68", x"57", x"5e", x"45", x"4c",
		x"ab", x"a2", x"b9", x"b0", x"8f", x"86", x"9d", x"94", x"e3", x"ea", x"f1", x"f8", x"c7", x"ce", x"d5", x"dc",
		x"76", x"7f", x"64", x"6d", x"52", x"5b", x"40", x"49", x"3e", x"37", x"2c", x"25", x"1a", x"13", x"08", x"01",
		x"e6", x"ef", x"f4", x"fd", x"c2", x"cb", x"d0", x"d9", x"ae", x"a7", x"bc", x"b5", x"8a", x"83", x"98", x"91",
		x"4d", x"44", x"5f", x"56", x"69", x"60", x"7b", x"72", x"05", x"0c", x"17", x"1e", x"21", x"28", x"33", x"3a",
		x"dd", x"d4", x"cf", x"c6", x"f9", x"f0", x"eb", x"e2", x"95", x"9c", x"87", x"8e", x"b1", x"b8", x"a3", x"aa",
		x"ec", x"e5", x"fe", x"f7", x"c8", x"c1", x"da", x"d3", x"a4", x"ad", x"b6", x"bf", x"80", x"89", x"92", x"9b",
		x"7c", x"75", x"6e", x"67", x"58", x"51", x"4a", x"43", x"34", x"3d", x"26", x"2f", x"10", x"19", x"02", x"0b",
		x"d7", x"de", x"c5", x"cc", x"f3", x"fa", x"e1", x"e8", x"9f", x"96", x"8d", x"84", x"bb", x"b2", x"a9", x"a0",
		x"47", x"4e", x"55", x"5c", x"63", x"6a", x"71", x"78", x"0f", x"06", x"1d", x"14", x"2b", x"22", x"39", x"30",
		x"9a", x"93", x"88", x"81", x"be", x"b7", x"ac", x"a5", x"d2", x"db", x"c0", x"c9", x"f6", x"ff", x"e4", x"ed",
		x"0a", x"03", x"18", x"11", x"2e", x"27", x"3c", x"35", x"42", x"4b", x"50", x"59", x"66", x"6f", x"74", x"7d",
		x"a1", x"a8", x"b3", x"ba", x"85", x"8c", x"97", x"9e", x"e9", x"e0", x"fb", x"f2", x"cd", x"c4", x"df", x"d6",
		x"31", x"38", x"23", x"2a", x"15", x"1c", x"07", x"0e", x"79", x"70", x"6b", x"62", x"5d", x"54", x"4f", x"46"
	);

begin

		q(31 downto 24)<= x0E(to_integer(unsigned(d(31 downto 24)))) xor 
								x0B(to_integer(unsigned(d(23 downto 16)))) xor 
								x0D(to_integer(unsigned(d(15 downto  8)))) xor 
								x09(to_integer(unsigned(d( 7 downto  0))));
		q(23 downto 16)<= x0E(to_integer(unsigned(d(23 downto 16)))) xor 
								x0B(to_integer(unsigned(d(15 downto  8)))) xor 
								x0D(to_integer(unsigned(d( 7 downto  0)))) xor 
								x09(to_integer(unsigned(d(31 downto 24))));
		q(15 downto  8)<= x0E(to_integer(unsigned(d(15 downto  8)))) xor 
								x0B(to_integer(unsigned(d( 7 downto  0)))) xor 
								x0D(to_integer(unsigned(d(31 downto 24)))) xor 
								x09(to_integer(unsigned(d(23 downto 16))));
		q( 7 downto  0)<= x0E(to_integer(unsigned(d( 7 downto  0)))) xor 
								x0B(to_integer(unsigned(d(31 downto 24)))) xor 
								x0D(to_integer(unsigned(d(23 downto 16)))) xor 
								x09(to_integer(unsigned(d(15 downto  8))));

end Behavioral;








