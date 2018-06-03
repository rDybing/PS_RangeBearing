/* *******************************************
 *
 * text.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/
 
 function setKeyString(spr as integer, ks ref as string[][], bState ref as buttonState_t, ksp as integer, keyOffset as integer, key as integer)
	
	reset as integer = false
	
	if ksp = 0
		if key <> 9 and key <> 0
			if spr <> bState.lastKey
				bState.hits = 0
			endif
			select bState.hits
			case 0
				ks[bState.mode, ksp] = chr(65 + keyOffset)
			endCase
			case 1
				ks[bState.mode, ksp] = chr(66 + keyOffset)
			endCase
			case 2
				ks[bState.mode, ksp] = chr(67 + keyOffset)
				reset = true
			endCase
			endSelect
		elseif key = 9
			select bState.hits
			case 0
				ks[bState.mode, ksp] = chr(65 + keyOffset)
			endCase
			case 1
				ks[bState.mode, ksp] = chr(66 + keyOffset)
				reset = true
			endCase
			endSelect
		endif
		if reset
			bState.hits = 0
		else
			inc bState.hits
		endif
	endif
	if ksp > 0
		if ksp = 1
			if len(ks[bState.mode, ksp]) = 1 and bState.singleDigit = false
				ks[bState.mode, ksp] = ks[bState.mode, ksp] + str(key)
			else
				ks[bState.mode, ksp] = str(key)
				bState.singleDigit = false
			endif
		else
			ks[bState.mode, ksp] = str(key)
		endif
	endif
				
endFunction
 
// ************************************************ Placement **********************************************************

function placeLCDText()

	mt as txtProp_t
	out as string[2]
	
	if position.lcdFudgeY = 0.0
		out = ["MORTAR POSITION", "TARGET POSITION", "BEARING                                        DISTANCE"]
	else
		out = ["MORTAR POSITION", "TARGET POSITION", "BEARING                                                            DISTANCE"]
	endif

	setFontProperties(color[1].r, color[1].g, color[1].b, media.font, 1.75)
	
	for i = 0 to 2
		setTextProperties(mt, position.lcdStartX + 10.5, position.lcdStartY + 3.5 + position.lcdFudgeY + ((GetSpriteHeight(sprite.lcd) / 4.25) * i), 0)
		createText(txt.lcdFixed[i], out[i])
		textDraw(txt.lcdFixed[i], mt)
	next i		

endFunction

function placeLCDTextNumeric(ks as string[][])

	mt as txtProp_t
	posX as float
	posY as float
	offsetX = 13
	offsetXX = 6
	
	posX = getTextX(txt.lcdFixed[0]) + 3
	posY = getTextY(txt.lcdFixed[0]) + 2.2
	setFontProperties(color[1].r, color[1].g, color[1].b, media.fontB, 3.1)

	k = 0
	for i = 0 to 1
		for j = 0 to 4
			if j > 1				
				setTextProperties(mt, posX - 11 + (offsetX * j), posY + ((GetSpriteHeight(sprite.lcd) / 4.25) * i), 0)
				createText(txt.lcdFloating[k], " - " + ks[i, j])
			else
				setTextProperties(mt, posX + (offsetXX * j), posY + ((GetSpriteHeight(sprite.lcd) / 4.25) * i), 0)
				createText(txt.lcdFloating[k], ks[i, j])
			endif
			textDraw(txt.lcdFloating[k], mt)
			inc k
		next j
	next i

endFunction

function placeCalcText()

	mt as txtProp_t
	posX as float
	posY as float
	offsetX = 13
	offsetXX = 6
	
	posX = getTextX(txt.lcdFixed[0]) + 1
	posY = getTextY(txt.lcdFixed[0]) + (GetSpriteHeight(sprite.lcd) / 4.25) * 2.37
	setFontProperties(color[1].r, color[1].g, color[1].b, media.fontB, 3.1)

	setTextProperties(mt, posX - 11 + (offsetX), posY, 0)
	createText(txt.lcdCalc[0], "000.0'")
	textDraw(txt.lcdCalc[0], mt)
	setTextProperties(mt, 50, posY, 0)
	createText(txt.lcdCalc[1], "0000m")
	textDraw(txt.lcdCalc[1], mt)

endFunction

function updateCalcText(c as calc_t)

	bearing	as string
	range	as string
	
	bearing = str(c.angle, 1) + "'"
	if len(bearing) = 4
		bearing = "00" + bearing
	elseif len(bearing) = 5
		bearing = "0" + bearing
	endif
	SetTextString(txt.lcdCalc[0], bearing)
	
	range = str(c.range, 0) + "m"
	if len(range) = 2
		range = "000" + range
	elseif len(range) = 3
		range = "00" + range
	elseif len(range) = 4
		range = "0" + range
	endif
	SetTextString(txt.lcdCalc[1], range)

endFunction

function blinkLCDText(mode as integer, kp as integer, onOff as integer)

	index as integer = 0

	if mode = TGT
		index = 5
	endif

	index = index + kp
	
	SetTextVisible(txt.lcdFloating[index], onOff)

endFunction

function updateLCDText(mode as integer, ks as string[][], kp as integer)

	index as integer = 0

	if mode = TGT
		index = 5
	endif

	index = index + kp

	if kp > 1
		SetTextString(txt.lcdFloating[index], " - " + ks[mode, kp])
	else
		SetTextString(txt.lcdFloating[index], ks[mode, kp])
	endif

endFunction

function placeNumericKeysTxt()

	mt as txtProp_t

	setFontProperties(color[0].r, color[0].g, color[0].b, media.font, 6.3)

	for i = 0 to 11

		setTextProperties(mt, getSpriteX(sprite.bSmall[i]) + (GetSpriteWidth(sprite.bSmall[i]) / 2), getSpriteY(sprite.bSmall[i]) + 3.5, 1)
		select i
		case 0
			CreateText(txt.num[i], "POS")
		endCase
		case 1
			CreateText(txt.num[i], "0")
		endCase
		case 2
			CreateText(txt.num[i], "TGT")
		endCase
		case default
			CreateText(txt.num[i], str(i - 2))
		endCase
		endSelect
		textDraw(txt.num[i], mt)

	next i

endFunction

function placeAlphaKeysTxt()
	
	mt		as txtProp_t
	alpha	as string[8] = ["ABC", "DEF", "GHI", "JKL", "MNO", "PQR", "STU", "VWX", "YZ"]
	
	setFontProperties(color[0].r, color[0].g, color[0].b, media.font, 3.5)

	for i = 3 to 11

		setTextProperties(mt, getSpriteX(sprite.bSmall[i]) + (GetSpriteWidth(sprite.bSmall[i]) / 2), getSpriteY(sprite.bSmall[i]) + 1, 1)
		CreateText(txt.alpha[i - 3], alpha[i - 3])
		textDraw(txt.alpha[i - 3], mt)

	next i
	
endFunction

function placeNextKeyTxt()

	mt as txtProp_t
	nextChars as string[3] = ["N", "E", "X", "T"]
	offsetY as integer = 5
	
	setFontProperties(color[0].r, color[0].g, color[0].b, media.font, 6.3)

	for i = 0 to 3
		
		setTextProperties(mt, getSpriteX(sprite.bLarge[1]) + (GetSpriteWidth(sprite.bLarge[1]) / 2), getSpriteY(sprite.bLarge[1]) + (offsetY * i) + 0.75, 1)
		createText(txt.large[i], nextChars[i])	
		textDraw(txt.large[i], mt)

	next i

endFunction

function placeCalcKeyTxt()

	mt as txtProp_t
	calcChars as string[3] = ["C", "A", "L", "C"]
	offsetY as integer = 5
	
	setFontProperties(color[0].r, color[0].g, color[0].b, media.font, 6.3)

	for i = 0 to 3
	
		setTextProperties(mt, getSpriteX(sprite.bLarge[0]) + (GetSpriteWidth(sprite.bLarge[0]) / 2), getSpriteY(sprite.bLarge[0]) + (offsetY * i) + 0.75, 1)
		createText(txt.large[i + 4], calcChars[i])
		textDraw(txt.large[i + 4], mt)

	next i

endFunction

// ************************************************ Chores *************************************************************

function fadeText(startTxt as integer, stopTxt as integer, dir as string)
	
	incr as integer
	
	select dir
	case "in"
		start = 0
		stop = 255
		incr = 16
	endCase
	case "out"
		start = 255
		stop = 0
		incr = -16
	endCase
	endSelect
	// fade in/out
	for i = start to stop step incr
		for j = startTxt to stopTxt
			SetTextColorAlpha(j, i)
		next j
		sync()
	next i
	
	for i = startTxt to stopTxt
		SetTextColorAlpha(i, stop)
	next i
	
	if dir = "out"
		clearText(startTxt, stopTxt)
	endif
	
endFunction
 
function textDraw(id as integer, mt as txtProp_t)

	SetTextFont(id, font.id)
	SetTextColor(id, font.r, font.g, font.b, 255)
	SetTextSize(id, font.size)
	SetTextPosition(id, mt.startX, mt.startY)
	SetTextAlignment(id, mt.align)
	SetTextDepth(id, layer.front)
	SetTextVisible(id, 1)

endFunction

function setFontProperties(r as integer, g as integer, b as integer, fnt as integer, size as float)
	
	font.r = r
	font.g = g
	font.b = b
	font.id = fnt
	font.size = size

endFunction

function clearText(start as integer, stop as integer)

	for i = start to stop
		if getTextExists(i)
			deleteText(i)
		endif
	next i

endFunction

function setTextProperties(mt ref as txtProp_t, x as float, y as float, align as integer)
	
	mt.startX = x
	mt.startY = y
	mt.align = align	
	
endFunction mt

function setTxtPosition(x as float, y as float, hx as float, hy as float)
	
	out as txtProp_t
	
	out.startX = x
	out.startY = y
	out.offsetX = hx
	out.offsetY = hy
	
endFunction out
