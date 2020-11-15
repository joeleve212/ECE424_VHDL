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

-- mux2 Entity Description
entity mux2 is
   port( IN0: in mips_data;
      IN1: in mips_data;
      SEL: in std_logic;
      DOUT: out mips_data);
end mux2;

-- mux2 Architecture Description
architecture behavioral of mux2 is
begin
  with SEL select
    DOUT <=  IN0 when '0',
             IN1 when '1',
	     "00000000000000000000000000000000" when others;
end behavioral;

