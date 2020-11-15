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

package mips_types is

  subtype mips_data is STD_LOGIC_VECTOR(31 downto 0);
  subtype mips_address is STD_LOGIC_VECTOR(31 downto 0);
  subtype mips_reg_addr IS STD_LOGIC_VECTOR(4 DOWNTO 0);
  --subtype op_code is std_logic_vector (3 downto 0);

end mips_types;
