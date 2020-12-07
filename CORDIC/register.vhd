----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:49:11 12/29/2015 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity my_register is
	port( input : IN std_logic_vector (24 downto 0);
			initvalue : IN std_logic_vector (24 downto 0);
			reset : IN std_logic;
			clock : IN std_logic;
			getInput : IN std_logic;
			output : OUT std_logic_vector (24 downto 0);
			en : IN std_logic);
	
end my_register;

architecture Behavioral of my_register is

begin
	process (clock, reset , getInput, initvalue)
	begin
		if reset='1'  or getInput  = '1' then   
			output <= initvalue;
		elsif (clock'event and clock='0' and en = '1') then 
			output <= input;
		end if;
	end process;
end Behavioral;

