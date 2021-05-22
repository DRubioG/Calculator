library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity teclado_tb is
end teclado_tb;

architecture Behavioral of teclado_tb is
--component teclado
--    generic(
--        rst_en : std_logic := '1');
--  Port ( 
--        clk : in std_logic;
--        rst : in std_logic;
--        teclas_entrada : in std_logic_vector(3 downto 0);
--        teclas_salida : out std_logic_vector(3 downto 0);
        
--        ---salidas a la FPGA
--        act_teclado : out std_logic;
--        valor_teclado : out std_logic_vector(3 downto 0)
--  );
--end component;

constant rst_en : std_logic := '1';
signal clk : std_logic;
signal rst : std_logic;
signal teclas_entrada : std_logic_vector(3 downto 0);
signal teclas_salida : std_logic_vector(3 downto 0);
signal act_teclado : std_logic;
signal valor_teclado : std_logic_vector(3 downto 0);
begin

--DUT: entity work.teclado
--generic map(rst_en)
--port map(
--    clk => clk,
--    rst => rst,
--    teclas_entrada => teclas_entrada,
--    teclas_salida => teclas_salida,
--    act_teclado => act_teclado,
--    valor_teclado => valor_teclado);
    
clk <= not clk after 10ns;
rst <= rst_en , not rst_en after 30ns;

end Behavioral;
