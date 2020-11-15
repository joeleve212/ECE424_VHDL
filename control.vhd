--
-- MIPs Processor Developement
-- Eric W. Johnson
-- Valparaiso University
-- 
--
-- Modified by Jeffrey D. Will


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mips_types.all;

entity control is
   port( INSTR: in std_logic_vector(5 DOWNTO 0);
         REGDST: OUT std_logic;
         BRANCH: OUT std_logic;
         MEMREAD: OUT std_logic;
         MEMTOREG: OUT std_logic;
         ALUOP: OUT std_logic_vector(1 DOWNTO 0);
         MEMWRITE: OUT std_logic;
         ALUSRC: OUT std_logic;
         REGWRITE: OUT std_logic);
end control;

architecture behavioral of control is
begin
  PROCESS( INSTR )
     variable temp : std_logic_vector ( 7 downto 0 );
     variable instr_int : integer range 0 to 64;
  BEGIN
     temp := "00000000";
     temp := temp + instr;
     instr_int := conv_Integer(temp);
     case instr_int is
       
       -- ********************************************
       -- Students:  YOU MUST FILL IN THESE CONTROL LINES
       -- FOR EACH INDIVIDUAL INSTRUCTION... they are
       -- set to all zeroes below, but the zeroes are
       -- just placeholders... 
       -- ********************************************
    when 0 => REGDST <= '0';
                  BRANCH <= '0';
                  MEMREAD <= '0';
                  MEMTOREG <= '0';
                  ALUOP <= "00";
                  MEMWRITE <= '0';
                  ALUSRC <= '0';
                  REGWRITE <= '0';
        when 35 => REGDST <= '0';
                  BRANCH <= '0';
                  MEMREAD <= '0';
                  MEMTOREG <= '0';
                  ALUOP <= "00";
                  MEMWRITE <= '0';
                  ALUSRC <= '0';
                  REGWRITE <= '0';
        when 43 => REGDST <= '0';
                  BRANCH <= '0';
                  MEMREAD <= '0';
                  MEMTOREG <= '0';
                  ALUOP <= "00";
                  MEMWRITE <= '0';
                  ALUSRC <= '0';
                  REGWRITE <= '0';
        when 4 => REGDST <= '0';
                  BRANCH <= '0';
                  MEMREAD <= '0';
                  MEMTOREG <= '0';
                  ALUOP <= "00";
                  MEMWRITE <= '0';
                  ALUSRC <= '0';
                  REGWRITE <= '0';
        when others => REGDST <= '0';
                  BRANCH <= '0';
                  MEMREAD <= '0';
                  MEMTOREG <= '0';
                  ALUOP <= "00";
                  MEMWRITE <= '0';
                  ALUSRC <= '0';
                  REGWRITE <= '0';

     END CASE;

  END PROCESS;

end behavioral;
