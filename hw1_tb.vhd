library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hw1_tb is
end hw1_tb;

architecture Behavioral of hw1_tb is

component twoconter
	port (rst      :in  STD_LOGIC;
	      clk      :in  STD_LOGIC;
		  count1_o :out STD_LOGIC_vector(7 downto 0);
		  count2_o :out STD_LOGIC_vector(7 downto 0));
end component;
signal reset,clk:std_logic;
signal count1_o,count2_o:STD_LOGIC_vector(7 downto 0);

begin
dut:twoconter port map (clk=>clk,rst=>reset,count1_o=>count1_o,count2_o=>count2_o);

clock_process:process
begin
	clk<='0';
	wait for 10 ns;
	clk<='1';
	wait for 10 ns;
end process;

stim_proc: process
begin
	reset<='0';
	wait for 20 ns;
	reset<='1';
	wait ;
end process;

end Behavioral;
