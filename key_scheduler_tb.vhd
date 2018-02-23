--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:41:09 02/19/2018
-- Design Name:   
-- Module Name:   C:/Users/HP/Desktop/University/Academics/Capstone/aes128_vhdl/aes128_v4/key_scheduler_tb.vhd
-- Project Name:  aes128_v4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_scheduler
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
 
ENTITY key_scheduler_tb IS
END key_scheduler_tb;
 
ARCHITECTURE behavior OF key_scheduler_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_scheduler
    PORT(
         clk : IN  std_logic;
         w : IN  std_logic;
         en : IN  std_logic;
         dec : IN  std_logic;
         round_number : IN  std_logic_vector(3 downto 0);
         original_key : IN  std_logic_vector(127 downto 0);
         round_key : OUT  std_logic_vector(127 downto 0);
         keys_filled : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal w : std_logic := '0';
   signal en : std_logic := '0';
   signal dec : std_logic := '0';
   signal round_number : std_logic_vector(3 downto 0) := (others => '0');
   signal original_key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal round_key : std_logic_vector(127 downto 0);
   signal keys_filled : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_scheduler PORT MAP (
          clk => clk,
          w => w,
          en => en,
          dec => dec,
          round_number => round_number,
          original_key => original_key,
          round_key => round_key,
          keys_filled => keys_filled
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
      en <= '0';
		w <= '0';
		dec <= '0';
		round_number <= x"0";
      wait for 100 ns;	
		original_key <= x"000102030405060708090a0b0c0d0e0f";
		w <= '1';
      wait for clk_period*1;
		w <='0';
		en <= '1';
		wait for clk_period;
		round_number <= x"1";
		wait for clk_period;
		round_number <= x"2";
		wait for clk_period;
		round_number <= x"3";
		wait for clk_period;
		round_number <= x"4";
		wait for clk_period;
		round_number <= x"5";
		wait for clk_period;
		round_number <= x"6";
		wait for clk_period;
		round_number <= x"7";
		wait for clk_period;
		round_number <= x"8";
		wait for clk_period;
		round_number <= x"9";
		wait for clk_period;
		round_number <= x"a";

      wait;
   end process;

END;
