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
           done : out  STD_LOGIC_VECTOR (127 downto 0));
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

begin


end Behavioral;

