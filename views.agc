/* *******************************************
 *
 * views.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/

function mainScreen()
	
	m					as mouse_t
	bState				as buttonState_t
	keyTimer			as timer_t
	keyString			as string[1, 4]
	keyStringPosition	as integer
	
	placeMainScreen()
	
	bState.latch[0] = true
	bState.latch[1] = false
	keyString[0] =["A", "1", "1", "1", "5"]
	keyString[1] =["A", "1", "1", "1", "5"]
	bState.mode = POS
	
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
				endif				
			endCase
			// --- Key 0
			case sprite.bSmall[1]
				setKeyString(spr, keyString, bState, keyStringPosition, 0, 0)
			endCase
			// --- Key TGT
			case sprite.bSmall[2]
				if bState.latch[0]
					bState.latch[0] = false
					bState.latch[1] = true
					bState.mode = TGT
					keyStringPosition = 0
				endif			
			endCase
			// --- Key 1 - ABC
			case sprite.bSmall[3]
				setKeyString(spr, keyString, bState, keyStringPosition, 0, 1)			
			endCase
			// --- Key 2 - DEF
			case sprite.bSmall[4]
				setKeyString(spr, keyString, bState, keyStringPosition, 3, 2)
			endCase
			// --- Key 3 - GHI
			case sprite.bSmall[5]
				setKeyString(spr, keyString, bState, keyStringPosition, 6, 3)
			endCase
			// --- Key 4 - JKL
			case sprite.bSmall[6]
				setKeyString(spr, keyString, bState, keyStringPosition, 9, 4)
			endCase
			// --- Key 5 - MNO
			case sprite.bSmall[7]
				setKeyString(spr, keyString, bState, keyStringPosition, 12, 5)
			endCase
			// --- Key 6 - PQR
			case sprite.bSmall[8]
				setKeyString(spr, keyString, bState, keyStringPosition, 15, 6)
			endCase
			// --- Key 7 - STU
			case sprite.bSmall[9]
				setKeyString(spr, keyString, bState, keyStringPosition, 18, 7)
			endCase
			// --- Key 8 - VWX
			case sprite.bSmall[10]
				setKeyString(spr, keyString, bState, keyStringPosition, 21, 8)
			endCase
			// --- Key 9 - YZ
			case sprite.bSmall[11]
				setKeyString(spr, keyString, bState, keyStringPosition, 24, 9)
			endCase
			// --- Key CALC
			case sprite.bLarge[0]
			
			endCase
			// --- Key NEXT
			case sprite.bLarge[1]
				if keyStringPosition < 4
					inc keystringPosition
				else
					keyStringPosition = 0
				endif			
			endCase
			endSelect
			
			bState.lastKey = spr
			
		endif
		testKeyString(keyString, keyStringPosition, bState.mode)
		sync()
	
	loop
	
endFunction

function placeMainScreen()
	
	placeButtonsSmall()
	placeButtonsLarge()
	placeNumericKeysTxt()
	placeNextKeyTxt()
	placeCalcKeyTxt()
	placeAlphaKeysTxt()
	
endFunction

function testKeyString(ks as string[][], ksp as integer, mode as integer)
	
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
	
endFunction
