----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:46 02/18/2018 
-- Design Name: 
-- Module Name:    encrypt - Behavioral 
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

entity encrypt is
    Port ( clk : in STD_LOGIC;
			  en : in STD_LOGIC;
			  round_number : STD_LOGIC_VECTOR(3 downto 0);
			  state : in  STD_LOGIC_VECTOR (127 downto 0);
           round_key : in  STD_LOGIC_VECTOR (127 downto 0);
           next_state : out  STD_LOGIC_VECTOR (127 downto 0));
end encrypt;

architecture Behavioral of encrypt is

COMPONENT sbox_shift is
    Port ( d : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
END COMPONENT sbox_shift;

COMPONENT mixcolumns is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           q : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT mixcolumns;

signal from_sbox : STD_LOGIC_VECTOR(127 downto 0);

signal from_mix0 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix1 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix2 : STD_LOGIC_VECTOR(31 downto 0);
signal from_mix3 : STD_LOGIC_VECTOR(31 downto 0);

signal from_addrkey : STD_LOGIC_VECTOR(127 downto 0);

signal reg0 : STD_LOGIC_VECTOR(127 downto 0);
signal reg1 : STD_LOGIC_VECTOR(127 downto 0);
signal reg2 : STD_LOGIC_VECTOR(127 downto 0);

signal rnd_reg1 : STD_LOGIC;
signal rnd_reg2 : STD_LOGIC;

begin
	
	sBoxShift : sbox_shift PORT MAP(reg0, from_sbox);
		
	mix0 : mixcolumns PORT MAP(reg1(127 downto 96), from_mix0);
	mix1 : mixcolumns PORT MAP(reg1(95 downto 64), from_mix1);
	mix2 : mixcolumns PORT MAP(reg1(63 downto 32), from_mix2);
	mix3 : mixcolumns PORT MAP(reg1(31 downto 0), from_mix3);
	
	from_addrkey <= reg2 XOR round_key;
		
	next_state <= from_addrkey;
	
	PROCESS(clk)
	BEGIN
		if rising_edge(clk) then
			if en = '1' then
				
				if round_number = x"a" then
					reg0 <= from_addrkey;
					--reg2 <= reg1;
				elsif round_number = x"0" then
					reg0 <= state;
				else
					reg0 <= from_addrkey;
				end if;
				reg1 <= from_sbox;
				
				reg2 <=  from_mix0 & from_mix1 & from_mix2 & from_mix3;
				
				if round_number = x"9" then
					rnd_reg1 <= '1';
				else
					rnd_reg1 <= '0';
				end if;
				rnd_reg2 <= rnd_reg1;
				
				if rnd_reg2 = '1' then
					reg2 <= reg1;
				end if;
				
			end if;
		end if;
	END PROCESS;

end Behavioral;

