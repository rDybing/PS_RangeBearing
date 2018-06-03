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
	
	placeMainScreen()
	
	bState.latch[0] = true
	bState.latch[1] = false
	keyString[0] =["A", "10", "1", "1", "5"]
	keyString[1] =["A", "10", "1", "1", "5"]
	bState.mode = POS
	setKeyLatchHighlight(POS)
	bState.active = false
	placeLCDTextNumeric(keyString)

	blinkTimer = setTimer(250)
	
	do
	
		m = updateMouse()
		
		if m.hit
			
			spr = getMouseHit(m)
			
			select spr
			// --- Key POS
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
				setKeyString(spr, keyString, bState, keyStringPosition, 0, 0)
				activeKey = setKeyHighlight(sprite.bSmall[1], on)
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
			endCase
			// --- Key 2 - DEF
			case sprite.bSmall[4]
				setKeyString(spr, keyString, bState, keyStringPosition, 3, 2)
				activeKey = setKeyHighlight(sprite.bSmall[4], on)
			endCase
			// --- Key 3 - GHI
			case sprite.bSmall[5]
				setKeyString(spr, keyString, bState, keyStringPosition, 6, 3)
				activeKey = setKeyHighlight(sprite.bSmall[5], on)
			endCase
			// --- Key 4 - JKL
			case sprite.bSmall[6]
				setKeyString(spr, keyString, bState, keyStringPosition, 9, 4)
				activeKey = setKeyHighlight(sprite.bSmall[6], on)
			endCase
			// --- Key 5 - MNO
			case sprite.bSmall[7]
				setKeyString(spr, keyString, bState, keyStringPosition, 12, 5)
				activeKey = setKeyHighlight(sprite.bSmall[7], on)
			endCase
			// --- Key 6 - PQR
			case sprite.bSmall[8]
				setKeyString(spr, keyString, bState, keyStringPosition, 15, 6)
				activeKey = setKeyHighlight(sprite.bSmall[8], on)
			endCase
			// --- Key 7 - STU
			case sprite.bSmall[9]
				setKeyString(spr, keyString, bState, keyStringPosition, 18, 7)
				activeKey = setKeyHighlight(sprite.bSmall[9], on)
			endCase
			// --- Key 8 - VWX
			case sprite.bSmall[10]
				setKeyString(spr, keyString, bState, keyStringPosition, 21, 8)
				activeKey = setKeyHighlight(sprite.bSmall[10], on)
			endCase
			// --- Key 9 - YZ
			case sprite.bSmall[11]
				setKeyString(spr, keyString, bState, keyStringPosition, 24, 9)
				activeKey = setKeyHighlight(sprite.bSmall[11], on)
			endCase
			// --- Key CALC
			case sprite.bLarge[0]
				activeKey = setKeyHighlight(sprite.bLarge[0], on)			
			endCase
			// --- Key NEXT
			case sprite.bLarge[1]
				if keyStringPosition < 4
					inc keystringPosition
				else
					keyStringPosition = 0
				endif
				activeKey = setKeyHighlight(sprite.bLarge[1], on)
				bState.singleDigit = true		
			endCase
			endSelect

			keyTimer = setTimer(75)
			bState.lastKey = spr
			
			if activeKey = sprite.bSmall[0] or activeKey = sprite.bSmall[2]
				bState.active = false
			else
				bState.active = true
				updateLCDText(bState.mode, keyString, keyStringPosition)
			endif

			PlaySound(media.keyClick)

			for i = 0 to txt.lcdFloating.length
				SetTextVisible(txt.lcdFloating[i], 1)
			next i
			
		endif
		if bState.active and getTimer(keyTimer)
			bState.active = false
			setKeyHighlight(activeKey, off)
		endif

		if getTimer(blinkTimer)
			blink = not blink
			blinkLCDText(bState.mode, keyStringPosition, blink)
		endif
		
		//testKeyString(keyString, keyStringPosition, bState.mode, dev)
		sync()
	
	loop
	
endFunction

function testKeyString(ks as string[][], ksp as integer, mode as integer, dev as device_t)
	
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
	print(dev.aspect)
endFunction
