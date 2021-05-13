library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity r382BS_tb is
end r382BS_tb;

architecture Behavioral of r382BS_tb is
component y3482BS
generic (
    frec : integer;
    rst_en : std_logic);
port (
    clk : in std_logic;
    rst : in std_logic;
    numero : in std_logic_vector(7 downto 0);
    A : out std_logic;
    B : out std_logic;
    C : out std_logic;
    D : out std_logic;
    E : out std_logic;
    F : out std_logic;
    G : out std_logic;
    DIG1 : out std_logic;
    DIG2 : out std_logic;
    DIG3 : out std_logic;
    DIG4 : out std_logic
    );
 end component;
 
constant frec : integer := 50000;
constant rst_en : std_logic := '1';
signal clk :  std_logic := '0';
signal rst :  std_logic;
signal numero :  std_logic_vector(7 downto 0);
signal A :  std_logic;
signal B :  std_logic;
signal C :  std_logic;
signal D :  std_logic;
signal E :  std_logic;
signal F :  std_logic;
signal G :  std_logic;
signal DIG1 :  std_logic;
signal DIG2 :  std_logic;
signal DIG3 :  std_logic;
signal DIG4 :  std_logic;
begin

DUT: entity work.y3482BS
generic map(
    frec => frec,
    rst_en => rst_en)
port map(
    clk => clk,
    rst => rst,
    numero => numero,
    A => A,
    B => B,
    C => C,
    D => D,
    E => E,
    F => F,
    G => G,
    DIG1 => DIG1,
    DIG2 => DIG2,
    DIG3 => DIG3,
    DIG4 => DIG4);

rst <= '1', '0' after 30ns;
clk <= not clk after 10ns;
numero<=(others=>'1');
end Behavioral;
