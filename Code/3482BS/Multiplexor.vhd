library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Multiplexor is
generic (
rst_en : std_logic :='1'
);
port(
    rst, clk : in std_logic;
    reloj : in std_logic;
    contador : out std_logic_vector(1 downto 0);
    DIG1 : out std_logic;
    DIG2 : out std_logic;
    DIG3 : out std_logic;
    DIG4 : out std_logic
    );
end Multiplexor;

architecture Behavioral of Multiplexor is
--signal contador:std_logic_vector(1 downto 0);
begin
process (rst,  reloj)
variable cont: unsigned(1 downto 0);
begin
    if rst=rst_en then
        DIG1<='0';
        DIG2<='0';
        DIG4<='0';
        DIG3<='0';
        cont:=(others=>'0');
     elsif reloj'event and reloj='1' then
        cont:=cont+1;
        DIG1<='0';
        DIG2<='0';
        DIG3<='0';
        DIG4<='0';
        if cont="00" then
            DIG1<='1';
        elsif cont="01" then
            DIG2<='1';
        elsif cont="10" then
            DIG3<='1';
        elsif cont="11" then
            DIG4<='1';
        end if;
     end if; 
     contador<=std_logic_vector(cont);
end process;


end Behavioral;
