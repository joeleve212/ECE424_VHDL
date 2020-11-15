--
-- MIPs Processor Developement
-- Eric W. Johnson
-- Valparaiso University
-- 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mips_types.all;

-- sign extend Entity Description
entity signextend is
   port( INDATA: in STD_LOGIC_VECTOR(15 DOWNTO 0);
      OUTDATA: out mips_data);
end signextend;

-- sign extend Architecture Description
architecture behavioral of signextend is
begin
  PROCESS(INDATA)
    VARIABLE qs : mips_data;
    VARIABLE qt : STD_LOGIC_VECTOR(15 DOWNTO 0);
  BEGIN
     qt := INDATA;
     qs := (others=>INDATA(INDATA'left));
     qs := qs((31-INDATA'length) downto 0) & qt;
     OUTDATA <= qs;
  END PROCESS;
end behavioral;
