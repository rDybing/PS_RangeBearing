/* *******************************************
 *
 * constants.agc
 *
 * Project: msSignServe
 *
 * *******************************************/
 
 function constants()
/* *******************************************
 *
 * ID Map:
 *
 * 1000 -> 1089: UI text
 * 1090 -> 1099: Input text
 * 1100 -> 1199: Data text
 * 2000 -> 2099: Video
 * 8800 -> 8899: Sounds
 * 8900 -> 8999: Sprites
 * 9000 -> 9099: Media Files Import
 * 9100 -> 9199: Animation frames
 *
 * *******************************************/

	layer.front				= 0
	layer.A					= 10
	layer.B					= 20
	layer.C					= 30
	layer.D					= 40
	layer.back				= 999
		
	txt.ver					= 1000
	
	sprite.back				= 9004
	for i = 0 to 11
		sprite.bSmall[i] 	= 9010 + i
	next i
	sprite.bLarge[0]		= 9023
	sprite.bLarge[1]		= 9024

		
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
	
	pos.bStartX		= 10
	pos.bStartY		= 80
	pos.bWidth		= 20
	
endFunction
