library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity prescaler is
generic(
    rst_en : std_logic:='1';
    tamano : integer :=1000;
    tamano_med : integer := 500);
  Port ( 
  rst : in std_logic;
  clk : in std_logic;
  pulsos : out std_logic);
end prescaler;

architecture Behavioral of prescaler is
signal cont: unsigned(9 downto 0);
begin
process(clk, rst)

begin
    if rst= rst_en then 
        cont<=(others=>'0');
    elsif rising_edge(clk) then
        cont<=cont+1;
        if cont>=tamano then 
            cont<=(others=>'0');
        end if;
    end if;
end process;

process(clk , rst)

begin
    if rst= rst_en then 
        pulsos<='0';
    elsif rising_edge(clk) then
        pulsos<='0';
        if cont <= tamano_med-1 then 
            pulsos<='1';
        end if;
    end if;
end process;
end Behavioral;
