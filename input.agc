/* *******************************************
 *
 * input.agc
 *
 * Project: fBus
 *
 * *******************************************/
 
function updateMouse()
	
	m as mouse_t

	m.x = GetPointerX()
	m.y = GetPointerY()
	m.hit = GetPointerPressed()

endFunction m

function getMouseHit(m as mouse_t)
	
	m.spriteID = GetSpriteHit(m.x, m.y)
	
endFunction m

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

	m = getMouseHit(updateMouse())
	
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
