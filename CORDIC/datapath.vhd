----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:38:46 12/28/2015 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
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
		
end datapath;

architecture Behavioral of datapath is


component adderSub is
	Port( x : in  STD_LOGIC_VECTOR (24 downto 0);
			y : in  STD_LOGIC_VECTOR (24 downto 0);
         sel : in  STD_LOGIC;
			en : IN STD_LOGIC;
         o : out  STD_LOGIC_VECTOR (24 downto 0));
end component;

COMPONENT LUTteta is
   port( clk : in std_logic; 
			rst : in std_logic; 
			ce  : in std_logic; 
			J_LUT : in std_logic_vector(3 downto 0);
			tanbar : out std_logic_vector(24 downto 0));
end COMPONENT;

COMPONENT shifter is
    Port( x : in  STD_LOGIC_VECTOR (24 downto 0);
          j : in  STD_LOGIC_vector(3 downto 0);
			 clk, rst, ce : std_logic;
          o : out STD_LOGIC_VECTOR (24 downto 0));
end COMPONENT;


COMPONENT my_register is
	port( input : IN std_logic_vector (24 downto 0);
			initvalue : IN std_logic_vector (24 downto 0);
			reset : IN std_logic;
			clock : IN std_logic;
			getInput : IN std_logic;
			output : OUT std_logic_vector (24 downto 0);
			en : IN std_logic);
	
end COMPONENT;

COMPONENT register16 is
	port( input : IN std_logic_vector (24 downto 0);
			reset : IN std_logic;
			clock : IN std_logic;
			en : IN std_logic; 
			output : OUT std_logic_vector (15 downto 0) );
	
end COMPONENT;

signal LUTOutput,Shifted_y,Shifted_x,x,z,temp_y, temp_x, temp_z : std_logic_vector(24 downto 0);
signal aMultKbar : std_logic_vector(49 downto 0);
signal Kbar : std_logic_vector(24 downto 0):="0000000000001001101101110"; --1001101101110
begin
	xRegister: my_register port map(temp_x, Kbar, rst, clk, get_input, x, ce_addersub);
	yRegister: my_register port map(temp_y,aMultKbar(37 downto 13), rst, clk, get_input, y, ce_addersub);
	zRegister: my_register port map(temp_z, "0000000000000000000000000", rst, clk, get_input, z, ce_addersub);
	adderSubX: adderSub port map(x, shifted_y, y(24), ce_adderSub, temp_x);
	adderSubY: adderSub port map(y, shifted_x,not y(24), ce_adderSub, temp_y); --0101011101110
	adderSubZ: addersub port map(z, LUTOutput, y(24), ce_addersub, temp_z);
	shifterY: shifter port map(y, j, clk, rst, ce_shifter, shifted_y);
	shifterX: shifter port map(x, j, clk, rst, ce_shifter, shifted_x);
	luttetaX: LUTteta port map(clk, rst, ce_LUTteta, j, LUTOutput);
	finalReg: register16 port map(z,rst, clk, done, output); 
	
	multyplierX : aMultKbar <= (a & "000000000") * Kbar;
end Behavioral;

