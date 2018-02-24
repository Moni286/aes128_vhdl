--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:41:59 02/23/2018
-- Design Name:   
-- Module Name:   C:/Users/HP/Desktop/University/Academics/Capstone/aes128_vhdl/aes128_v4/aes_encdec_tb.vhd
-- Project Name:  aes128_v4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aes_encdec
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY aes_encdec_tb IS
END aes_encdec_tb;
 
ARCHITECTURE behavior OF aes_encdec_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aes_encdec
    PORT(
         clk : IN  std_logic;
         w : IN  std_logic;
         dec : IN  std_logic;
         en : IN  std_logic;
         key : IN  std_logic_vector(127 downto 0);
         d : IN  std_logic_vector(127 downto 0);
         q : OUT  std_logic_vector(127 downto 0);
         round : OUT  std_logic_vector(3 downto 0);
         done : OUT  std_logic;
			keys_filled_o : OUT std_logic;
			roundKey : out STD_LOGIC_VECTOR(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal w : std_logic := '0';
   signal dec : std_logic := '0';
   signal en : std_logic := '0';
   signal key : std_logic_vector(127 downto 0) := (others => '0');
   signal d : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(127 downto 0);
   signal round : std_logic_vector(3 downto 0);
   signal done : std_logic;
	signal keys_filled_o : std_logic := '0';
	signal roundKey : STD_LOGIC_VECTOR(127 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aes_encdec PORT MAP (
          clk => clk,
          w => w,
          dec => dec,
          en => en,
          key => key,
          d => d,
          q => q,
          round => round,
          done => done,
			 keys_filled_o => keys_filled_o,
			 roundKey => roundKey
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		en <= '0';
		w <= '0';
		dec <= '1';
      wait for 100 ns;	
		key <= x"2b7e151628aed2a6abf7158809cf4f3c";
		--d <= x"6bc1bee22e409f96e93d7e117393172a"; -- plaintext
		w <= '1';
		d <= x"3ad77bb40d7a3660a89ecaf32466ef97"; -- ciphertext
		--en<='1';
		wait for clk_period*1;
		w <= '0';
		en <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
