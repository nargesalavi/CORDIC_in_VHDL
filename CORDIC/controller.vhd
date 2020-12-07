----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:51:37 12/29/2015 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
	port(
		start : in std_logic;
		clk : in std_logic; 
		rst : in std_logic; 
		get_input : out std_logic;
		ce_shifter : out std_logic;
		ce_LUTteta : out std_logic;
		ce_adderSub : out std_logic;
		j : out std_logic_vector (3 downto 0);
		y : in std_logic_vector (24 downto 0);
		done : out std_logic);
		
end controller;

architecture Behavioral of controller is


-- This is a sample state-machine using enumerated types.
-- This will allow the synthesis tool to select the appropriate
-- encoding style and will make the code more readable.
 
--Insert the following in the architecture before the begin keyword
   --Use descriptive names for the states, like st1_reset, st2_search
   type state_type is (st1_idle, st2_start, st3_getInput, st4_shlEnables, st5_asEnable, st6_done ); 
   signal state, next_state : state_type; 
   --Declare internal signals for all outputs of the state-machine
   signal temp_get_input ,temp_ce_shifter ,temp_ce_LUTteta ,temp_ce_adderSub ,temp_done : std_logic;
	signal temp_j :std_logic_vector (3 downto 0);
	

begin

--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (rst = '1') then
            state <= st1_idle;
         else
            state <= next_state;
            get_input <= temp_get_input;
				ce_shifter <= temp_ce_shifter;
				ce_LUTteta <= temp_ce_LUTteta;
				ce_adderSub <= temp_ce_adderSub;
				done <= temp_done;
				j <= temp_j;
         end if;        
      end if;
   end process;
 
 
   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (next_state)
   begin
		temp_get_input <= '0';
		temp_ce_shifter <= '0';
		temp_ce_LUTteta <= '0';
		temp_ce_adderSub <= '0';
		if next_state = st1_idle then
			temp_done <= '0';
			temp_j <= "0000";
      elsif next_state = st3_getInput then
         temp_get_input <= '1';
      elsif next_state = st4_shlEnables then
			temp_ce_shifter <= '1';
			temp_ce_LUTteta <= '1';
		elsif next_state = st5_asEnable then
			temp_j <= temp_j + 1;
			temp_ce_adderSub <= '1';
		elsif next_state = st6_done then
			temp_done <= '1';
      end if;
   end process;
 
   NEXT_STATE_DECODE: process (state, y, temp_j, start)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
		
         when st1_idle =>
            if start = '1' then
               next_state <= st2_start;
            end if;
				
         when st2_start =>
            if start = '0' then
               next_state <= st3_getInput;
            end if;
				
         when st3_getInput =>
            next_state <= st4_shlEnables;
				
         when st4_shlEnables =>
				next_state <=st5_asEnable;
				
			when st5_asEnable =>
				if (temp_j<"1101") then  --y /= "0000000000000000000000000" or 
					next_state <= st4_shlEnables;
				else
					next_state <= st6_done;
				end if;
				
			when st6_done =>
				next_state <= st1_idle;
				
      end case;      
   end process;

				
end Behavioral;

