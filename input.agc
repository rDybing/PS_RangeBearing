/* *******************************************
 *
 * input.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/

// ************************************************ Views Keys *********************************************************

function getKeyCalcView(spr as integer, keyString ref as keyString_t, bState ref as buttonState_t, mortar as mortar_t, calc ref as calc_t, coord as coord_t[])

	keyPressed as integer = true

	if spr >= sprite.bSmall[3] and spr <= sprite.bSmall[10]
		// keypad 1 through 8
		index = spr - 9010
		setKeyString(spr, keyString, bState, (index - 3) * 3, index - 2)
		bState.activeKey = setKeyHighlight(sprite.bSmall[index], on)
		bState.secondDigit = getSecondDigit(keyString.position, bState.secondDigit)
	else
		select spr
		// --- Key MRT
		case sprite.bSmall[0]
			if bState.latch[1]
				bState.latch[0] = true
				bState.latch[1] = false
				bState.mode = POS
				keyString.position = 0
				setKeyLatchHighlight(POS)
				bState.activeKey = sprite.bSmall[0]
			endif				
		endCase
		// --- Key 0
		case sprite.bSmall[1]
			if keyString.position = 1 and bState.secondDigit = true					
				setKeyString(spr, keyString, bState, 0, 0)
				bState.activeKey = setKeyHighlight(sprite.bSmall[1], on)
				bState.secondDigit = false
			endif
		endCase
		// --- Key TGT
		case sprite.bSmall[2]
			if bState.latch[0]
				bState.latch[0] = false
				bState.latch[1] = true
				bState.mode = TGT
				keyString.position = 0
				setKeyLatchHighlight(TGT)
				bState.activeKey = sprite.bSmall[2]
			endif			
		endCase
		// --- Key 9 - YZ
		case sprite.bSmall[11]
			if spr <> bState.lastKey
				bState.hits = 0
			endif
			setKeyString(spr, keyString, bState, 24, 9)
			bState.activeKey = setKeyHighlight(sprite.bSmall[11], on)
			bState.secondDigit = getSecondDigit(keyString.position, bState.secondDigit)
		endCase
		// --- Key CALC
		case sprite.bCalc
			bState.activeKey = setKeyHighlight(sprite.bCalc, on)
			calc = calc(coord, keyString.text, mortar)
			bState.calc = true
		endCase
		// --- PREV
		case sprite.bCoordPrev
			if keyString.position = 1
				if val(keyString.text[0, 1]) = 0
					keyString.text[0, 1] = "1"
				endif
				if val(keyString.text[1, 1]) = 0
					keyString.text[1, 1] = "1"
				endif
			endif
			if keyString.position > 0
				dec keystring.position
			else
				keyString.position = 4
			endif
			bState.activeKey = setKeyHighlight(sprite.bCoordPrev, on)
			bState.singleDigit = true		
		endCase
		// --- Key NEXT
		case sprite.bCoordNext
			if keyString.position = 1
				if val(keyString.text[0, 1]) = 0
					keyString.text[0, 1] = "1"
				endif
				if val(keyString.text[1, 1]) = 0
					keyString.text[1, 1] = "1"
				endif
			endif
			if keyString.position < 4
				inc keystring.position
			else
				keyString.position = 0
			endif
			bState.activeKey = setKeyHighlight(sprite.bCoordNext, on)
			bState.singleDigit = true		
		endCase
		case default
				keyPressed = false
		endCase
		endSelect
	endif

endFunction keyPressed

function getKeyTopRow(spr as integer, mrtIndex as integer, mortar as mortar_t[], bState ref as buttonState_t, calc ref as calc_t)

		select spr
		// --- key << Prev Mortar Model
		case sprite.bMrtPrev
			bState.activeKey = setKeyHighlight(sprite.bMrtPrev, on)
			if mrtIndex = 0
				mrtIndex = mortar.length
			else
				dec mrtIndex
			endif
			calc.mils = calcMortarMils(calc.range, mortar[mrtIndex])
			updateMortarModelText(mortar[mrtIndex], calc.mils)			
		endCase
		// --- key >> Next Mortar Model
		case sprite.bMrtNext
			bState.activeKey = setKeyHighlight(sprite.bMrtNext, on)
			if mrtIndex = mortar.length
				mrtIndex = 0
			else
				inc mrtIndex
			endif
			calc.mils = calcMortarMils(calc.range, mortar[mrtIndex])
			updateMortarModelText(mortar[mrtIndex], calc.mils)				
		endCase
		// --- key ABOUT
		case sprite.bAbout
			bState.activeKey = setKeyHighlight(sprite.bAbout, on)
			OpenBrowser("https://dybings.blogspot.com/2018/06/post-scriptum-mortar-calculator.html")
		endCase
		endSelect

endFunction mrtIndex

// ************************************************ Chores *************************************************************
 
function updateMouse()
	
	m as mouse_t

	m.x = GetPointerX()
	m.y = GetPointerY()
	m.hit = GetPointerPressed()

endFunction m

function getMouseHit(m as mouse_t)
	
	m.spriteID = GetSpriteHit(m.x, m.y)
	
endFunction m.spriteID

function getMouseHover(spriteID)
	
	m as mouse_t
	out as integer
	
	m = updateMouse()
	
	if spriteID = getSpriteHit(m.x, m.y)
		out = true
	else 
		out = false
	endif
	
endfunction out

function getButton(sprID as integer)

	m as mouse_t
	out = false

	m.spriteID = getMouseHit(updateMouse())
	
	if m.hit and m.spriteID = sprID
		out = true
	endif
	
endFunction out

function getKey(key as integer)
	
	out as integer = false
	
	if GetRawKeyPressed(key)
		out = true
	endif
	
endFunction out
