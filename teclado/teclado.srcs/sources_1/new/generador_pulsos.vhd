library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generador_pulsos is
    generic(
        rst_en : std_logic := '1');
  Port ( 
        clk : in std_logic;
        rst : in std_logic;
        teclas_salida : out std_logic_vector(3 downto 0)
  );
end entity;

architecture arch_generador_pulsos of generador_pulsos is
signal cont : unsigned(1 downto 0);
begin

process(clk , rst)
    begin
        if rst=rst_en then 
            teclas_salida <=(others=>'0');
        elsif rising_edge(clk) then
            cont<=cont+1;
            case cont is
                when "00" =>
                    teclas_salida <= "0001";
                when "01" =>
                    teclas_salida <= "0010";
                when "10" =>
                    teclas_salida <= "0100";
                when "11" =>
                    teclas_salida <= "1000";
             end case;
        end if;
    end process;
end arch_generador_pulsos;