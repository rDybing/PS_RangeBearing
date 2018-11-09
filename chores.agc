/* *******************************************
 *
 * chores.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/

function calc(c as coord_t[], ks as string[][], mrt as mortar_t)

	calc 	as calc_t
	mrtX	as float
	mrtY	as float
	tgtX	as float
	tgtY	as float
	coordX	as float
	coordY	as float

	mrtX = (asc(ks[0, 0]) - 65) * 300
	mrtX = mrtX + (c[0].mini[val(ks[0, 2]) - 1])
	mrtX = mrtX + (c[0].micro[val(ks[0, 3]) - 1])
	mrtX = mrtX + (c[0].nano[val(ks[0, 4]) - 1])
	mrtY = (val(ks[0, 1]) - 1) * 300
	mrtY = mrtY + (c[1].mini[val(ks[0, 2]) - 1])
	mrtY = mrtY + (c[1].micro[val(ks[0, 3]) - 1])
	mrtY = mrtY + (c[1].nano[val(ks[0, 4]) - 1])

	tgtX = (asc(ks[1, 0]) - 65) * 300
	tgtX = tgtX + (c[0].mini[val(ks[1, 2]) - 1])
	tgtX = tgtX + (c[0].micro[val(ks[1, 3]) - 1])
	tgtX = tgtX + (c[0].nano[val(ks[1, 4]) - 1])
	tgtY = (val(ks[1, 1]) - 1) * 300
	tgtY = tgtY + (c[1].mini[val(ks[1, 2]) - 1])
	tgtY = tgtY + (c[1].micro[val(ks[1, 3]) - 1])
	tgtY = tgtY + (c[1].nano[val(ks[1, 4]) - 1])

	if tgtX > mrtX
		coordX = tgtX - mrtX
	elseif mrtX > tgtX
		coordX = mrtX - tgtX
	else
		coordX = 0.0
	endif

	if tgtY > mrtY
		coordY = tgtY - mrtY
	elseif mrtY > tgtY
		coordY = mrtY - tgtY
	else
		coordY = 0.0
	endif

	calc.range = sqrt((coordX ^ 2) + (coordY ^ 2))

    coordY = tgtY - mrtY
    coordX = tgtX - mrtX
    calc.angle = atanfull(coordX, coordY)
	calc.mils = calcMortarMils(calc.range, mrt)

	calc.mX = str(mrtX)
	calc.mY = str(mrtY)
	calc.tX = str(tgtX)
	calc.tY = str(tgtY)
	calc.a = str(calc.angle)

endFunction calc

function calcMortarMils(distance as integer, mrt as mortar_t)
	
	mils as float
	mFraction as float
	
	i = 0

	if distance = 0
		mils = 1600
	else
		while mrt.table[i].range < distance and i < 24
			inc i
		endWhile
		
		if i <> 24
			distance = distance - mrt.table[i].range
			mils = mrt.table[i].mils
			mFraction = (mils - mrt.table[i + 1].mils) / 50
			mils = mils - (distance * mFraction)
		else
			mils = mrt.table[i].mils
			if distance > mrt.table[i].range
				mils = 0
			endif
		endif 
	endif
	
endFunction mils

function setTimer(freq as integer)

	t as timer_t

	t.new = GetMilliseconds()
	t.old = t.new
	t.freq = freq

endFunction t

function getTimer(t ref as timer_t)
	
	out as integer = false
	
	t.new = GetMilliseconds()
	
	if t.new > t.old + t.freq
		t.old = t.new
		out = true
	endif
	
endFunction out

function topRowKeys(spr as integer)

	out = false

	if spr = sprite.bMrtPrev or spr = sprite.bMrtNext or spr = sprite.bAbout
		out = true
	endif
	
endFunction out
