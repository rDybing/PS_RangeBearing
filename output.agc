/* *******************************************
 *
 * output.agc
 *
 * Project: msSignServe
 *
 * *******************************************/
 
 // ************************************************ Static Functions **************************************************
 
function setBackground()
	
	spr as spriteProp_t
	
	spr.posX = 0
	spr.posY = 0
	spr.width = 100
	spr.height = 100
	
	imageSetup(sprite.back, layer.back, spr, media.back)

endFunction

// ************************************************ Chores Functions ***************************************************

function backSetup(sID as integer, depth as integer, spr as spriteProp_t, iID as integer)

	if GetSpriteExists(sID) = true
		DeleteSprite(sID)
	endif

	CreateSprite(sID, iID)
	SetSpritePosition(sID, spr.posX, spr.posY)
	SetSpriteColorAlpha(sID, 255)
	SetSpriteDepth(sID, depth)
	SetSpriteVisible(sID, 1)
	SetSpriteSize(sID, spr.width, spr.height)

endFunction

function imageSetup(sID as integer, depth as integer, spr as spriteProp_t, iID as integer)

	if GetSpriteExists(sID) = true
		DeleteSprite(sID)
	endif

	CreateSprite(sID, iID)
	SetSpritePosition(sID, spr.posX, spr.posY)
	SetSpriteColorAlpha(sID, 255)
	SetSpriteDepth(sID, depth)
	SetSpriteVisible(sID, 1)
	SetSpriteSize(sID, spr.width, spr.height)

endFunction

function spriteSetup(sID as integer, depth as integer, spr as spriteProp_t, iID0 as integer, iID1 as integer)
	
	if GetSpriteExists(sID) = true
		DeleteSprite(sID)
	endif

	CreateSprite(sID, iID0)
	AddSpriteAnimationFrame(sID, iID0)
	AddSpriteAnimationFrame(sID, iID1)
	SetSpritePosition(sID, spr.posX, spr.posY)
	SetSpriteColorAlpha(sID, 255)
	SetSpriteDepth(sID, depth)
	SetSpriteFrame(sID, 1)
	SetSpriteVisible(sID, 1)
	SetSpriteSize(sID, spr.width, -1)

endFunction

function spriteFromDot(sID as integer, depth as integer, spr as spriteProp_t, image as integer, col as color_t)
	
	if GetSpriteExists(sID) = true
		DeleteSprite(sID)
	endif

	createSprite(sID, image)
	setSpritePosition(sID, spr.posX, spr.posY)
	setSpriteColor(sID, col.r, col.g, col.b, col.a)
	setSpriteDepth(sID, depth)
	setSpriteVisible(sID, 1)
	setSpriteSize(sID, spr.width, spr.height)
	
endFunction

function clearSprites(start as integer, stop as integer)
	
	for i = start to stop 
		if GetSpriteExists(i)
			DeleteSprite(i)
		endif
	next i
	
endFunction

function highlightSprite(sprID as integer, col as color_t)
	
	SetSpriteColor(sprID, col.r, col.g, col.b, col.a)
	
endFunction

function swapSprites(start as integer, stop as integer, in as integer)
	
	for i = start to stop
		if i <> in
			SetSpriteFrame(i, 1)
		else
			SetSpriteFrame(i, 2)
		endif
	next i
				
endFunction

function initWaitSprite()
	
	spr as spriteProp_t
	
	spr.posX = 17
	spr.posY = 30
	spr.height = -1
	spr.width = 20
	
	createSprite(sprite.waiting, media.waiting[0])
	for i = 1 to media.waiting.length
		AddSpriteAnimationFrame(sprite.waiting, media.waiting[i])
	next i
	SetSpriteFrame(sprite.waiting, 1)
	SetSpriteDepth(sprite.waiting, layer.B)
	setSpriteVisible(sprite.waiting, false)
	setSpriteSize(sprite.waiting, spr.width, spr.height)
	SetSpritePosition(sprite.waiting, spr.posX - round(spr.width / 2), spr.posY)
	StopSprite(sprite.waiting)
	
endFunction

function setWaitStatus(isTrue as integer)
	
	setSpriteFrame(sprite.waiting, 1)
	setSpriteVisible(sprite.waiting, isTrue)
	
	if isTrue
		//clearText(txt.menu, txt.menu) // temp whilst no video
		PlaySprite(sprite.waiting)
	else
		StopSprite(sprite.waiting)
	endif
	
endFunction

