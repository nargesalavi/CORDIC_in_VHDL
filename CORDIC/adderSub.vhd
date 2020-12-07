----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:53 12/28/2015 
-- Design Name: 
-- Module Name:    adderSub - Behavioral 
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
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adderSub is
	Port ( x : in  STD_LOGIC_VECTOR (24 downto 0);
           y : in  STD_LOGIC_VECTOR (24 downto 0);
           sel : in  STD_LOGIC;
			  en : IN STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (24 downto 0));

end adderSub;

architecture Behavioral of adderSub is

begin
process (en)
	begin 
		if(en = '1') then
			if (sel = '1' ) then
				o <= x - y;
			else
				o <= x + y;
			end if;
		end if;
end process;


end Behavioral;

