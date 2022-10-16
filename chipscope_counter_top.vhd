----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:12 10/13/2022 
-- Design Name: 
-- Module Name:    chipscope_counter_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--	this is a simple chipscope analizing just put sevseg value inside trigger at chipscope software and wait to recive data
--  note we must fist program the FPGA then run chipscope software bcz chipscope read from FPGA in real time 
--  chipscope is a real time analizer and we can test a lot of senarios in a few minute that can take a decade to do it with ISIM
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chipscope_counter_top is
port(
	clk_top		:	in		std_logic;
	DVE_top		:	out 	std_logic;
	Sevseg_top 	:	OUT 	unsigned(7 downto 0);
	sel_top 		: 	OUT 	unsigned(3 downto 0)
);
end chipscope_counter_top;

architecture Behavioral of chipscope_counter_top is

	signal CONTROL0 		: STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal Sevseg_top_w 	: 	unsigned(7 downto 0);
 
	component icon
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

	end component;

	component ILA
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));

	end component;

begin
	Sevseg_top	<=	Sevseg_top_w ;
	-- instant module(vhdl method)
	Inst_sevenseg_counter: entity work.sevenseg_counter 
	PORT MAP(
		clk =>		clk_top ,
		DVE =>		DVE_top ,
		Sevseg => 	Sevseg_top_w ,
		sel =>		sel_top 
	);
	
	ICON_TOP : icon
  port map (
    CONTROL0 => CONTROL0);
	 
	 ILA_top : ILA
  port map (
    CONTROL => CONTROL0,
    CLK => clk_top,
    TRIG0 => std_logic_vector(Sevseg_top_w));

end Behavioral;

