library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prescaler_tb is
end prescaler_tb;

architecture Behavioral of prescaler_tb is
component preescaler
generic(
    rst_en : std_logic:='1';
    tamano : integer :=1000;
    tamano_med : integer := 500);
  Port ( 
  rst : in std_logic;
  clk : in std_logic;
  pulsos : out std_logic);
end component;

signal rst : std_logic;
signal clk : std_logic:='0';
signal pulsos : std_logic;
constant rst_en : std_logic := '1';
constant tamano : integer := 1000;
constant tamano_med : integer :=500;

begin
DUT: entity work.prescaler
generic map(
    rst_en, tamano, tamano_med)
port map(
    rst => rst,
    clk => clk,
    pulsos => pulsos);


clk <= not clk after 10ns;
rst <= '1', '0' after 30ns;

end Behavioral;
