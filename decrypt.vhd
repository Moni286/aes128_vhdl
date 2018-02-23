----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:17 02/18/2018 
-- Design Name: 
-- Module Name:    decrypt - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypt is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  round_number : in STD_LOGIC_VECTOR(3 downto 0);
           state : in  STD_LOGIC_VECTOR (127 downto 0);
           round_key : in  STD_LOGIC_VECTOR (127 downto 0);
           next_state : out  STD_LOGIC_VECTOR (127 downto 0));
end decrypt;

architecture Behavioral of decrypt is

COMPONENT inv_mixcolumns is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           q : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT inv_mixcolumns;

COMPONENT inv_sbox is
    Port ( d : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
END COMPONENT inv_sbox;

signal from_addrkey : STD_LOGIC_VECTOR(127 downto 0);

signal from_mix0 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix1 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix2 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix3 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix : STD_LOGIC_VECTOR(127 downto 0);

signal inv_shift : STD_LOGIC_VECTOR(127 downto 0);

signal from_invSbox : STD_LOGIC_VECTOR(127 downto 0);

signal from_mux : STD_LOGIC_VECTOR(127 downto 0);
signal reg0 : STD_LOGIC_VECTOR(127 downto 0);
signal reg1 : STD_LOGIC_VECTOR(127 downto 0);
signal reg2 : STD_LOGIC_VECTOR(127 downto 0);

begin
	
	with round_number select from_mux <= 
		state when x"0",
		reg2 when others;
	
	from_addrkey <= from_mux XOR round_key;
	
	invMix0 : inv_mixcolumns PORT MAP(reg0(127 downto 96), from_mix0);
	invMix1 : inv_mixcolumns PORT MAP(reg0(95 downto 64), from_mix1);
	invMix2 : inv_mixcolumns PORT MAP(reg0(63 downto 32), from_mix2);
	invMix3 : inv_mixcolumns PORT MAP(reg0(31 downto 0), from_mix3);
	
	from_mix <= from_mix0 & from_mix1 & from_mix2 & from_mix3;
	
	inv_shift <= reg1(127 downto 120) &
				reg1( 23 downto  16) & 
				reg1( 47 downto  40) &	
				reg1( 71 downto  64) & 
				reg1( 95 downto  88) & 
				reg1(119 downto 112) &
				reg1( 15 downto   8) &
				reg1( 39 downto  32) &
				reg1( 63 downto  56) &
				reg1( 87 downto  80) &
				reg1(111 downto 104) &
				reg1(  7 downto   0) &
				reg1( 31 downto  24) &
				reg1( 55 downto  48) &
				reg1( 79 downto  72) &
				reg1(103 downto  96);
	
	invSbox : inv_sbox PORT MAP(inv_shift, from_invSbox);
	
	next_state <= reg2;
	
	PROCESS(clk)
	BEGIN
		if rising_edge(clk) then
			if en = '1' then
				if round_number = x"0" then
					reg1 <= reg0;
				else
					reg1 <= from_mix;
				end if;
				
				reg0 <= from_addrkey;
				reg2 <= from_invSbox;
				
			end if;
		end if;
	END PROCESS;
end Behavioral;






