/* *******************************************
 *
 * views.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/

function mainScreen(dev as device_t)
	
	m					as mouse_t
	bState				as buttonState_t
	keyTimer			as timer_t
	keyString			as keyString_t
	blinkTimer			as timer_t
	blink				as integer
	keyPressed			as integer
	coord				as coord_t[1]
	calc				as calc_t
	mortar				as mortar_t[]
	mrtIndex			as integer

	placeMainScreen()
	
	mortar = initMortar()
	mrtIndex = 0
	bState.latch[0] = true
	bState.latch[1] = false
	bState.calc = false
	keyString.text[0] =["A", "1", "7", "7"]
	keyString.text[1] =["A", "1", "7", "7"]
	bState.mode = POS
	bState.secondDigit = false
	setKeyLatchHighlight(POS)
	bState.active = false
	placeLCDTextNumeric(keyString.text)
	placeCalcText(mortar[mrtIndex])
	initCoord(coord)
	activeKey = sprite.bSmall[0]

	blinkTimer = setTimer(250)
	
	do
		m = updateMouse()
		
		if m.hit
			spr = getMouseHit(m)
			if displayHit(spr)
				resMode = not resMode
				keyPressed = true
			endif
			if topRowKeys(spr)
				mrtIndex = getKeyTopRow(spr, mrtIndex, mortar, bState, calc)
				keyPressed = true
			else
				keyPressed = getKeyCalcView(spr, keyString, bState, mortar[mrtIndex], calc, coord)
			endif
			if keyPressed
				keyTimer = setTimer(75)
				bState.lastKey = spr
				bState.active = true
				updateLCDText(bState.mode, keyString)
				PlaySound(media.keyClick)
				for i = 0 to txt.lcdFloating.length
					SetTextVisible(txt.lcdFloating[i], 1)
				next i
			endif
		endif
		
		if bState.active and getTimer(keyTimer)
			bState.active = false
			if bState.activeKey <> sprite.bSmall[0] and bState.activeKey <> sprite.bSmall[2]
				setKeyHighlight(bState.activeKey, off)
			endif
		endif
		if getTimer(blinkTimer)
			blink = not blink
			blinkLCDText(bState.mode, keyString.position, blink)
		endif
		if bState.calc
			updateCalcText(calc)
			bState.calc = false
		endif
		//testKeyString(keyString, keyStringPosition, bState.mode, bState.secondDigit, dev)
		//testXY(calc)
		//testMils(calc.mils)
		sync()
	loop
	
endFunction

function getSecondDigit(ksp as integer, sd as integer)

	out as integer

	if ksp = 1 and sd = false
		out = true
	endif
	
endFunction out
