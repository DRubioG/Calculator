library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity reloj is
    generic(
        frec : integer := 1000;
        rst_en : std_logic :='1'
       );
  Port (
  rst :in std_logic;
  clk : in std_logic;
  relojito : out std_logic
   );
end reloj;

architecture Behavioral of reloj is

begin
process(clk, rst)
variable contador : unsigned(25 downto 0);
begin
    if rst=rst_en then
        contador:=(others=>'0');
        relojito<='0';
    elsif(clk'event and clk='1') then
        contador:=contador+1;
        relojito<='0';
        if(contador=frec)then
            relojito<='1';
            contador:=(others=>'0');
        end if;
     end if;
end process;

end Behavioral;