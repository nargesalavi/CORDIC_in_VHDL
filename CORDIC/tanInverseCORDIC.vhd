----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:17 12/29/2015 
-- Design Name: 
-- Module Name:    tanInverseCORDIC - Behavioral 
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

entity tanInverseCORDIC is
	port(
		start : IN std_logic;
		input : IN std_logic_vector (15 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;
		done : INOUT std_logic;
		output : OUT std_logic_vector (15 downto 0) );
end tanInverseCORDIC;

architecture Behavioral of tanInverseCORDIC is
	
	
COMPONENT controller is
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
		
end COMPONENT;


COMPONENT  datapath is
	port(
		clk : in std_logic; 
		rst : in std_logic; 
		a : IN std_logic_vector (15 downto 0);
		get_input : IN std_logic;
		ce_shifter : IN std_logic;
		ce_LUTteta : IN std_logic;
		ce_adderSub : IN std_logic;
		done : IN std_logic;
		j : IN std_logic_vector (3 downto 0);
		y : inout std_logic_vector (24 downto 0);
		output : OUT std_logic_vector(15 downto 0) );
		
end COMPONENT;

signal get_input,ce_shifter,ce_adderSub,ce_LUTteta : std_logic;
signal j : std_logic_vector(3 downto 0);
signal y :std_logic_vector(24 downto 0);

begin
	
	contollerX : controller port map(start, clk, rst, get_input, ce_shifter, ce_LUTteta, ce_adderSub, j, y, done);
	datapathX : datapath port map(clk, rst, input, get_input, ce_shifter, ce_LUTteta, ce_adderSub, done, j, y, output);


end Behavioral;

