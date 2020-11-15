--------------------------------------------------------------------------
--
--  Copyright (C), Peter J. Ashenden
--  Mail:    Dept. Computer Science
--        University of Adelaide, SA 5005, Australia
--  e-mail:    petera@cs.adelaide.edu.au
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 1, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
--
-- Modified: Eric W. Johnson
-- MIPs Processor Developement
-- Valparaiso University
-- 
--
-- Modified: Jeffrey D. Will
-- 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mips_types.all;

entity reg_file is
  port (a1 : in mips_reg_addr;
        q1 : out mips_data;
        a2 : in mips_reg_addr;
        q2 : out mips_data;
        a3 : in mips_reg_addr;
        d3 : in mips_data;
        write_en : in std_logic;
        clk : in std_logic);
end reg_file;

architecture behavior of reg_file is
  
begin

  reg: process (a1, a2, a3, d3, write_en, clk)

    constant all_zeros : mips_data := x"00000000";--to_stdlogicvector(x"00000000");

    type register_array is array (integer range 1 to 31) of mips_data;
    
    variable register_file : register_array;
    variable reg_index1, reg_index2, reg_index3 : integer range 0 to 31;

  begin
    -- do write first if enabled
    --
    if ( write_en = '1' AND clk'EVENT AND clk = '1') then
      reg_index3 := conv_integer(a3);
      if reg_index3 /= 0 then
          register_file(reg_index3) := d3;
      end if;
    end if;
    --
    -- read port 1
    --
    reg_index1 := conv_integer(a1);
    if reg_index1 /= 0 then
      q1 <= register_file(reg_index1);
    else
      q1 <= all_zeros;
    end if;
    --
    -- read port 2
    --
    reg_index2 := conv_integer(a2);
    if reg_index2 /= 0 then
      q2 <= register_file(reg_index2);
    else
      q2 <= all_zeros;
    end if;
  end process reg;

end behavior;
