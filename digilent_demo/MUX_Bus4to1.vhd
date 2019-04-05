----------------------------------------------------------------------------------
-- Company: 		 Washington State University
-- Engineer: 		 Alec Wyen
-- 
-- Create Date:    20:47:35 09/04/2011 
-- Design Name: 
-- Module Name:    MUX_Bus4to1 - Behavioral 
-- Project Name:   Stopwatch - Lab 1
-- Target Devices: Digilent Nexus 2 (Spartan 3E - 500K)
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


entity MUX_Bus4to1 is
    Port ( B3 : in  STD_LOGIC_VECTOR (3 downto 0);
           B2 : in  STD_LOGIC_VECTOR (3 downto 0);
           B1 : in  STD_LOGIC_VECTOR (3 downto 0);
           B0 : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end MUX_Bus4to1;

architecture Behavioral of MUX_Bus4to1 is

begin
--Outputs the correct channel of the Ones, Tens, Hundreds, or thousands digits based on 
--the select bits
Q <= B0 when SEL = "00" else
	  B1 when SEL = "01" else
	  B2 when SEL = "10" else
	  B3;

end Behavioral;

