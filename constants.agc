/* *******************************************
 *
 * constants.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/
 
 function constants()

	layer.front				= 0
	layer.A					= 10
	layer.B					= 20
	layer.C					= 30
	layer.D					= 40
	layer.back				= 999

	// text
	txt.ver					= 1000
	for i = 0 to 11
		txt.num[i]			= 1010 + i // to 1021
	next i
	for i = 0 to 7
		txt.large[i]		= 1022 + i // to 1029
	next i
	for i = 0 to 8
		txt.alpha[i]		= 1030 + i // to 1038
	next i

	// sprites
	sprite.back				= 9004
	for i = 0 to 11
		sprite.bSmall[i] 	= 9010 + i
	next i
	sprite.bLarge[0]		= 9022
	sprite.bLarge[1]		= 9023

	// images	
	media.font				= 9000
	media.fontB				= 9001
	media.back				= 9004
	media.bSmall			= 9010
	media.bLarge			= 9011
	
endFunction

function initColor()

	// white
	color[0].r = 255
	color[0].g = 255
	color[0].b = 255
	color[0].a = 255
	// black
	color[1].r = 0
	color[1].g = 0
	color[1].b = 0
	color[1].a = 255
	// orange highlight
	color[2].r = 246
	color[2].g = 197
	color[2].b = 47
	color[2].a = 255
	// olive drab
	color[3].r = 116
	color[3].g = 110
	color[3].b = 70
	color[3].a = 255
	
endFunction

function initPos()
	
	position.bStartX		= 10.0
	position.bStartY		= 80.0
	position.bWidth			= 20.0
	
endFunction
