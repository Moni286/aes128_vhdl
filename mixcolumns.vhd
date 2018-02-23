----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:41 02/18/2018 
-- Design Name: 
-- Module Name:    mixcolumns - Behavioral 
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

entity mixcolumns is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           q : out  STD_LOGIC_VECTOR (31 downto 0));
end mixcolumns;

architecture Behavioral of mixcolumns is

type mult_t is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);

-- set up multiplication by 2 table
	constant x2 : mult_t := (
		X"00", X"02", X"04", X"06", X"08", X"0a", X"0c", X"0e", X"10", X"12", X"14", X"16", X"18", X"1a", X"1c", X"1e", 
		X"20", X"22", X"24", X"26", X"28", X"2a", X"2c", X"2e", X"30", X"32", X"34", X"36", X"38", X"3a", X"3c", X"3e", 
		X"40", X"42", X"44", X"46", X"48", X"4a", X"4c", X"4e", X"50", X"52", X"54", X"56", X"58", X"5a", X"5c", X"5e", 
		X"60", X"62", X"64", X"66", X"68", X"6a", X"6c", X"6e", X"70", X"72", X"74", X"76", X"78", X"7a", X"7c", X"7e", 
		X"80", X"82", X"84", X"86", X"88", X"8a", X"8c", X"8e", X"90", X"92", X"94", X"96", X"98", X"9a", X"9c", X"9e", 
		X"a0", X"a2", X"a4", X"a6", X"a8", X"aa", X"ac", X"ae", X"b0", X"b2", X"b4", X"b6", X"b8", X"ba", X"bc", X"be", 
		X"c0", X"c2", X"c4", X"c6", X"c8", X"ca", X"cc", X"ce", X"d0", X"d2", X"d4", X"d6", X"d8", X"da", X"dc", X"de", 
		X"e0", X"e2", X"e4", X"e6", X"e8", X"ea", X"ec", X"ee", X"f0", X"f2", X"f4", X"f6", X"f8", X"fa", X"fc", X"fe", 
		X"1b", X"19", X"1f", X"1d", X"13", X"11", X"17", X"15", X"0b", X"09", X"0f", X"0d", X"03", X"01", X"07", X"05", 
		X"3b", X"39", X"3f", X"3d", X"33", X"31", X"37", X"35", X"2b", X"29", X"2f", X"2d", X"23", X"21", X"27", X"25", 
		X"5b", X"59", X"5f", X"5d", X"53", X"51", X"57", X"55", X"4b", X"49", X"4f", X"4d", X"43", X"41", X"47", X"45", 
		X"7b", X"79", X"7f", X"7d", X"73", X"71", X"77", X"75", X"6b", X"69", X"6f", X"6d", X"63", X"61", X"67", X"65", 
		X"9b", X"99", X"9f", X"9d", X"93", X"91", X"97", X"95", X"8b", X"89", X"8f", X"8d", X"83", X"81", X"87", X"85", 
		X"bb", X"b9", X"bf", X"bd", X"b3", X"b1", X"b7", X"b5", X"ab", X"a9", X"af", X"ad", X"a3", X"a1", X"a7", X"a5", 
		X"db", X"d9", X"df", X"dd", X"d3", X"d1", X"d7", X"d5", X"cb", X"c9", X"cf", X"cd", X"c3", X"c1", X"c7", X"c5", 
		X"fb", X"f9", X"ff", X"fd", X"f3", X"f1", X"f7", X"f5", X"eb", X"e9", X"ef", X"ed", X"e3", X"e1", X"e7", X"e5"	);	
	
	constant x3 : mult_t := (
		x"00", x"03", x"06", x"05", x"0c", x"0f", x"0a", x"09", x"18", x"1b", x"1e", x"1d", x"14", x"17", x"12", x"11",
		x"30", x"33", x"36", x"35", x"3c", x"3f", x"3a", x"39", x"28", x"2b", x"2e", x"2d", x"24", x"27", x"22", x"21",
		x"60", x"63", x"66", x"65", x"6c", x"6f", x"6a", x"69", x"78", x"7b", x"7e", x"7d", x"74", x"77", x"72", x"71",
		x"50", x"53", x"56", x"55", x"5c", x"5f", x"5a", x"59", x"48", x"4b", x"4e", x"4d", x"44", x"47", x"42", x"41",
		x"c0", x"c3", x"c6", x"c5", x"cc", x"cf", x"ca", x"c9", x"d8", x"db", x"de", x"dd", x"d4", x"d7", x"d2", x"d1",
		x"f0", x"f3", x"f6", x"f5", x"fc", x"ff", x"fa", x"f9", x"e8", x"eb", x"ee", x"ed", x"e4", x"e7", x"e2", x"e1",
		x"a0", x"a3", x"a6", x"a5", x"ac", x"af", x"aa", x"a9", x"b8", x"bb", x"be", x"bd", x"b4", x"b7", x"b2", x"b1",
		x"90", x"93", x"96", x"95", x"9c", x"9f", x"9a", x"99", x"88", x"8b", x"8e", x"8d", x"84", x"87", x"82", x"81",
		x"9b", x"98", x"9d", x"9e", x"97", x"94", x"91", x"92", x"83", x"80", x"85", x"86", x"8f", x"8c", x"89", x"8a",
		x"ab", x"a8", x"ad", x"ae", x"a7", x"a4", x"a1", x"a2", x"b3", x"b0", x"b5", x"b6", x"bf", x"bc", x"b9", x"ba",
		x"fb", x"f8", x"fd", x"fe", x"f7", x"f4", x"f1", x"f2", x"e3", x"e0", x"e5", x"e6", x"ef", x"ec", x"e9", x"ea",
		x"cb", x"c8", x"cd", x"ce", x"c7", x"c4", x"c1", x"c2", x"d3", x"d0", x"d5", x"d6", x"df", x"dc", x"d9", x"da",
		x"5b", x"58", x"5d", x"5e", x"57", x"54", x"51", x"52", x"43", x"40", x"45", x"46", x"4f", x"4c", x"49", x"4a",
		x"6b", x"68", x"6d", x"6e", x"67", x"64", x"61", x"62", x"73", x"70", x"75", x"76", x"7f", x"7c", x"79", x"7a",
		x"3b", x"38", x"3d", x"3e", x"37", x"34", x"31", x"32", x"23", x"20", x"25", x"26", x"2f", x"2c", x"29", x"2a",
		x"0b", x"08", x"0d", x"0e", x"07", x"04", x"01", x"02", x"13", x"10", x"15", x"16", x"1f", x"1c", x"19", x"1a"
		);	

begin

		q(31 downto 24) <= x2(to_integer(unsigned(d(31 downto 24)))) xor 
								x3(to_integer(unsigned(d(23 downto 16)))) xor 
								d(15 downto  8) xor 
								d( 7 downto  0);
		q(23 downto 16) <= x2(to_integer(unsigned(d(23 downto 16)))) xor 
								x3(to_integer(unsigned(d(15 downto  8)))) xor 
								d( 7 downto  0) xor 
								d(31 downto 24);
		q(15 downto  8) <= x2(to_integer(unsigned(d(15 downto  8)))) xor 
								x3(to_integer(unsigned(d( 7 downto  0)))) xor 
								d(31 downto 24) xor 
								d(23 downto 16);
		q( 7 downto  0) <= x2(to_integer(unsigned(d( 7 downto  0)))) xor 
								x3(to_integer(unsigned(d(31 downto 24)))) xor 
								d(23 downto 16) xor 
								d(15 downto  8);
		
end Behavioral;

