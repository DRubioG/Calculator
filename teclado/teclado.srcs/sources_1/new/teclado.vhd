library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity teclado is
    generic(
        rst_en : std_logic := '1');
  Port ( 
        clk : in std_logic;
        rst : in std_logic;
        teclas_entrada : in std_logic_vector(3 downto 0);
        teclas_salida : out std_logic_vector(3 downto 0);
        
        ---salidas a la FPGA
        act_teclado : out std_logic;
        valor_teclado : out std_logic_vector(3 downto 0)
  );
end teclado;

architecture Behavioral of teclado is
signal cont : unsigned(1 downto 0);
component prescaler is
generic(
    rst_en : std_logic:='1';
    tamano : integer :=1000;
    tamano_med : integer := 500);
  Port ( 
  rst : in std_logic;
  clk : in std_logic;
  pulsos : out std_logic);
end component;

component generador_pulsos is
generic(
        rst_en : std_logic := '1');
  Port ( 
        clk : in std_logic;
        rst : in std_logic;
        teclas_salida : out std_logic_vector(3 downto 0)
  );
end component;

component lector_pulsos is
generic(
        rst_en : std_logic := '1');
  Port ( 
        clk : in std_logic;
        rst : in std_logic;
        teclas_entrada : in std_logic_vector(3 downto 0);
        teclas_salida : in std_logic_vector(3 downto 0);
        --teclado
        valor : out std_logic_vector(3 downto 0);
        act_teclado : out std_logic
  );
end component;
signal salida : std_logic_vector(3 downto 0);
constant tamano : integer := 1000;
constant tamano_med : integer := 500;
signal pulsos : std_logic;
begin
    pres : entity work.prescaler
    generic map(rst_en,
                tamano => tamano,
                tamano_med => tamano_med)
    port map(
        rst=> rst,
        clk=> clk,
        pulsos=>pulsos);
    
    gen_pul: entity work.generador_pulsos
    generic map(rst_en)
    port map(
        clk => pulsos,
        rst => rst,
        teclas_salida => salida);
        
    teclas_salida <= salida;
    
   lec_tec: entity work.lector_pulsos
   generic map(rst_en)
   port map(
        clk => clk,
        rst => rst,
        teclas_entrada => teclas_entrada,
        teclas_salida => salida,
        act_teclado => act_teclado,
        valor => valor_teclado);
        
end Behavioral;
