--
-- MIPs Processor Developement
-- Eric W. Johnson
-- Valparaiso University
-- 
--
--
-- Modified by Jeffrey Will

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu_control is
   port( INSTR: in std_logic_vector(5 DOWNTO 0);
         ALUOP: in std_logic_vector(1 DOWNTO 0);
         ALUCTRL : OUT std_logic_vector(3 DOWNTO 0));
end alu_control;

--***************************************************
--Students: it is your job to fill in
-- each of the "---" with the appropriate 1's and 0's
--***************************************************
architecture behavioral of alu_control is
begin
  PROCESS(INSTR,ALUOP)
  BEGIN
     case ALUOP is
        when "00" => ALUCTRL <= "0010";
        when "01" => ALUCTRL <= "0110";
        when "10" => case INSTR is
                        when "100000" => ALUCTRL <= "0010";
                        when "100010" => ALUCTRL <= "0110";
                        when "100100" => ALUCTRL <= "0000";
                        when "100101" => ALUCTRL <= "0001";
                        when "101010" => ALUCTRL <= "0111";
                        when others => ALUCTRL <= "0000";
             end case;
        when others => ALUCTRL <= "0000";

     END CASE;

  END PROCESS;

end behavioral;
