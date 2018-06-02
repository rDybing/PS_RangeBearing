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
	
	sprite.back				= 8999	
	
	// images	
	media.font				= 9000
	media.fontB				= 9001
	media.back				= 9004

	for i = 0 to media.waiting.length
		media.waiting[i] = 9100 + i
	next i
	
endFunction

function initColor()

	// white
	color[0].r = 255
	color[0].g = 255
	color[0].b = 255
	color[0].a = 255
	// dark red
	color[1].r = 110
	color[1].g = 60
	color[1].b = 57
	color[1].a = 255
	// grey
	color[2].r = 160
	color[2].g = 160
	color[2].b = 160
	color[2].a = 255
	// orange
	color[3].r = 255
	color[3].g = 192
	color[3].b = 24
	color[3].a = 255
	
endFunction

