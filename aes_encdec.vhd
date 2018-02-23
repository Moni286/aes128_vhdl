----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:37 02/19/2018 
-- Design Name: 
-- Module Name:    aes_encdec - Behavioral 
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

entity aes_encdec is
    Port ( clk : in  STD_LOGIC;
           w : in  STD_LOGIC;
           dec : in  STD_LOGIC;
           en : in  STD_LOGIC;
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           d : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0);
			  round : out STD_LOGIC_VECTOR(3 downto 0);
           done : out  STD_LOGIC);
end aes_encdec;


architecture Behavioral of aes_encdec is

COMPONENT decrypt is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  round_number : in STD_LOGIC_VECTOR(3 downto 0);
           state : in  STD_LOGIC_VECTOR (127 downto 0);
           round_key : in  STD_LOGIC_VECTOR (127 downto 0);
           next_state : out  STD_LOGIC_VECTOR (127 downto 0));
END COMPONENT decrypt;

COMPONENT encrypt is
    Port ( clk : in STD_LOGIC;
			  en : in STD_LOGIC;
			  round_number : STD_LOGIC_VECTOR(3 downto 0);
			  state : in  STD_LOGIC_VECTOR (127 downto 0);
           round_key : in  STD_LOGIC_VECTOR (127 downto 0);
           next_state : out  STD_LOGIC_VECTOR (127 downto 0));
END COMPONENT encrypt;

COMPONENT key_scheduler is
    Port ( clk : in  STD_LOGIC;
           w : in  STD_LOGIC;
			  en : in STD_LOGIC;
           dec : in  STD_LOGIC;
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
           original_key : in  STD_LOGIC_VECTOR (127 downto 0);
           round_key : out  STD_LOGIC_VECTOR (127 downto 0);
			  keys_filled : out STD_LOGIC);
END COMPONENT key_scheduler;

COMPONENT round_counter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           round_number : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT round_counter;

signal encEn : STD_LOGIC;
signal decEn : STD_LOGIC;
signal keys_filled : STD_LOGIC;
signal slow_clk : STD_LOGIC;

signal round_number : STD_LOGIC_VECTOR(3 downto 0);
signal round_key : STD_LOGIC_VECTOR(127 downto 0);

signal decOut : STD_LOGIC_VECTOR(127 downto 0);
signal encOut : STD_LOGIC_VECTOR(127 downto 0);

signal input : STD_LOGIC_VECTOR(127 downto 0);

begin
	
	round <= round_number;
	
	encEn <= (en AND NOT dec) AND keys_filled;
	decEn <= (en AND dec) AND keys_filled;
	
	with dec select input <=
		(d XOR key) when '0',
		d when others;
		
	with dec select q <=
		encOut when '0',
		(decOut XOR key) when others;
	
	encrypter : encrypt PORT MAP(clk, encEn, round_number, input, round_key, encOut);
	decrypter : decrypt PORT MAP(clk, decEn, round_number, input, round_key, decOut);
	keyScheduler : key_scheduler PORT MAP(slow_clk, w, en, dec, round_number, key, round_key, keys_filled);
	roundCounter : round_counter PORT MAP(clk, en, round_number);
	clockDivider : clock_divider PORT MAP(clk, NOT en, slow_clk);
	
	PROCESS(clk)
	BEGIN
		if rising_edge(clk) then
			if round_number = x"a" then
				done <= '1';
			else
				done <= '0';
			end if;
		end if;
	END PROCESS;

end Behavioral;











