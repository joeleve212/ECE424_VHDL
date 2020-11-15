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
entity mux2a is
   port( IN0: in mips_reg_addr;
      IN1: in mips_reg_addr;
      SEL: in STD_LOGIC;
      DOUT: out mips_reg_addr);
end mux2a;

-- mux2 Architecture Description
architecture behavioral of mux2a is
begin
  with SEL select
    DOUT <=  IN0 when '0',
             IN1 when '1',
         "00000" when others;
end behavioral;
