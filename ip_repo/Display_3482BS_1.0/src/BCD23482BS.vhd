
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD23482BS is
generic(
    rst_en : std_logic :='1');
port(
    rst: in std_logic;
    contador : in std_logic_Vector(1 downto 0);
    bcd_h : in std_logic_vector(3 downto 0);
    bcd_t : in std_logic_vector(3 downto 0);
    bcd_u : in std_logic_vector(3 downto 0);
    A: out std_logic;
    B: out std_logic;
    C: out std_logic;
    D : out std_logic;
    E : out std_logic;
    F : out std_logic;
    G : out std_logic
);
end BCD23482BS;

architecture Behavioral of BCD23482BS is
signal digito: std_logic_vector(3 downto 0);

begin
process(rst, contador)
begin
    if rst=rst_en then
        digito<="1111";
    elsif contador="00" then
        digito<=bcd_u;
    elsif contador="01" then
        digito<=bcd_t;
    elsif contador="10" then
        digito<=bcd_h;
    elsif contador="11" then
        digito<=(others=>'0');
    end if;
    
end process;

process (digito)

begin
    A<='0';
    B<='0';
    C<='0';
    D<='0';
    E<='0';
    F<='0';
    G<='0';
    case digito is
        when "0000" =>
            G<='1';
        when "0001" =>
            A<='1';
            D<='1';
            E<='1';
            F<='1';
            G<='1';
         when "0010" =>
            C<='1';
            F<='1';
         when "0011" =>
            E<='1';
            F<='1';
         when "0100" =>
            A<='1';
            D<='1';
            E<='1';
         when "0101" =>
            B<='1';
            E<='1';
         when "0110" =>
            B<='1';
         when "0111" =>
            D<='1';
            E<='1';
            F<='1';
            G<='1';
         when "1000" =>
         when "1001" =>
            D<='1';
            E<='1';
         when others => null;
     end case;
            
            
end process;
end Behavioral;
