
/* *******************************************
 *
 * tests.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/

function testKeyString(ks as string[][])
	
	outPOS as string = "POS"
	outTGT as string = "TGT"
	
	for i = 0 to 4
		outPOS = outPOS + ks[0, i]
		outTGT = outTGT + ks[1, i]
		if i <> 0 or i <> 4 
			outPOS = outPOS + "-"
			outTGT = outTGT + "-"
		endif
	next i
	
	print(outPOS)
	print(outTGT)
	
endFunction
