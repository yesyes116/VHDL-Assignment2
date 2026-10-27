library ieee;
use ieee.std_logic_1164.all;

entity problem4 is
    port (
        vote   : in std_logic_vector(24 downto 0);
        result : out std_logic
    );
end problem4;

architecture behavioral of problem4 is
begin
    process(vote)
        variable count : integer range 0 to 25;
    begin
        count := 0;

        for i in vote'range loop
            if vote(i) = '1' then
                count := count + 1;
            end if;
        end loop;

        if count >= 13 then
            result <= '1';
        else
            result <= '0';
        end if;
    end process;
end behavioral;