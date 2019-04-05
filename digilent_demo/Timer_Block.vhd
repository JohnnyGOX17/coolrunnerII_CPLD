----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:20:27 11/30/2011 
-- Design Name: 
-- Module Name:    Timer_Block - Behavioral 
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

entity Timer_Block is
    Port ( CLK_1KHZ : in  STD_LOGIC;
           CLK_BASE : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           T_ENABLE : in  STD_LOGIC;
           ANODE : out  STD_LOGIC_VECTOR (3 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (6 downto 0));
end Timer_Block;

architecture Behavioral of Timer_Block is

	COMPONENT LED4Dec1HexDriver
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		CEN : IN std_logic;       
		D_ONES : OUT std_logic_vector(3 downto 0);
		D_TENS : OUT std_logic_vector(3 downto 0);
		D_HUNS : OUT std_logic_vector(3 downto 0);
		D_THOU : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_Bus4to1
	PORT(
		B3 : IN std_logic_vector(3 downto 0);
		B2 : IN std_logic_vector(3 downto 0);
		B1 : IN std_logic_vector(3 downto 0);
		B0 : IN std_logic_vector(3 downto 0);
		SEL : IN std_logic_vector(1 downto 0);          
		Q : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT TwoBitCounter
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;       
		Q : INOUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT AnodeDecoder
	PORT(
		S : IN std_logic_vector(1 downto 0);          
		A : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SevenSegmentDecoder
	PORT(
		S : IN std_logic_vector(3 downto 0);          
		C : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
--SIGNALS

signal S_ONES : STD_LOGIC_VECTOR (3 downto 0);
signal S_TENS : STD_LOGIC_VECTOR (3 downto 0);
signal S_HUNS : STD_LOGIC_VECTOR (3 downto 0);
signal S_THOU : STD_LOGIC_VECTOR (3 downto 0);
signal S_2BIT : STD_LOGIC_VECTOR (1 downto 0);
signal S_4BIT : STD_LOGIC_VECTOR (3 downto 0);

begin

	T0: LED4Dec1HexDriver PORT MAP(
		CLK => CLK_BASE,
		RST => RST,
		CEN => T_ENABLE,
		D_ONES => S_ONES,
		D_TENS => S_TENS,
		D_HUNS => S_HUNS,
		D_THOU => S_THOU
	);
	
	T1: MUX_Bus4to1 PORT MAP(
		B3 => S_THOU,
		B2 => S_HUNS,
		B1 => S_TENS,
		B0 => S_ONES,
		SEL => S_2BIT,
		Q => S_4BIT
	);

	T2: TwoBitCounter PORT MAP(
		CLK => CLK_1KHZ,
		RST => RST,
		Q => S_2BIT
	);
	
	T3: AnodeDecoder PORT MAP(
		S => S_2BIT,
		A => ANODE
	);
	
	T4: SevenSegmentDecoder PORT MAP(
		S => S_4BIT,
		C => CATHODE
	);


	
end Behavioral;	
