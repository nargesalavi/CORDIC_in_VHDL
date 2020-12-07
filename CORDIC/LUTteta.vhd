----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:02:55 12/28/2015 
-- Design Name: 
-- Module Name:    LUTteta - Behavioral 
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
Library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity LUTteta is
  port(
	clk : in std_logic; 
	rst : in std_logic; 
	ce  : in std_logic; 
  J_LUT : in std_logic_vector(3 downto 0);
  tanbar : out std_logic_vector(24 downto 0));
end entity;

architecture look_up_table of LUTteta is

type rom is array (0 to 12) of std_logic_vector(24 downto 0);

begin
  process(clk, J_LUT)
	variable tanbar_lut : rom := (
		"0000000000001100100100001", --11010.1001000010100
		"0000000000000111011010110",
		"0000000000000011111010110",
		"0000000000000001111111010",
		"0000000000000000111111111",
		"0000000000000000011111111",
		"0000000000000000001111111",
		"0000000000000000000111111",
		"0000000000000000000011111",
		"0000000000000000000001111",
		"0000000000000000000000111",
		"0000000000000000000000011",
		"0000000000000000000000001");
		
    begin
		if ( rising_edge( clk) and ce = '1' ) then 
			if( rst = '1' ) then 
				tanbar <= (others => '0');
			else
				tanbar <= tanbar_lut(to_integer(unsigned(J_LUT)));
			end if;
		end if;
    end process;
	 
end architecture;

