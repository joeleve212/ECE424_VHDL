--
-- MIPs Processor Developement
-- Eric W. Johnson
-- Valparaiso University
-- 
--
--
-- Update Jeffrey D. Will

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use IEEE.std_logic_1164_extensions.all;
use work.mips_types.all;

entity shiftleft is
   port( INDATA: in mips_data;
      OUTDATA: out mips_data);
end shiftleft;

architecture behavioral of shiftleft is
begin
  PROCESS(INDATA)
     VARIABLE temp : mips_data := x"00000000";
  BEGIN
     for i IN 31 downto 2 LOOP
        temp(i) := INDATA(i-2);
     END LOOP;
     OUTDATA <= temp;
  END PROCESS;
end behavioral;
