library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity Clock_Divider is
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end Clock_Divider;
  
architecture bhv of Clock_Divider is
  
signal count: integer;
signal tmp : std_logic;
  
begin
  
process(clk, reset)
begin
	if(reset='1') then
		count<=0;
		tmp<='0';
	else 
		count <=count+1;
		if (count = 2) then
			tmp <= NOT tmp;
			count <= 0;
		end if;
	end if;
	
end process;
  
clock_out <= tmp;
  
end bhv;