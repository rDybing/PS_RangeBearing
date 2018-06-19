/* *******************************************
 *
 * structs.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/

type font_t
	id				as integer
	r				as integer
	g				as integer
	b				as integer
	size			as float
	interval		as integer
endType

type media_t	
	font			as integer
	fontB			as integer
	fontC			as integer
	back			as integer
	bSmall			as integer
	bLarge			as integer
	bLarge2			as integer
	keyClick		as integer
	lcd				as integer
	hexHead			as integer
endType

type sprite_t
	back			as integer
	bSmall			as integer[11]
	bCalc			as integer
	bCoordPrev		as integer
	bCoordNext		as integer
	bAbout			as integer
	bMrtPrev		as integer
	bMrtNext		as integer
	lcd				as integer
	hexHead			as integer[3]
endType

type layer_t
	front			as integer
	A				as integer
	B				as integer
	C				as integer
	D				as integer
	back			as integer
endType

type mouse_t
	x				as integer
	y				as integer
	hit				as integer
	spriteID 		as integer
endType

type txt_t
	ver				as integer
	num				as integer[11]
	calc			as integer[3]
	alpha			as integer[9]
	lcdFixed		as integer[3]
	lcdFloating		as integer[9]
	lcdCalc			as integer[2]
	test			as integer
	date			as integer
	bAbout			as integer
	bMrtPrev		as integer
	bMrtNext		as integer
	mrtModel		as integer
	coordPrev		as integer
	coordNext		as integer
endType

type txtProp_t	
	startY			as float
	startX			as float
	offsetX			as float
	offsetY			as float
	align 			as integer
endType

type spriteProp_t
	posX			as float
	posY			as float
	width			as float
	height			as float
endType

type device_t
	width			as integer
	height			as integer
	aspect			as string
	os				as string
endType

type color_t
	r				as integer
	g				as integer
	b				as integer
	a				as integer
endType

type position_t
	bStartX			as float
	bStartY			as float
	bUpperY			as float
	bWidth			as float
	lcdStartX		as float
	lcdStartY		as float
	lcdWidth		as float
	lcdFudgeY		as float
	lcdTxtDivY		as float
endType

type timer_t
	old				as integer
	new				as integer
	freq			as integer
endType

type tweens_t
	foo				as integer
endType			

type buttonState_t
	timePressed		as integer
	latch			as integer[2]
	lastKey			as integer
	hits			as integer
	mode			as integer
	singleDigit		as integer
	active			as integer
	calc			as integer
	secondDigit		as integer
endType

type coord_t
	macro			as float
	mini			as float[8]
	micro			as float[8]
	nano			as float[8]
endType

type calc_t
	range			as float
	angle			as float
	mils			as integer
	mX				as string
	mY				as string
	tX				as string
	tY				as string
	a				as string
endType

type mortar_t
	velocity		as float
	model			as string
endType

