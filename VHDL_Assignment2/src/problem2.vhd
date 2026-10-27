library ieee;
use ieee.std_logic_1164.all;

entity problem2 is
    port (
        d0, d1, d2, d3 : in std_logic;
        d4, d5, d6, d7 : in std_logic;
        s2, s1, s0     : in std_logic;
        y              : out std_logic
    );
end problem2;

architecture behavioral of problem2 is
    signal sel : std_logic_vector(2 downto 0);
begin
    sel <= s2 & s1 & s0;

    with sel select
        y <= d0 when "000",
             d1 when "001",
             d2 when "010",
             d3 when "011",
             d4 when "100",
             d5 when "101",
             d6 when "110",
             d7 when "111",
             '0' when others;
end behavioral;