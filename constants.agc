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
	for i = 0 to 7
		txt.lcdFloating[i]	= 1039 + i // to 1046
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

endFunction

function initMortar()

	range as integer
	mrt as mortar_t[3]

	// German 50mm			Granatwerfer 36
	// German 80mm			Granatwerfer 34
	mrt[0].model = "GRW 34"
	range = 0
	for i = 0 to 24
		inc range, 50
		mrt[0].table[i].range = range
	next i
	mrt[0].table[0].mils = 1578
	mrt[0].table[1].mils = 1557
	mrt[0].table[2].mils = 1536
	mrt[0].table[3].mils = 1514
	mrt[0].table[4].mils = 1493
	mrt[0].table[5].mils = 1471
	mrt[0].table[6].mils = 1449
	mrt[0].table[7].mils = 1427
	mrt[0].table[8].mils = 1404
	mrt[0].table[9].mils = 1381
	mrt[0].table[10].mils = 1357
	mrt[0].table[11].mils = 1333
	mrt[0].table[12].mils = 1308
	mrt[0].table[13].mils = 1282
	mrt[0].table[14].mils = 1256
	mrt[0].table[15].mils = 1228
	mrt[0].table[16].mils = 1199
	mrt[0].table[17].mils = 1168
	mrt[0].table[18].mils = 1134
	mrt[0].table[19].mils = 1098
	mrt[0].table[20].mils = 1057
	mrt[0].table[21].mils = 1009
	mrt[0].table[22].mils = 947
	mrt[0].table[23].mils = 803
	mrt[0].table[24].mils = 0
	
	// British 3.0"
	mrt[1].model = "UK 3" + chr(34)
	range = 0
	for i = 0 to 24
		inc range, 50
		mrt[1].table[i].range = range
	next i
	mrt[1].table[0].mils = 1582
	mrt[1].table[1].mils = 1565
	mrt[1].table[2].mils = 1548
	mrt[1].table[3].mils = 1530
	mrt[1].table[4].mils = 1513
	mrt[1].table[5].mils = 1495
	mrt[1].table[6].mils = 1477
	mrt[1].table[7].mils = 1459
	mrt[1].table[8].mils = 1441
	mrt[1].table[9].mils = 1423
	mrt[1].table[10].mils = 1404
	mrt[1].table[11].mils = 1385
	mrt[1].table[12].mils = 1366
	mrt[1].table[13].mils = 1346
	mrt[1].table[14].mils = 1327
	mrt[1].table[15].mils = 1306
	mrt[1].table[16].mils = 1285
	mrt[1].table[17].mils = 1264
	mrt[1].table[18].mils = 1241
	mrt[1].table[19].mils = 1218
	mrt[1].table[20].mils = 1194
	mrt[1].table[21].mils = 1168
	mrt[1].table[22].mils = 1141
	mrt[1].table[23].mils = 1112
	mrt[1].table[24].mils = 1081
	
	// British 4.2"			
	mrt[2].model = "UK 4.2" + chr(34)
	range = 0
	for i = 0 to 24
		inc range, 50
		mrt[2].table[i].range = range
	next i
	mrt[2].table[0].mils = 1590
	mrt[2].table[1].mils = 1580
	mrt[2].table[2].mils = 1570
	mrt[2].table[3].mils = 1561
	mrt[2].table[4].mils = 1551
	mrt[2].table[5].mils = 1541
	mrt[2].table[6].mils = 1531
	mrt[2].table[7].mils = 1521
	mrt[2].table[8].mils = 1511
	mrt[2].table[9].mils = 1501
	mrt[2].table[10].mils = 1492
	mrt[2].table[11].mils = 1482
	mrt[2].table[12].mils = 1471
	mrt[2].table[13].mils = 1461
	mrt[2].table[14].mils = 1451
	mrt[2].table[15].mils = 1441
	mrt[2].table[16].mils = 1431
	mrt[2].table[17].mils = 1420
	mrt[2].table[18].mils = 1410
	mrt[2].table[19].mils = 1399
	mrt[2].table[20].mils = 1389
	mrt[2].table[21].mils = 1378
	mrt[2].table[22].mils = 1367
	mrt[2].table[23].mils = 1356
	mrt[2].table[24].mils = 1345

	// US 4"			
	mrt[3].model = "US M2 4" + chr(34)
	range = 0
	for i = 0 to 24
		inc range, 50
		mrt[3].table[i].range = range
	next i
	mrt[3].table[0].mils = 1582
	mrt[3].table[1].mils = 1565
	mrt[3].table[2].mils = 1548
	mrt[3].table[3].mils = 1530
	mrt[3].table[4].mils = 1513
	mrt[3].table[5].mils = 1495
	mrt[3].table[6].mils = 1477
	mrt[3].table[7].mils = 1459
	mrt[3].table[8].mils = 1441
	mrt[3].table[9].mils = 1423
	mrt[3].table[10].mils = 1404
	mrt[3].table[11].mils = 1385
	mrt[3].table[12].mils = 1366
	mrt[3].table[13].mils = 1346
	mrt[3].table[14].mils = 1327
	mrt[3].table[15].mils = 1306
	mrt[3].table[16].mils = 1285
	mrt[3].table[17].mils = 1264
	mrt[3].table[18].mils = 1241
	mrt[3].table[19].mils = 1218
	mrt[3].table[20].mils = 1194
	mrt[3].table[21].mils = 1168
	mrt[3].table[22].mils = 1141
	mrt[3].table[23].mils = 1112
	mrt[3].table[24].mils = 1081
	
endFunction mrt

