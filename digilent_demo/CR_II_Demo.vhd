----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:34 04/12/2012 
-- Design Name: 
-- Module Name:    CR_II_Demo - Behavioral 
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

entity CR_II_Demo is
    Port ( CLK : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (1 downto 0);
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           CAT : out  STD_LOGIC_VECTOR (7 downto 0);
           ANO : out  STD_LOGIC_VECTOR (3 downto 0);
           LD : out  STD_LOGIC_VECTOR (3 downto 0));
end CR_II_Demo;

architecture Behavioral of CR_II_Demo is

	COMPONENT clk_div
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		BASE : OUT std_logic;
		DISP : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Timer_Block
	PORT(
		CLK_1KHZ : IN std_logic;
		CLK_BASE : IN std_logic;
		RST : IN std_logic;
		T_ENABLE : IN std_logic;          
		ANODE : OUT std_logic_vector(3 downto 0);
		CATHODE : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;





signal s_rst : std_logic;
signal s_base : std_logic;
signal s_disp : std_logic;
signal s_anode: std_logic_vector(3 downto 0);




begin



	
	s_rst <=  not BTN(0);
	CAT(7) <= s_anode(1);
	ANO <= s_anode;
	LD(2 downto 0) <= "111" when SW = "00" else
							"110" when SW = "01" else
							"101" when SW = "10" else
							"011";
	LD(3) <= s_base;

	Inst_clk_div: clk_div PORT MAP(
		CLK => CLK,
		RST => s_rst,
		BASE => s_base,
		DISP => s_disp
	);
	
	Inst_Timer_Block: Timer_Block PORT MAP(
		CLK_1KHZ => s_disp,
		CLK_BASE => s_base,
		RST => s_rst,
		T_ENABLE => BTN(1),
		ANODE => s_anode,
		CATHODE => CAT(6 downto 0)
	);

end Behavioral;

