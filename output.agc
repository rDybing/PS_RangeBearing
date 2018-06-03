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
	SetSpriteColor(sprite.back, color[3].r, color[3].g, color[3].b, color[3].a)

endFunction

function placeButtonsSmall()
	
	newLine	as integer
	spr		as spriteProp_t
	
	spr.posX = pos.bStartX
	spr.posY = pos.bStartY
	spr.width = pos.bWidth
	spr.height = -1
	
	for i = 0 to 11
		if newLine > 2
			newLine = 0
			spr.posY = spr.posY - GetSpriteHeight(sprite.bSmall[0])
		endif
		if newRow > 2
			newRow = 0
			spr.posX = pos.bStartX
		endif
		
		spr.posX = pos.bStartX + (spr.width * newRow)
			
		imageSetup(sprite.bSmall[i], layer.D, spr, media.bSmall)
		
		inc newLine
		inc newRow
	next i
	
endFunction

function placeButtonsLarge()
	
	spr as spriteProp_t
	
	spr.posX = pos.bStartX + (pos.bWidth * 3)
	spr.posY = pos.bStartY - GetSpriteHeight(sprite.bSmall[0])
	spr.width = pos.bWidth
	spr.height = -1
	
	imageSetup(sprite.bLarge[0], layer.D, spr, media.bLarge)
	spr.posY = spr.posY - GetSpriteHeight(sprite.bLarge[0])
	imageSetup(sprite.bLarge[1], layer.D, spr, media.bLarge)
	
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
