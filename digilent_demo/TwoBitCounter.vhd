----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:27 09/04/2011 
-- Design Name: 
-- Module Name:    TwoBitCounter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TwoBitCounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q   : inout STD_LOGIC_VECTOR (1 downto 0));
end TwoBitCounter;


architecture Behavioral of TwoBitCounter is

--signal FEEDBACK : STD_LOGIC_VECTOR (1 downto 0);

begin
--A simple 2 bit counter, counts from 0 to 3 and then rolls over
process (CLK, RST)
begin
   if RST ='1' then   
      Q <= "00";
   elsif (CLK'event and CLK='1') then 
      if (Q = "11") then
			Q <= "00";
		else
			Q <= Q + 1;
		end if;
   end if;
end process;
end Behavioral;

