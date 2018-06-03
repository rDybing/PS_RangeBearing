/* *******************************************
 *
 * text.agc
 *
 * Project: fBus
 *
 * *******************************************/
 
// ************************************************ Placement **********************************************************

function placeNumericKeys()

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

function placeNextKeyTxt()

	mt as txtProp_t
	nextChars as string[4] = ["N", "E", "X", "T"]
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
	calcChars as string[4] = ["C", "A", "L", "C"]
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
