library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity y3482BS is
generic (
    frec : integer := 50000;
    rst_en : std_logic := '1');
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
end y3482BS;

architecture Behavioral of y3482BS is
component reloj
    generic(
            frec : integer := 1000;
            rst_en : std_logic := '1'
           );
      Port (
      rst :in std_logic;
      clk : in std_logic;
      relojito : out std_logic
       );
    end component;
    
component Bin2BCD
generic(
    rst_en :  std_logic
    );
Port ( 
  clk:in std_logic;
  rst :in std_logic;
  hex_in : in std_logic_vector(7 downto 0);
  bcd_hun : out std_logic_Vector(3 downto 0);
  bcd_ten : out std_logic_Vector(3 downto 0);
  bcd_uni : out std_logic_Vector(3 downto 0)
  
  );
end component;


component multiplexor
generic (
    rst_en : std_logic);
port(
    rst, clk : in std_logic;
    reloj : in std_logic;
    contador : out std_logic_vector(1 downto 0);
    DIG1 : out std_logic;
    DIG2 : out std_logic;
    DIG3 : out std_logic;
    DIG4 : out std_logic
    );
 end component;
 
component BCD23482BS
generic( rst_en : std_logic);
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
end component;

signal clk_1K : std_logic;
signal centenas, decenas, unidades : std_logic_vector(3 downto 0);
signal selector : std_logic_vector(1 downto 0);
begin
relojit: entity work.reloj
    generic map(
        frec => frec,
        rst_en => rst_en
        )
    port map(
        rst => rst,
        clk => clk,
        relojito => clk_1k);
        
B2BCD: entity work.Bin2BCD
    generic map(
        rst_en => rst_en
        )
    port map(
        clk => clk,
        rst => rst,
        hex_in => numero,
        bcd_hun => centenas,
        bcd_ten => decenas,
        bcd_uni => unidades
        );
Mux: entity work.Multiplexor
    generic map(
        rst_en => rst_en
        )
        port map(
            rst => rst,
            clk => clk,
            reloj => clk_1k,
            contador => selector,
            DIG1 => DIG4,
            DIG2 => DIG3,
            DIG3 => DIG2,
            DIG4 => DIG1
            );
            
BC23482: entity work.BCD23482BS
        generic map(
            rst_en => rst_en)
        port map(
            rst => rst,
            contador => selector,
            bcd_h => centenas,
            bcd_t => decenas,
            bcd_u => unidades,
            A => A,
            B => B,
            C => C,
            D => D,
            E => E,
            F => F,
            G => G);
            
      
end Behavioral;
