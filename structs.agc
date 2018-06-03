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
	back			as integer
	bSmall			as integer
	bLarge			as integer
	keyClick		as integer
endType

type sprite_t
	back			as integer
	bSmall			as integer[12]
	bLarge			as integer[2]
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
	num				as integer[12]
	large			as integer[8]
	alpha			as integer[9]
endType

type txtProp_t	
	startY			as float
	startX			as float
	offsetX			as float
	offsetY			as float
	offset 			as integer
	align 			as integer
	mainItems		as integer
	menuItems		as integer
	editItems		as integer
	netItems		as integer
	size			as float
	active			as integer
	maxLines		as integer
	lang			as integer
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
	bWidth			as float
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
endType

