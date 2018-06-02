/* *******************************************
 *
 * structs.agc
 *
 * Project: fBus
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
	waiting			as integer[]
endType

type sprite_t
	back			as integer
	waiting			as integer
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
	id				as string 
	os				as string
	model			as string 
endType

type color_t
	r				as integer
	g				as integer
	b				as integer
	a				as integer
endType

type timer_t
	old				as integer
	new				as integer
	freq			as integer
endType

type tweens_t
	foo				as integer
endType			


