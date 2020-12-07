--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:08:29 12/29/2015
-- Design Name:   
-- Module Name:   Z:/Desktop/cadCA4/CORDIC/CORDICTB.vhd
-- Project Name:  CORDIC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tanInverseCORDIC
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
 
ENTITY CORDICTB IS
END CORDICTB;
 
ARCHITECTURE behavior OF CORDICTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tanInverseCORDIC
    PORT(
         start : IN  std_logic;
         input : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         done : INOUT  std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal input : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

	--BiDirs
   signal done : std_logic;

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tanInverseCORDIC PORT MAP (
          start => start,
          input => input,
          clk => clk,
          rst => rst,
          done => done,
          output => output
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

      wait for clk_period;

      wait for clk_period;
		start <='1';
		wait for clk_period;
		input <= "0000000000001001";
		start <= '0';
		wait for clk_period*40;
		wait for clk_period;
		start <='1';
		wait for clk_period;
		input <= "0000000000000000";
		start <= '0';
		wait for clk_period*40;
   end process;

END;
