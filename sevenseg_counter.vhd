----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:07 08/14/2022 
-- Design Name: 
-- Module Name:    sevenseg_counter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity sevenseg_counter is	
generic(
second_length : integer := 26
);
port(
clk		: in std_logic;
DVE 	: out std_logic;
Sevseg	: out	unsigned (7 downto 0); -- active low
sel		: out	unsigned (3 downto 0)  -- active low
);
end sevenseg_counter;

architecture Behavioral of sevenseg_counter is
constant	sel_int 	: 	unsigned (3 downto 0) 	:= "1110"; 
signal	BCD 		:	unsigned (3 downto 0)	:=(others => '0');
signal	RTC		:	unsigned (second_length-1 downto 0)	:=(others => '0');

begin

	sel <= sel_int;										-- select 7seg
								
	
	process(clk)
	begin
		if rising_edge(clk) then						-- all of the code must be inside "rising_edge" condition 
																--	otherwise porcess sensitivity list need another signal and 
																-- will be a asynch system insted of synch system
			RTC <= RTC + 1;
			
			if RTC = to_unsigned(49999999,26) then
				BCD <= BCD + 1;
			end if;
		
		
		DVE <= '0';										-- data valid LED
		case BCD is  									-- sevenseg( dp downto a)
			when "0000" =>
					Sevseg	<=	not("00111111");
					
			when "0001" =>
					Sevseg	<=	not("00000110");
					
			when "0010" =>
					Sevseg	<=	not("01011011");

			when "0011" =>
					Sevseg	<=	not("01001111");

			when "0100" =>
					Sevseg	<=	not("01100110");

			when "0101" =>
					Sevseg	<=	not("01101101");

			when "0110" =>
					Sevseg	<=	not("01111101");

			when "0111" =>
					Sevseg	<=	not("00000111");

			when "1000" =>
					Sevseg	<=	not("01111111");

			when "1001" =>
					Sevseg	<=	not("01100111");
					
			when "1010" =>										-- 7seg overflow 
					Sevseg	<=	not("00111111");			-- in over flow "sevseg must has value event "case" jump to
																	-- to BCD = 0 instantly
					BCD		<= (others => '0');

			when others =>
					Sevseg	<=	not("00000000");
					DVE <= '1';
		end case;
		
	end if;
	end process;
	
end Behavioral;

