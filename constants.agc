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
	for i = 0 to 3
		txt.calc[i]			= 1022 + i // to 1025
	next i
	for i = 0 to 8
		txt.alpha[i]		= 1026 + i // to 1034
	next i
	for i = 0 to 3
		txt.lcdFixed[i]		= 1035 + i // to 1038
	next i
	for i = 0 to 9
		txt.lcdFloating[i]	= 1039 + i // to 1048
	next i
	txt.lcdCalc[0]			= 1049
	txt.lcdCalc[1]			= 1050
	txt.lcdCalc[2]			= 1051
	txt.test				= 1052
	txt.date				= 1053
	txt.bAbout				= 1054
	txt.bMrtPrev			= 1055
	txt.bMrtNext			= 1056
	txt.mrtModel			= 1057
	txt.coordPrev			= 1058
	txt.coordNext			= 1059
	
	// sprites
	sprite.back				= 9004
	for i = 0 to 11
		sprite.bSmall[i] 	= 9010 + i // to 9021
	next i
	sprite.bCalc			= 9022
	sprite.lcd				= 9023
	for i = 0 to 3
		sprite.hexHead[i]	= 9024 + i // to 9027
	next i
	sprite.bAbout			= 9028
	sprite.bMrtPrev			= 9029
	sprite.bMrtNext			= 9030
	sprite.bCoordPrev		= 9031
	sprite.bCoordNext		= 9032		

	// images	
	media.font				= 9000
	media.fontB				= 9001
	media.fontC				= 9003
	media.back				= 9004
	media.bSmall			= 9010
	media.bLarge			= 9011
	media.bLarge2			= 9012
	media.lcd				= 9013
	media.hexHead			= 9014

	// sounds
	media.keyClick			= 1
	
endFunction

function initColor()

	// white
	color[0].r = 225
	color[0].g = 225
	color[0].b = 225
	color[0].a = 225
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
	// full color
	color[4].r = 255
	color[4].g = 255
	color[4].b = 255
	color[4].a = 255
	
endFunction

function initPos(aspect as float)

	position.bStartY		= 85.0
	position.bUpperY		= 4.0
	position.lcdStartX		= 7.0
	position.lcdStartY		= 17.0
	position.lcdWidth		= 86.0
	position.lcdTxtDivY		= 5.0

	if aspect > 0.65
		position.lcdFudgeY		= 1.5
		position.bStartX		= 20.0
		position.bWidth			= 15.0
	else
		position.lcdFudgeY		= 0.0
		position.bStartX		= 10.0
		position.bWidth			= 20.0
	endif
	
endFunction

function initCoord(c ref as coord_t[])

	/*
	first dim = x or y
	second dim = strinKeyPosition
	all indexes shifted down one
	*/

	// X coords
	c[0].mini[0] = 0
	c[0].mini[3] = 0
	c[0].mini[6] = 0
	c[0].mini[1] = 100
	c[0].mini[4] = 100
	c[0].mini[7] = 100
	c[0].mini[2] = 200
	c[0].mini[5] = 200
	c[0].mini[8] = 200
	
	c[0].micro[0] = 0
	c[0].micro[3] = 0
	c[0].micro[6] = 0
	c[0].micro[1] = 33.33
	c[0].micro[4] = 33.33
	c[0].micro[7] = 33.33
	c[0].micro[2] = 66.66
	c[0].micro[5] = 66.66
	c[0].micro[8] = 66.66
	
	c[0].nano[0] = 0
	c[0].nano[3] = 0
	c[0].nano[6] = 0
	c[0].nano[1] = 11.11
	c[0].nano[4] = 11.11
	c[0].nano[7] = 11.11
	c[0].nano[2] = 22.22
	c[0].nano[5] = 22.22
	c[0].nano[8] = 22.22

	// Y coords
	c[1].mini[6] = 0
	c[1].mini[7] = 0
	c[1].mini[8] = 0
	c[1].mini[3] = 100
	c[1].mini[4] = 100
	c[1].mini[5] = 100
	c[1].mini[0] = 200
	c[1].mini[1] = 200
	c[1].mini[2] = 200

	c[1].micro[6] = 0
	c[1].micro[7] = 0
	c[1].micro[8] = 0
	c[1].micro[3] = 33.33
	c[1].micro[4] = 33.33
	c[1].micro[5] = 33.33
	c[1].micro[0] = 66.66
	c[1].micro[1] = 66.66
	c[1].micro[2] = 66.66

	c[1].nano[6] = 0
	c[1].nano[7] = 0
	c[1].nano[8] = 0
	c[1].nano[3] = 11.11
	c[1].nano[4] = 11.11
	c[1].nano[5] = 11.11
	c[1].nano[0] = 22.22
	c[1].nano[1] = 22.22
	c[1].nano[2] = 22.22

endFunction

function initMortar()

	/* From psmc:
	export const PS_GER_VELOCITY = 108;
	export const PS_BR1_VELOCITY = 160;
	export const PS_BR2_VELOCITY = 120;
	...oddly no shell weight...
	*/

	mrt as mortar_t[2]

	// German 50mm			Granatwerfer 36
	// German 80mm			Granatwerfer 34
	mrt[0].velocity	= 174.0		// m/s
	mrt[0].model	= "GW 34"
	// British 3.0"
	mrt[1].velocity = 200.0		// m/s
	mrt[1].model	= "3 INCH"
	// British 4.2"			
	mrt[2].velocity = 223.0		// m/s
	mrt[2].model	= "4.2 INCH"

endFunction mrt

