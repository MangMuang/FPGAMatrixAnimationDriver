-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/22/2017 20:57:58"

-- 
-- Device: Altera EP2C5T144C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MatrixAnim IS
    PORT (
	clk12m : IN std_logic;
	sin1 : OUT std_logic;
	sin2 : OUT std_logic;
	sin3 : OUT std_logic;
	latch : OUT std_logic;
	clkout : OUT std_logic
	);
END MatrixAnim;

-- Design Ports Information
-- sin1	=>  Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sin2	=>  Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sin3	=>  Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- latch	=>  Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clkout	=>  Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk12m	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF MatrixAnim IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk12m : std_logic;
SIGNAL ww_sin1 : std_logic;
SIGNAL ww_sin2 : std_logic;
SIGNAL ww_sin3 : std_logic;
SIGNAL ww_latch : std_logic;
SIGNAL ww_clkout : std_logic;
SIGNAL \clk2m~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk12m~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \counter0_33[2]~10_combout\ : std_logic;
SIGNAL \clk12m~combout\ : std_logic;
SIGNAL \clk12m~clkctrl_outclk\ : std_logic;
SIGNAL \counter2M~1_combout\ : std_logic;
SIGNAL \counter2M~2_combout\ : std_logic;
SIGNAL \counter2M~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \clk2m~regout\ : std_logic;
SIGNAL \clk2m~clkctrl_outclk\ : std_logic;
SIGNAL \counter0_33[0]~6_combout\ : std_logic;
SIGNAL \counter0_33[4]~14_combout\ : std_logic;
SIGNAL \counter0_33[1]~8_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \counter0_33[0]~7\ : std_logic;
SIGNAL \counter0_33[1]~9\ : std_logic;
SIGNAL \counter0_33[2]~11\ : std_logic;
SIGNAL \counter0_33[3]~12_combout\ : std_logic;
SIGNAL \counter0_33[3]~13\ : std_logic;
SIGNAL \counter0_33[4]~15\ : std_logic;
SIGNAL \counter0_33[5]~16_combout\ : std_logic;
SIGNAL \latch~0_combout\ : std_logic;
SIGNAL \latch~reg0_regout\ : std_logic;
SIGNAL \clkout~0_combout\ : std_logic;
SIGNAL \clkout~reg0_regout\ : std_logic;
SIGNAL counter2M : std_logic_vector(2 DOWNTO 0);
SIGNAL counter0_33 : std_logic_vector(5 DOWNTO 0);

BEGIN

ww_clk12m <= clk12m;
sin1 <= ww_sin1;
sin2 <= ww_sin2;
sin3 <= ww_sin3;
latch <= ww_latch;
clkout <= ww_clkout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk2m~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk2m~regout\);

\clk12m~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk12m~combout\);

-- Location: LCFF_X1_Y2_N13
\counter0_33[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \counter0_33[2]~10_combout\,
	sclr => \LessThan2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter0_33(2));

-- Location: LCCOMB_X1_Y2_N12
\counter0_33[2]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter0_33[2]~10_combout\ = (counter0_33(2) & (\counter0_33[1]~9\ $ (GND))) # (!counter0_33(2) & (!\counter0_33[1]~9\ & VCC))
-- \counter0_33[2]~11\ = CARRY((counter0_33(2) & !\counter0_33[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter0_33(2),
	datad => VCC,
	cin => \counter0_33[1]~9\,
	combout => \counter0_33[2]~10_combout\,
	cout => \counter0_33[2]~11\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk12m~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk12m,
	combout => \clk12m~combout\);

-- Location: CLKCTRL_G2
\clk12m~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk12m~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk12m~clkctrl_outclk\);

-- Location: LCCOMB_X27_Y7_N6
\counter2M~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter2M~1_combout\ = (!counter2M(0) & ((!counter2M(1)) # (!counter2M(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter2M(2),
	datac => counter2M(0),
	datad => counter2M(1),
	combout => \counter2M~1_combout\);

-- Location: LCFF_X27_Y7_N7
\counter2M[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk12m~clkctrl_outclk\,
	datain => \counter2M~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter2M(0));

-- Location: LCCOMB_X27_Y7_N14
\counter2M~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter2M~2_combout\ = (counter2M(1) & (!counter2M(2) & counter2M(0))) # (!counter2M(1) & (counter2M(2) & !counter2M(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter2M(1),
	datac => counter2M(2),
	datad => counter2M(0),
	combout => \counter2M~2_combout\);

-- Location: LCFF_X27_Y7_N15
\counter2M[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk12m~clkctrl_outclk\,
	datain => \counter2M~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter2M(2));

-- Location: LCCOMB_X27_Y7_N28
\counter2M~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter2M~0_combout\ = (!counter2M(2) & (counter2M(1) $ (counter2M(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter2M(2),
	datac => counter2M(1),
	datad => counter2M(0),
	combout => \counter2M~0_combout\);

-- Location: LCFF_X27_Y7_N29
\counter2M[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk12m~clkctrl_outclk\,
	datain => \counter2M~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter2M(1));

-- Location: LCCOMB_X27_Y7_N30
\LessThan1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!counter2M(2) & ((!counter2M(0)) # (!counter2M(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter2M(1),
	datac => counter2M(2),
	datad => counter2M(0),
	combout => \LessThan1~0_combout\);

-- Location: LCFF_X27_Y7_N31
clk2m : cycloneii_lcell_ff
PORT MAP (
	clk => \clk12m~clkctrl_outclk\,
	datain => \LessThan1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \clk2m~regout\);

-- Location: CLKCTRL_G4
\clk2m~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk2m~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk2m~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y2_N8
\counter0_33[0]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter0_33[0]~6_combout\ = counter0_33(0) $ (VCC)
-- \counter0_33[0]~7\ = CARRY(counter0_33(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter0_33(0),
	datad => VCC,
	combout => \counter0_33[0]~6_combout\,
	cout => \counter0_33[0]~7\);

-- Location: LCCOMB_X1_Y2_N16
\counter0_33[4]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter0_33[4]~14_combout\ = (counter0_33(4) & (\counter0_33[3]~13\ $ (GND))) # (!counter0_33(4) & (!\counter0_33[3]~13\ & VCC))
-- \counter0_33[4]~15\ = CARRY((counter0_33(4) & !\counter0_33[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter0_33(4),
	datad => VCC,
	cin => \counter0_33[3]~13\,
	combout => \counter0_33[4]~14_combout\,
	cout => \counter0_33[4]~15\);

-- Location: LCFF_X1_Y2_N17
\counter0_33[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \counter0_33[4]~14_combout\,
	sclr => \LessThan2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter0_33(4));

-- Location: LCCOMB_X1_Y2_N10
\counter0_33[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter0_33[1]~8_combout\ = (counter0_33(1) & (!\counter0_33[0]~7\)) # (!counter0_33(1) & ((\counter0_33[0]~7\) # (GND)))
-- \counter0_33[1]~9\ = CARRY((!\counter0_33[0]~7\) # (!counter0_33(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter0_33(1),
	datad => VCC,
	cin => \counter0_33[0]~7\,
	combout => \counter0_33[1]~8_combout\,
	cout => \counter0_33[1]~9\);

-- Location: LCFF_X1_Y2_N11
\counter0_33[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \counter0_33[1]~8_combout\,
	sclr => \LessThan2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter0_33(1));

-- Location: LCCOMB_X1_Y2_N0
\LessThan2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!counter0_33(2) & (!counter0_33(0) & (!counter0_33(3) & !counter0_33(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter0_33(2),
	datab => counter0_33(0),
	datac => counter0_33(3),
	datad => counter0_33(1),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X1_Y2_N30
\LessThan2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (counter0_33(5) & ((counter0_33(4)) # (!\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter0_33(5),
	datac => counter0_33(4),
	datad => \LessThan2~0_combout\,
	combout => \LessThan2~1_combout\);

-- Location: LCFF_X1_Y2_N9
\counter0_33[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \counter0_33[0]~6_combout\,
	sclr => \LessThan2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter0_33(0));

-- Location: LCCOMB_X1_Y2_N14
\counter0_33[3]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter0_33[3]~12_combout\ = (counter0_33(3) & (!\counter0_33[2]~11\)) # (!counter0_33(3) & ((\counter0_33[2]~11\) # (GND)))
-- \counter0_33[3]~13\ = CARRY((!\counter0_33[2]~11\) # (!counter0_33(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter0_33(3),
	datad => VCC,
	cin => \counter0_33[2]~11\,
	combout => \counter0_33[3]~12_combout\,
	cout => \counter0_33[3]~13\);

-- Location: LCFF_X1_Y2_N15
\counter0_33[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \counter0_33[3]~12_combout\,
	sclr => \LessThan2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter0_33(3));

-- Location: LCCOMB_X1_Y2_N18
\counter0_33[5]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter0_33[5]~16_combout\ = \counter0_33[4]~15\ $ (counter0_33(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter0_33(5),
	cin => \counter0_33[4]~15\,
	combout => \counter0_33[5]~16_combout\);

-- Location: LCFF_X1_Y2_N19
\counter0_33[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \counter0_33[5]~16_combout\,
	sclr => \LessThan2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter0_33(5));

-- Location: LCCOMB_X1_Y2_N20
\latch~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \latch~0_combout\ = !counter0_33(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => counter0_33(5),
	combout => \latch~0_combout\);

-- Location: LCFF_X1_Y2_N21
\latch~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \latch~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \latch~reg0_regout\);

-- Location: LCCOMB_X1_Y2_N26
\clkout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \clkout~0_combout\ = !counter0_33(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => counter0_33(0),
	combout => \clkout~0_combout\);

-- Location: LCFF_X1_Y2_N27
\clkout~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk2m~clkctrl_outclk\,
	datain => \clkout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \clkout~reg0_regout\);

-- Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sin1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sin1);

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sin2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sin2);

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sin3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sin3);

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\latch~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \latch~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_latch);

-- Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\clkout~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \clkout~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_clkout);
END structure;


