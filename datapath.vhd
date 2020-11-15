-- datapath file


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mips_types.all;

entity datapath is
	PORT ( pc : IN STD_LOGIC_VECTOR ( 31 downto 0 );
           nextPC: OUT STD_LOGIC_VECTOR (31 downto 0) );

END datapath;

architecture dataBoi of datapath is
	COMPONENT alu_control
		port( INSTR: in std_logic_vector(5 DOWNTO 0);
			ALUOP: in std_logic_vector(1 DOWNTO 0);
			ALUCTRL : OUT std_logic_vector(3 DOWNTO 0));
	END COMPONENT;

	COMPONENT control
		port( INSTR: in std_logic_vector(5 DOWNTO 0);
			 REGDST: OUT std_logic;
			 BRANCH: OUT std_logic;
			 MEMREAD: OUT std_logic;
			 MEMTOREG: OUT std_logic;
			 ALUOP: OUT std_logic_vector(1 DOWNTO 0);
			 MEMWRITE: OUT std_logic;
			 ALUSRC: OUT std_logic;
			REGWRITE: OUT std_logic);
	END COMPONENT;

	COMPONENT dmemory
	   port(
		  DIN: in mips_data;
		  ADDR: in mips_address;
		  DOUT: out mips_data;
		  WE, RE: in std_logic;
		  CLK: in std_logic
		);
	END COMPONENT;

	COMPONENT imemory
	   port(
		  ADDR: in mips_address;
		  DOUT: out mips_data
		);
	END COMPONENT;
	
	COMPONENT alu32
		PORT( A, B: in std_logic_vector (31 downto 0);
			ALUOp: in std_logic_vector (3 downto 0);
			RESULT: out std_logic_vector (31 downto 0);
			Z, V, C: out std_logic );
	END COMPONENT;
	
	COMPONENT mux2a
	   port( IN0: in mips_reg_addr;
		  IN1: in mips_reg_addr;
		  SEL: in STD_LOGIC;
		  DOUT: out mips_reg_addr);
	end component;

	COMPONENT reg_file 
	  port (a1 : in mips_reg_addr;
			q1 : out mips_data;
			a2 : in mips_reg_addr;
			q2 : out mips_data;
			a3 : in mips_reg_addr;
			d3 : in mips_data;
			write_en : in std_logic;
			clk : in std_logic);
	end COMPONENT;

	COMPONENT signextend
	   port( INDATA: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		  OUTDATA: out mips_data);
	end COMPONENT;

	COMPONENT mux2
	   port( IN0: in mips_data;
		  IN1: in mips_data;
		  SEL: in std_logic;
		  DOUT: out mips_data);
	end COMPONENT;

	SIGNAL sys_clock : std_logic := '0';
	CONSTANT Tcycle : time := 100 ns;
	
	SIGNAL inst : std_logic_vector( 31 downto 0);
	SIGNAL defNextPC, wRegData, aluIn0, aluIn1, mux2in0, mux2in1  : std_logic_vector( 31 downto 0);
	SIGNAL REGDST, BRANCH, MEMREAD, MEMTOREG, MEMWRITE, ALUSRC, REGWRITE : std_logic;
	SIGNAL ALUOp : std_logic_vector(1 downto 0);
	SIGNAL wRegIn : std_logic_vector(4 downto 0);
	--SIGNAL 
	
	BEGIN

	  -- create clock process
	  clk_gen: process
	  begin
		sys_clock <= '1' after Tcycle/3, '0' after Tcycle;
		wait until sys_clock = '0';
	  end process clk_gen;

	Imem: imemory PORT MAP( 
		ADDR => pc, DOUT => inst
	);
	
	PCplus4: alu32 PORT MAP( 
		A => pc, B=> X"00000004", ALUOp => "0010", RESULT=>defNextPC, Z => oPeN, V=> OPen, C=>oPEn
	);
	
	CTL: control PORT MAP( 
		INSTR => inst(31 downto 26), REGDST => RegDst,BRANCH => Branch,
		MEMREAD => MEMREAD,MEMTOREG => MEMTOREG,MEMWRITE => MEMWRITE,ALUSRC => ALUSRC,
		REGWRITE => REGWRITE,ALUOP => ALUOP
	);
	
	writeRegSel: mux2a PORT MAP( 
		IN0 => inst(20 downto 16), IN1 => inst(15 downto 11), SEL => REGDST, DOUT => wRegIn
	);
	
	reg: reg_file PORT MAP( 
		a1=> inst(25 downto 21), a2 => inst(20 downto 16), a3 => wRegIn,
		q1 => aluIn0, q2 => mux2in0, d3=> wRegData, write_en=> REGWRITE, CLK => sys_clock
	);
	
	sign: signextend PORT MAP( 
		INDATA => inst(15 downto 0), OUTDATA => mux2in1
	);
	
	muxTheSecond: mux2 PORT MAP( 
		IN0=>mux2in0, IN1=> mux2in1, SEL=>ALUSRC, DOUT => aluIn1
	);
	
end dataBoi;
