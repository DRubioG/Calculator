library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lector_pulsos is
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
end lector_pulsos;

architecture Behavioral of lector_pulsos is
type fsm is (S0, S1, S1B, S2, S3);
signal estado : fsm;
signal valor_horizontal : std_logic_vector(3 downto 0);
signal valor_vertical : std_logic_vector(3 downto 0);
signal valor_one_hot : std_logic_vector(7 downto 0);
signal valor_int : std_logic_vector(3 downto 0);
begin
 process(clk , rst)
       
       begin
           if rst=rst_en then 
            estado <=S0;
           elsif rising_edge(clk) then
              case estado is
                    when S0 =>
                        if(teclas_entrada(0) or teclas_entrada(1) or teclas_entrada(2) or teclas_entrada(3))='1' then
                            estado<=S1;
                        end if;
                    when S1 =>
                        estado<=S1B;
                    when S2 =>
                        if(teclas_entrada(0) or teclas_entrada(1) or teclas_entrada(2) or teclas_entrada(3))='0' then
                            estado<=S2;
                        end if;
                    when S3 =>
                        estado<=S0;
                end case;
           end if;
       end process;

    process(estado)
    
    begin
        case estado is
            when S0=>
            when S1=>
                valor_vertical<=teclas_salida;
                valor_horizontal<=(teclas_entrada(3)&teclas_entrada(2)&teclas_entrada(1)&teclas_entrada(0));
                valor_one_hot<=valor_vertical&valor_horizontal;
            when S1B=>
                null;
            when S2 => act_teclado<='1';
            when S3 => 
                act_teclado<='0';
                valor<=valor_int;
            end case;
     end process;
     
     process(estado)
     
     begin
        if estado=S1B then
            case valor_one_hot is 
            --primera columna
                when "10001000" =>
                    valor_int <= x"1";
                when "10000100" =>
                    valor_int <= x"4";
                when "10000010" =>
                    valor_int <= x"7";
                when "10000001" =>
                    valor_int <= x"F";  --tecla *
            --segunda columna
                when "01001000" =>
                    valor_int <= x"2";
                when "01000100" =>
                    valor_int <= x"5";
                when "01000010" =>
                    valor_int <= x"8";
                when "01000001" =>
                    valor_int <= x"0";
             --tercera columna
                 when "00101000" =>
                     valor_int <= x"3";
                 when "00100100" =>
                     valor_int <= x"6";
                 when "00100010" =>
                     valor_int <= x"9";
                 when "00100001" =>
                     valor_int <= x"E"; --tecla #
             --cuarta columna
                 when "00011000" =>
                     valor_int <= x"A";
                 when "00010100" =>
                     valor_int <= x"B";
                 when "00010010" =>
                     valor_int <= x"C";
                 when "00010001" =>
                     valor_int <= x"D";
         end case;
        end if;
     end process;  
end Behavioral;
