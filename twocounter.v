
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity twoconter is
    Port (rst      :in  STD_LOGIC;
	      clk      :in  STD_LOGIC;
		  count1_o :out STD_LOGIC_vector(7 downto 0);
		  count2_o :out STD_LOGIC_vector(7 downto 0));
end twoconter;

architecture Behavioral of twoconter is

signal count1:STD_LOGIC_vector(7 downto 0);
signal count2:STD_LOGIC_vector(7 downto 0);
--signal flag:STD_LOGIC_vector

type FSM_STATE is (s0,s1);
signal state:FSM_STATE;

begin

count1_o<= count1;
count2_o<= count2;

FSM: process(clk,rst,count1,count2)
begin
    if rst= '0' then
	   state <= s0;
	elsif clk'event and clk='1' then
		case state is
			when s0 =>
				if count1="0000"&"1001" then
					state<=s1;
					
				end if;
			when s1 =>
				if count2="0100"&"1111" then
					state<=s0;
				end if;
			when others=>
				null;
		end case;
	end if;
end process FSM;

counter1: process(clk,rst,state)
begin
	if rst ='0' then
		count1<="0000"&"0000";
	elsif clk'event and clk='1' then
		case state is
			when s0 =>
				if count1 ="0000"&"1001" then
					count1<="0000"&"0000";
				else count1<=count1+'1';	
				end if;	
			when s1 =>
				count1<="0000"&"0000";
			when others =>
				null;
		end case;
	end if;
end process counter1;

counter2: process(clk,rst,state)
begin
	if rst ='0' then
		count2<="1111"&"1101";
	elsif clk'event and clk='1' then
		case state is
			when s0 =>
				count2<="1111"&"1101";
			when s1 =>
				if count2 ="0100"&"1111" then
					count2<="1111"&"1101";
				else count2<=count2-'1';	
				end if;			
			when others =>
				null;
		end case;
	end if;
end process counter2;
			
		
end Behavioral;
