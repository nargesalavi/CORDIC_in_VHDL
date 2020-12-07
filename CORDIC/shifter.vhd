----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:59 12/28/2015 
-- Design Name: 
-- Module Name:    shifter - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

entity shifter is
    Port ( x : in  STD_LOGIC_VECTOR (24 downto 0);
           j : in  STD_LOGIC_vector(3 downto 0);
			  clk, rst, ce : std_logic;
           o : out STD_LOGIC_VECTOR (24 downto 0));
end shifter;

architecture shifter_Arch of shifter is
signal so : std_logic_vector(24 downto 0);
begin

	process(j, clk)
	begin
	case(j)is
		when "0000" =>
			so <= x;
		when "0001" =>
				so <= (x(24) & x( 24 downto 1 ));
		when "0010" =>
				so <= (x(24) & x(24) & x( 24 downto 2 ));
		when "0011" =>
				so <= (x(24) & x(24) & x(24) & x( 24 downto 3 ));
		when "0100" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x( 24 downto 4 ));
		when "0101" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 5 ));
		when "0110" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 6 ));
		when "0111" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 7 ));
		when "1000" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 8 ));
		when "1001" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 9 ));
		when "1010" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 10 ));
		when "1011" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 11 ));
		when "1100" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 12 ));
		when "1101" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 13 ));
		when "1110" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 14 ));
		when "1111" =>
				so <= (x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x(24) & x( 24 downto 15 ));
		when others =>
			so <= (others => '0');
	end case;
	end process;
	
	
	process(clk)
	begin
		if( rising_edge( clk ) and ce = '1' ) then
			if( rst = '1' ) then
				o <= (others => '0');
			else
				o <= so;
			end if;
		end if;
	end process;
end shifter_Arch;