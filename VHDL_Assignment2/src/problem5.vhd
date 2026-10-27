library ieee;
use ieee.std_logic_1164.all;

entity problem5 is
    port (
        vt                  : in std_logic_vector(12 downto 0);
        en                  : in std_logic;
        a, b, c, d, e, f, g : out std_logic
    );
end problem5;

architecture behavioral of problem5 is
    signal seg : std_logic_vector(6 downto 0);
begin
    process(vt, en)
        variable count : integer range 0 to 15;
    begin
        count := 0;

        for i in vt'range loop
            if vt(i) = '1' then
                count := count + 1;
            end if;
        end loop;

        if en = '1' then
            -- Segment order: a b c d e f g
            case count is
                when 0  => seg <= "1111110";
                when 1  => seg <= "0110000";
                when 2  => seg <= "1101101";
                when 3  => seg <= "1111001";
                when 4  => seg <= "0110011";
                when 5  => seg <= "1011011";
                when 6  => seg <= "1011111";
                when 7  => seg <= "1110000";
                when 8  => seg <= "1111111";
                when 9  => seg <= "1111011";
                when 10 => seg <= "1110111"; -- A
                when 11 => seg <= "0011111"; -- b
                when 12 => seg <= "1001110"; -- C
                when 13 => seg <= "0111101"; -- d
                when 14 => seg <= "1001111"; -- E
                when 15 => seg <= "1000111"; -- F
                when others => seg <= "0000000";
            end case;
        else
            seg <= "0000000";
        end if;
    end process;

    a <= seg(6);
    b <= seg(5);
    c <= seg(4);
    d <= seg(3);
    e <= seg(2);
    f <= seg(1);
    g <= seg(0);
end behavioral;