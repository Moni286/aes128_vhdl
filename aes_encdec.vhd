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
Library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

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
			  roundKey : out STD_LOGIC_VECTOR(127 downto 0); -- debugging
			  round : out STD_LOGIC_VECTOR(3 downto 0);
			  keys_filled_o : out STD_LOGIC;
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

COMPONENT clock_divider is
    Port ( clk_in : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           clk_out : out  STD_LOGIC);
END COMPONENT clock_divider;

signal encEn : STD_LOGIC;
signal decEn : STD_LOGIC;
signal keys_filled : STD_LOGIC;
signal fast_clk : STD_LOGIC;

signal round_number : STD_LOGIC_VECTOR(3 downto 0);
signal round_key : STD_LOGIC_VECTOR(127 downto 0);

signal decOut : STD_LOGIC_VECTOR(127 downto 0);
signal encOut : STD_LOGIC_VECTOR(127 downto 0);

signal input : STD_LOGIC_VECTOR(127 downto 0);

signal clk_rst : STD_LOGIC := '1';
signal q_s : STD_LOGIC_VECTOR(127 downto 0);
begin
	
	round <= round_number;
	--round <= STD_LOGIC_VECTOR(unsigned(NOT round_number) - "0101");
	roundKey <= round_key;
	keys_filled_o <= keys_filled;
	
	encEn <= en AND (NOT dec) AND keys_filled;
	decEn <= en AND dec AND keys_filled;
	
	with dec select input <=
		(d XOR key) when '0',
		d when others;
		
	with dec select q <=
		encOut when '0',
		(decOut XOR key) when others;
	
	encrypter : encrypt PORT MAP(fast_clk, encEn, round_number, input, round_key, encOut);
	decrypter : decrypt PORT MAP(fast_clk, decEn, round_number, input, round_key, decOut);
	keyScheduler : key_scheduler PORT MAP(clk, w, en, dec, round_number, key, round_key, keys_filled);
	roundCounter : round_counter PORT MAP(clk, en, round_number);
	--clockDivider : clock_divider PORT MAP(clk, clk_rst, slow_clk);
	
	PROCESS(clk)
	BEGIN
		if rising_edge(clk) then
			clk_rst <= '0';
			if round_number = x"9" then
				done <= '1';
			else
				done <= '0';
			end if;
		end if;
	END PROCESS;
	
	   -- DCM_SP: Digital Clock Manager
   --         Spartan-6
   -- Xilinx HDL Language Template, version 14.7

   DCM_SP_inst : DCM_SP
   generic map (
      CLKDV_DIVIDE => 3.0,                   -- CLKDV divide value
                                             -- (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
      CLKFX_DIVIDE => 1,                     -- Divide value on CLKFX outputs - D - (1-32)
      CLKFX_MULTIPLY => 3,                   -- Multiply value on CLKFX outputs - M - (2-32)
      CLKIN_DIVIDE_BY_2 => FALSE,            -- CLKIN divide by two (TRUE/FALSE)
      CLKIN_PERIOD => 10.0,                  -- Input clock period specified in nS
      CLKOUT_PHASE_SHIFT => "NONE",          -- Output phase shift (NONE, FIXED, VARIABLE)
      CLK_FEEDBACK => "1X",                  -- Feedback source (NONE, 1X, 2X)
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", -- SYSTEM_SYNCHRNOUS or SOURCE_SYNCHRONOUS
      DFS_FREQUENCY_MODE => "LOW",           -- Unsupported - Do not change value
      DLL_FREQUENCY_MODE => "LOW",           -- Unsupported - Do not change value
      DSS_MODE => "NONE",                    -- Unsupported - Do not change value
      DUTY_CYCLE_CORRECTION => TRUE,         -- Unsupported - Do not change value
      FACTORY_JF => X"c080",                 -- Unsupported - Do not change value
      PHASE_SHIFT => 0,                      -- Amount of fixed phase shift (-255 to 255)
      STARTUP_WAIT => FALSE                  -- Delay config DONE until DCM_SP LOCKED (TRUE/FALSE)
   )
   port map (
      CLK0 => open,         -- 1-bit output: 0 degree clock output
      CLK180 => open,     -- 1-bit output: 180 degree clock output
      CLK270 => open,     -- 1-bit output: 270 degree clock output
      CLK2X => open,       -- 1-bit output: 2X clock frequency clock output
      CLK2X180 => open, -- 1-bit output: 2X clock frequency, 180 degree clock output
      CLK90 => open,       -- 1-bit output: 90 degree clock output
      CLKDV => open,       -- 1-bit output: Divided clock output
      CLKFX => fast_clk,       -- 1-bit output: Digital Frequency Synthesizer output (DFS)
      CLKFX180 => open, -- 1-bit output: 180 degree CLKFX output
      LOCKED => open,     -- 1-bit output: DCM_SP Lock Output
      PSDONE => open,     -- 1-bit output: Phase shift done output
      STATUS => open,     -- 8-bit output: DCM_SP status output
      CLKFB => fast_clk,       -- 1-bit input: Clock feedback input
      CLKIN => clk,       -- 1-bit input: Clock input
      DSSEN => '0',       -- 1-bit input: Unsupported, specify to GND.
      PSCLK => '0',       -- 1-bit input: Phase shift clock input
      PSEN => '0',         -- 1-bit input: Phase shift enable
      PSINCDEC => '0', -- 1-bit input: Phase shift increment/decrement input
      RST => '0'            -- 1-bit input: Active high reset input
   );

   -- End of DCM_SP_inst instantiation

end Behavioral;











