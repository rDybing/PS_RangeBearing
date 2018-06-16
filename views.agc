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
	keyString			as string[1, 4]
	keyStringPosition	as integer
	blinkTimer			as timer_t
	blink				as integer
	keyPressed			as integer
	coord				as coord_t[1]
	calc				as calc_t
	mortar				as mortar_t[]
		
	placeMainScreen()
	
	bState.latch[0] = true
	bState.latch[1] = false
	bState.calc = false
	keyString[0] =["A", "1", "7", "7", "7"]
	keyString[1] =["A", "1", "7", "7", "7"]
	bState.mode = POS
	bState.secondDigit = false
	setKeyLatchHighlight(POS)
	bState.active = false
	placeLCDTextNumeric(keyString)
	placeCalcText()
	initCoord(coord)
	mortar = initMortar()
	activeKey = sprite.bSmall[0]

	blinkTimer = setTimer(250)
	
	do
	
		m = updateMouse()
		
		if m.hit
			
			spr = getMouseHit(m)
			keyPressed = true
			
			select spr
			// --- Key MRT
			case sprite.bSmall[0]
				if bState.latch[1]
					bState.latch[0] = true
					bState.latch[1] = false
					bState.mode = POS
					keyStringPosition = 0
					setKeyLatchHighlight(POS)
					activeKey = sprite.bSmall[0]
				endif				
			endCase
			// --- Key 0
			case sprite.bSmall[1]
				if keyStringPosition = 1 and bState.secondDigit = true					
					setKeyString(spr, keyString, bState, keyStringPosition, 0, 0)
					activeKey = setKeyHighlight(sprite.bSmall[1], on)
					bState.secondDigit = false
				endif
			endCase
			// --- Key TGT
			case sprite.bSmall[2]
				if bState.latch[0]
					bState.latch[0] = false
					bState.latch[1] = true
					bState.mode = TGT
					keyStringPosition = 0
					setKeyLatchHighlight(TGT)
					activeKey = sprite.bSmall[2]
				endif			
			endCase
			// --- Key 1 - ABC
			case sprite.bSmall[3]
				setKeyString(spr, keyString, bState, keyStringPosition, 0, 1)
				activeKey = setKeyHighlight(sprite.bSmall[3], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 2 - DEF
			case sprite.bSmall[4]
				setKeyString(spr, keyString, bState, keyStringPosition, 3, 2)
				activeKey = setKeyHighlight(sprite.bSmall[4], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 3 - GHI
			case sprite.bSmall[5]
				setKeyString(spr, keyString, bState, keyStringPosition, 6, 3)
				activeKey = setKeyHighlight(sprite.bSmall[5], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 4 - JKL
			case sprite.bSmall[6]
				setKeyString(spr, keyString, bState, keyStringPosition, 9, 4)
				activeKey = setKeyHighlight(sprite.bSmall[6], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 5 - MNO
			case sprite.bSmall[7]
				setKeyString(spr, keyString, bState, keyStringPosition, 12, 5)
				activeKey = setKeyHighlight(sprite.bSmall[7], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 6 - PQR
			case sprite.bSmall[8]
				setKeyString(spr, keyString, bState, keyStringPosition, 15, 6)
				activeKey = setKeyHighlight(sprite.bSmall[8], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 7 - STU
			case sprite.bSmall[9]
				setKeyString(spr, keyString, bState, keyStringPosition, 18, 7)
				activeKey = setKeyHighlight(sprite.bSmall[9], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 8 - VWX
			case sprite.bSmall[10]
				setKeyString(spr, keyString, bState, keyStringPosition, 21, 8)
				activeKey = setKeyHighlight(sprite.bSmall[10], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key 9 - YZ
			case sprite.bSmall[11]
				if spr <> bState.lastKey
					bState.hits = 0
				endif
				setKeyString(spr, keyString, bState, keyStringPosition, 24, 9)
				activeKey = setKeyHighlight(sprite.bSmall[11], on)
				bState.secondDigit = getSecondDigit(keyStringPosition, bState.secondDigit)
			endCase
			// --- Key CALC
			case sprite.bLarge[0]
				activeKey = setKeyHighlight(sprite.bLarge[0], on)
				calc = calc(coord, keyString, mortar[0])
				bState.calc = true
			endCase
			// --- Key NEXT
			case sprite.bLarge[1]
				if keyStringPosition = 1
					if val(keyString[0, 1]) = 0
						keyString[0, 1] = "1"
					endif
					if val(keyString[1, 1]) = 0
						keyString[1, 1] = "1"
					endif
				endif
				if keyStringPosition < 4
					inc keystringPosition
				else
					keyStringPosition = 0
				endif
				activeKey = setKeyHighlight(sprite.bLarge[1], on)
				bState.singleDigit = true		
			endCase
			case default
				keyPressed = false
			endCase
			endSelect

			if keyPressed
				keyTimer = setTimer(75)
				bState.lastKey = spr
				bState.active = true
				updateLCDText(bState.mode, keyString, keyStringPosition)
				PlaySound(media.keyClick)
				for i = 0 to txt.lcdFloating.length
					SetTextVisible(txt.lcdFloating[i], 1)
				next i
			endif
		endif
		
		if bState.active and getTimer(keyTimer)
			bState.active = false
			if activeKey <> sprite.bSmall[0] and activeKey <> sprite.bSmall[2]
				setKeyHighlight(activeKey, off)
			endif
		endif

		if getTimer(blinkTimer)
			blink = not blink
			blinkLCDText(bState.mode, keyStringPosition, blink)
		endif

		if bState.calc
			updateCalcText(calc)
			bState.calc = false
		endif
		
		//testKeyString(keyString, keyStringPosition, bState.mode, bState.secondDigit, dev)
		//testXY(calc)
		testMils(calc.mils)
		sync()
	loop
	
endFunction

function getSecondDigit(ksp as integer, sd as integer)

	out as integer

	if ksp = 1 and sd = false
		out = true
	endif
	
endFunction out

function testMils(mils as integer)

	print("Mils: " + str(mils))

endFunction

function testKeyString(ks as string[][], ksp as integer, mode as integer, sd as integer, dev as device_t)
	
	outPOS as string = "POS: "
	outTGT as string = "TGT: "
	
	for i = 0 to 4
		outPOS = outPOS + ks[0, i] + "-"
		outTGT = outTGT + ks[1, i] + "-"
	next i
	
	print(outPOS)
	print(outTGT)
	print("KeyPos: " + str(ksp))
	if mode = POS
		print("Mode: POS")
	else
		print("Mode: TGT")
	endif
	print("Sec. Digit: " + str(sd))
	print(dev.aspect)
endFunction

function testXY(c as calc_t)

	print("mrt X: " + c.mX)
	print("mrt Y: " + c.mY)
	print("tgt X: " + c.tX)
	print("tgt Y: " + c.tY)
	print("angle: " + c.a)

endFunction
