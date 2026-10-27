library ieee;
use ieee.std_logic_1164.all;

entity problem3 is
    port (
        sel0, sel1, sel2     : in std_logic;
        a, b, c, d, e, f, g : out std_logic
    );
end problem3;

architecture behavioral of problem3 is
    signal sel : std_logic_vector(2 downto 0);
    signal seg : std_logic_vector(6 downto 0);
begin
    sel <= sel2 & sel1 & sel0;

    -- seg order: a b c d e f g
    -- '1' turns the corresponding segment on.
    with sel select
        seg <= "1111101" when "000", -- a
               "0011111" when "001", -- b
               "1001110" when "010", -- C
               "0111101" when "011", -- d
               "1000111" when "100", -- F
               "1111011" when "101", -- g
               "0000000" when others;

    a <= seg(6);
    b <= seg(5);
    c <= seg(4);
    d <= seg(3);
    e <= seg(2);
    f <= seg(1);
    g <= seg(0);
end behavioral;