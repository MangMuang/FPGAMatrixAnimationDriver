LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.numeric_std.ALL;

ENTITY MatrixAnim IS
	PORT(
		clk12m : IN STD_LOGIC;
		sin1,sin2,sin3,latch,clkout : OUT STD_LOGIC
	);
END MatrixAnim;

ARCHITECTURE archMatrix OF MatrixAnim IS
SIGNAL counter2M   : STD_LOGIC_VECTOR(2 downto 0);
SIGNAL clk2m       : STD_LOGIC;
SIGNAL counter0_33 : STD_LOGIC_VECTOR(5 downto 0);
SIGNAL frametrack  : STD_LOGIC_VECTOR(3 downto 0) :="0000";
SIGNAL linerA2P : STD_LOGIC_VECTOR(15 downto 0) :="0000000000000000"; -- A-P
SIGNAL sin1dat, sin2dat, sin3dat : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL La, Lb, Lc, Ld, Le, Lf, Lg, Lh, Li, Lj, Lk, Ll, Lm, Ln, Lo, Lp : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16 : STD_LOGIC_VECTOR(32 downto 1); --Frame1 
SIGNAL b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16 : STD_LOGIC_VECTOR(32 downto 1); --Frame2
SIGNAL c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16 : STD_LOGIC_VECTOR(32 downto 1); --Frame3
--SIGNAL 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 : STD_LOGIC_VECTOR(32 downto 1); --Frame

BEGIN--CLKDIVIDER
	clkdiv : PROCESS(clk12m)
	BEGIN
		IF rising_edge(clk12m) THEN
			IF counter2M < 5 THEN
				counter2M <= counter2M + 1;
			ELSE
				counter2M <= (OTHERS => '0');
			END IF;
			
			IF counter2M < 3 THEN
				clk2m <= '1';
			ELSE
				clk2m <= '0';
			END IF;
		END IF;
	END PROCESS;
	----------------------------------------
	--  LINER ASSIGN
	La <= "1000000000000000";
	Lb <= "0100000000000000";
	Lc <= "0010000000000000";
	Ld <= "0001000000000000";
	Le <= "0000100000000000";
	Lf <= "0000010000000000";
	Lg <= "0000001000000000";
	Lh <= "0000000100000000";
	Li <= "0000000010000000";
	Lj <= "0000000001000000";
	Lk <= "0000000000100000";
	Ll <= "0000000000010000";
	Lm <= "0000000000001000";
	Ln <= "0000000000000100";
	Lo <= "0000000000000010";
	Lp <= "0000000000000001";
	--  DATA ASSIGN 
	--      1                              32
	a1  <= "00000000000000000000000000000000"; -- a Frame1
	a2  <= "00000000000000000000000000000000"; -- b
	a3  <= "00000000000000000000000000000000"; -- c
	a4  <= "00000000000000000000000000000000"; -- d
	a5  <= "00000000000000000000000000000000"; -- e
	a6  <= "00000000000000000000000000000000"; -- f
	a7  <= "00000000000000000000000000000000"; -- g
	a8  <= "00000000000000000000000000000000"; -- h
	a9  <= "00000000000000000000000000000000"; -- i
	a10 <= "00000000000000000000000000000000"; -- j
	a11 <= "00000000000000000000000000000000"; -- k
	a12 <= "00000000000000000000000000000000"; -- l
	a13 <= "00000000000000000000000000000000"; -- m
	a14 <= "00000000000000000000000000000000"; -- n
	a15 <= "00000000000000000000000000000000"; -- o
	a16 <= "00000000000000000000000000000000"; -- p
	
	b1  <= "00000000000000000000000000000000"; -- a Frame2
	b2  <= "00000000000000000000000000000000"; -- b
	b3  <= "00000000000000000000000000000000"; -- c
	b4  <= "00000000000000000000000000000000"; -- d
	b5  <= "00000000000000000000000000000000"; -- e
	b6  <= "00000000000000000000000000000000"; -- f
	b7  <= "00000000000000000000000000000000"; -- g
	b8  <= "00000000000000000000000000000000"; -- h
	b9  <= "00000000000000000000000000000000"; -- i
	b10 <= "00000000000000000000000000000000"; -- j
	b11 <= "00000000000000000000000000000000"; -- k
	b12 <= "00000000000000000000000000000000"; -- l
	b13 <= "00000000000000000000000000000000"; -- m
	b14 <= "00000000000000000000000000000000"; -- n
	b15 <= "00000000000000000000000000000000"; -- o
	b16 <= "00000000000000000000000000000000"; -- p
	
	
   ----------------------------------------
	
	PROCESS(clk2m)
	BEGIN
		IF rising_edge(clk2m) THEN
			IF counter0_33 < 33 THEN
				counter0_33 <= counter0_33 + 1;
			ELSE
				counter0_33 <= (OTHERS => '0');
			END IF;
			
			CASE counter0_33 IS
				WHEN "000000" | "000001" => sin1 <= sin1dat(15); sin2 <= sin2dat(15); sin3 <= sin3dat(15); latch <='1';
				WHEN "000010" | "000011" => sin1 <= sin1dat(14); sin2 <= sin2dat(14); sin3 <= sin3dat(14); latch <='1';
				WHEN "000100" | "000101" => sin1 <= sin1dat(13); sin2 <= sin2dat(13); sin3 <= sin3dat(13); latch <='1';
				WHEN "000110" | "000111" => sin1 <= sin1dat(12); sin2 <= sin2dat(12); sin3 <= sin3dat(12); latch <='1';
				WHEN "001000" | "001001" => sin1 <= sin1dat(11); sin2 <= sin2dat(11); sin3 <= sin3dat(11); latch <='1';
				WHEN "001010" | "001011" => sin1 <= sin1dat(10); sin2 <= sin2dat(10); sin3 <= sin3dat(10); latch <='1';
				WHEN "001100" | "001101" => sin1 <= sin1dat(9); sin2 <= sin2dat(9); sin3 <= sin3dat(9); latch <='1';
				WHEN "001110" | "001111" => sin1 <= sin1dat(8); sin2 <= sin2dat(8); sin3 <= sin3dat(8); latch <='1';
				WHEN "010000" | "010001" => sin1 <= sin1dat(7); sin2 <= sin2dat(7); sin3 <= sin3dat(7); latch <='1';
				WHEN "010010" | "010011" => sin1 <= sin1dat(6); sin2 <= sin2dat(6); sin3 <= sin3dat(6); latch <='1';
				WHEN "010100" | "010101" => sin1 <= sin1dat(5); sin2 <= sin2dat(5); sin3 <= sin3dat(5); latch <='1';
				WHEN "010110" | "010111" => sin1 <= sin1dat(4); sin2 <= sin2dat(4); sin3 <= sin3dat(4); latch <='1';
				WHEN "011000" | "011001" => sin1 <= sin1dat(3); sin2 <= sin2dat(3); sin3 <= sin3dat(3); latch <='1';
				WHEN "011010" | "011011" => sin1 <= sin1dat(2); sin2 <= sin2dat(2); sin3 <= sin3dat(2); latch <='1';
				WHEN "011100" | "011101" => sin1 <= sin1dat(1); sin2 <= sin2dat(1); sin3 <= sin3dat(1); latch <='1';
				WHEN "011110" | "011111" => sin1 <= sin1dat(0); sin2 <= sin2dat(0); sin3 <= sin3dat(0); latch <='1';
				WHEN OTHERS => sin1 <= '0'; sin2 <= '0'; sin3 <= '0'; latch <= '0';
			END CASE;
			
			clkout <= NOT counter0_33(0);
			
		END IF;
	END PROCESS;
END archMatrix;