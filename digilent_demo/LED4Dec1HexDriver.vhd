----------------------------------------------------------------------------------
-- Company: 		Washington State University
-- Engineer: 		Alec Wyen
-- 
-- Create Date:    01:37:46 09/06/2011 
-- Design Name: 
-- Module Name:    LED4Dec1HexDriver - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity LED4Dec1HexDriver is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CEN : in  STD_LOGIC;
           D_ONES : out  STD_LOGIC_VECTOR (3 downto 0);
           D_TENS : out  STD_LOGIC_VECTOR (3 downto 0);
           D_HUNS : out  STD_LOGIC_VECTOR (3 downto 0);
           D_THOU : out  STD_LOGIC_VECTOR (3 downto 0)
           );
end LED4Dec1HexDriver;

architecture Behavioral of LED4Dec1HexDriver is

signal ONE_SIGNAL : STD_LOGIC_VECTOR (3 downto 0);
signal TEN_SIGNAL : STD_LOGIC_VECTOR (3 downto 0);
signal HUN_SIGNAL : STD_LOGIC_VECTOR (3 downto 0);
signal THO_SIGNAL : STD_LOGIC_VECTOR (3 downto 0);

signal TC_ONES : STD_LOGIC;
signal TC_TENS : STD_LOGIC;
signal TC_HUNS : STD_LOGIC;
signal TC_THOU : STD_LOGIC;

constant DECIMAL_MAX : STD_LOGIC_VECTOR (3 downto 0) := "1001";
constant DECIMAL_MIN : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

process(CLK, RST, CEN)
begin
	if (RST = '1') then
		ONE_SIGNAL <= "0000";
		TEN_SIGNAL <= "0000";
		HUN_SIGNAL <= "0000";
		THO_SIGNAL <= "0000";

	elsif (CLK'event and CLK = '1') then
		if CEN = '1' then
		
			if ONE_SIGNAL = DECIMAL_MAX then
				ONE_SIGNAL <= "0000";
				TC_ONES <= '0';
			elsif ONE_SIGNAL = "1000" then
				TC_ONES <= '1';
				ONE_SIGNAL <= ONE_SIGNAL + 1;
			else
				ONE_SIGNAL <= ONE_SIGNAL + 1;
				TC_ONES <= '0';
			end if;
			
			if TC_ONES = '1' then
			
				if TEN_SIGNAL = DECIMAL_MAX then
					TEN_SIGNAL <= "0000";
					TC_TENS <= '0';
				elsif TEN_SIGNAL = "1000" then
					TC_TENS <= '1';
					TEN_SIGNAL <= TEN_SIGNAL + 1;
				else
					TEN_SIGNAL <= TEN_SIGNAL + 1;
					TC_TENS <= '0';
				end if;
				
			end if;
			
			if TC_ONES = '1' and TC_TENS = '1' then
			
				if HUN_SIGNAL = DECIMAL_MAX then
					HUN_SIGNAL <= "0000";
					TC_HUNS <= '0';
				elsif HUN_SIGNAL = "1000" then
					TC_HUNS <= '1';
					HUN_SIGNAL <= HUN_SIGNAL + 1;
				else 
					HUN_SIGNAL <= HUN_SIGNAL + 1;
					TC_HUNS <= '0';
				end if;
				
			end if;
			
			if TC_ONES = '1' and TC_TENS = '1' and TC_HUNS = '1' then
			
				if THO_SIGNAL = DECIMAL_MAX then
					THO_SIGNAL <= "0000";
					TC_THOU <= '0';
				elsif THO_SIGNAL = "1000" then
					TC_THOU <= '1';
					THO_SIGNAL <= THO_SIGNAL + 1;
				else
					THO_SIGNAL <= THO_SIGNAL + 1;
					TC_THOU <= '0';
				end if;
				
			end if;
		end if;
	end if;

end process;
D_ONES <= ONE_SIGNAL;
D_TENS <= TEN_SIGNAL;
D_HUNS <= HUN_SIGNAL;
D_THOU <= THO_SIGNAL;


end Behavioral;

