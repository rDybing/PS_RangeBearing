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
	calc.mils = calcMortarMils(calc.range, mrt.velocity)

	calc.mX = str(mrtX)
	calc.mY = str(mrtY)
	calc.tX = str(tgtX)
	calc.tY = str(tgtY)
	calc.a = str(calc.angle)

endFunction calc

function calcMortarMils(distance as integer, velocity as float)

	mils as float
	degrees as float
	dist as float
	dist = distance

	degrees = atan((velocity ^ 2 + (sqrt((velocity ^ 4) - Gravity * (((Gravity * dist) ^ 2) + (2 * 0 * velocity) ^ 2)))) / (Gravity * dist))

	mils = (degrees * (Pi / 180)) / (Pi / 3200)

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
