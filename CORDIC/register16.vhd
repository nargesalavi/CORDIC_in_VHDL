----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:02 12/29/2015 
-- Design Name: 
-- Module Name:    register16 - Behavioral 
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
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:49:11 12/29/2015 
-- Design Name: 
-- Module Name:    register16 - Behavioral 
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

entity register16 is
	port( input : IN std_logic_vector (24 downto 0);
			reset : IN std_logic;
			clock : IN std_logic;
			en : IN std_logic; 
			output : OUT std_logic_vector (15 downto 0) );
	
end register16;

architecture Behavioral of register16 is

begin
	process (clock, reset)
	begin
		if reset='1' then   
			output <= "0000000000000000";
		elsif (clock'event and clock='1' and en = '1' ) then 
			output <= input(15 downto 0);
		end if;
	end process;
end Behavioral;

