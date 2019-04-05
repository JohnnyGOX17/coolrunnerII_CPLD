----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:26 09/08/2011 
-- Design Name: 
-- Module Name:    SevenSegmentDecoder - Behavioral 
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

entity SevenSegmentDecoder is
    Port ( S : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (6 downto 0));
end SevenSegmentDecoder;

architecture Behavioral of SevenSegmentDecoder is

begin
--Decodes a 4 bit value into its hexidecimal counterpart
--and sends a signal to the cathodes in the correct pattern
C <= "1000000" when (S = "0000") else --0
	  "1111001" when (S = "0001") else --1
	  "0100100" when (S = "0010") else --2
	  "0110000" when (S = "0011") else --3
	  "0011001" when (S = "0100") else --4
	  "0010010" when (S = "0101") else --5
	  "0000010" when (S = "0110") else --6
	  "1111000" when (S = "0111") else --7
	  "0000000" when (S = "1000") else --8
	  "0011000" when (S = "1001") else --9
	  "0001000" when (S = "1010") else --A
	  "0000011" when (S = "1011") else --B
	  "1000110" when (S = "1100") else --C
	  "0100001" when (S = "1101") else --D
	  "0000110" when (S = "1110") else --E
	  "0001110";							  --F
	  
end Behavioral;

