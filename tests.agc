/* *******************************************
 *
 * tests.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/
 
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
