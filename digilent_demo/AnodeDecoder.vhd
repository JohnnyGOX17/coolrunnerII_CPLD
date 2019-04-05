----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:36:48 09/08/2011 
-- Design Name: 
-- Module Name:    AnodeDecoder - Behavioral 
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

entity AnodeDecoder is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
           A : out  STD_LOGIC_VECTOR (3 downto 0));
end AnodeDecoder;

architecture Behavioral of AnodeDecoder is

begin
--Outputs Anode position based on 2-Bit Select Bus.
--Moves from LSB to MSB
A <= "1110" when S = "00" else
	  "1101" when S = "01" else
	  "1011" when S = "10" else
	  "0111";
end Behavioral;

