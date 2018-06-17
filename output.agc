/* *******************************************
 *
 * output.agc
 *
 * Project: PS_RangeBearing
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

function placeMainScreen()
	
	placeButtonsSmall()
	placeButtonsLarge()
	placeButtonsUpper()
	placeNumericKeysTxt()
	placeNextKeyTxt()
	placeCalcKeyTxt()
	placeAlphaKeysTxt()
	placeUpperKeysTxt()
	placeLCD()
	placeLCDText()
	placeHexHeads()
	
endFunction

function placeLCD()

	spr as spriteProp_t

	spr.posX = position.lcdStartX
	spr.posY = position.lcdStartY
	spr.width = position.lcdWidth
	spr.height = spr.width / 2.75

	imageSetup(sprite.lcd, layer.C, spr, media.lcd)

endFunction

function placeButtonsSmall()
	
	newLine	as integer
	spr		as spriteProp_t
	
	spr.posX = position.bStartX
	spr.posY = position.bStartY
	spr.width = position.bWidth
	spr.height = -1
	
	for i = 0 to 11
		if newLine > 2
			newLine = 0
			spr.posY = spr.posY - GetSpriteHeight(sprite.bSmall[0])
		endif
		if newRow > 2
			newRow = 0
			spr.posX = position.bStartX
		endif
		
		spr.posX = position.bStartX + (spr.width * newRow)
			
		imageSetup(sprite.bSmall[i], layer.D, spr, media.bSmall)
		
		inc newLine
		inc newRow
	next i
	
endFunction

function placeButtonsLarge()
	
	spr as spriteProp_t
	
	spr.posX = position.bStartX + (position.bWidth * 3)
	spr.posY = position.bStartY - GetSpriteHeight(sprite.bSmall[0])
	spr.width = position.bWidth
	spr.height = -1
	
	imageSetup(sprite.bLarge[0], layer.D, spr, media.bLarge)
	spr.posY = spr.posY - GetSpriteHeight(sprite.bLarge[0])
	imageSetup(sprite.bLarge[1], layer.D, spr, media.bLarge)
	
endFunction

function placeButtonsUpper()
	
	spr as spriteProp_t
	
	spr.posX = position.bStartX
	spr.posY = position.bUpperY
	spr.width = position.bWidth * 2
	spr.height = -1
	
	imageSetup(sprite.bAbout, layer.D, spr, media.bLarge2)
	spr.width = position.bWidth
	spr.posX = spr.posX + (spr.width * 2)
	imageSetup(sprite.bMrtPrev, layer.D, spr, media.bSmall)
	spr.posX = spr.posX + spr.width
	imageSetup(sprite.bMrtNext, layer.D, spr, media.bSmall)
	
endFunction

function placeHexHeads()

	spr as spriteProp_t

	spr.posX = 1
	spr.posy = 1
	spr.width = 5
	spr.height = -1

	imageSetup(sprite.hexHead[0], layer.D, spr, media.hexHead)
	spr.posX = 99 - spr.width
	imageSetup(sprite.hexHead[1], layer.D, spr, media.hexHead)
	spr.posY = 99 - GetSpriteHeight(sprite.hexHead[0])
	imageSetup(sprite.hexHead[2], layer.D, spr, media.hexHead)
	spr.posX = 1
	imageSetup(sprite.hexHead[3], layer.D, spr, media.hexHead)

endFunction

function setKeyLatchHighlight(mode as integer)

	if mode = POS
		highLightSprite(sprite.bSmall[0], color[2])
		highlightText(sprite.bSmall[0], color[2])
		highLightSprite(sprite.bSmall[2], color[0])
		highlightText(sprite.bSmall[2], color[0])
	else
		highLightSprite(sprite.bSmall[0], color[0])
		highlightText(sprite.bSmall[0], color[0])
		highLightSprite(sprite.bSmall[2], color[2])
		highlightText(sprite.bSmall[2], color[2])
	endif

endFunction

function setKeyHighlight(spriteID as integer, mode as integer)

	if mode
		highLightSprite(spriteID, color[2])
		highlightText(spriteID, color[2])
	else
		highLightSprite(spriteID, color[0])
		highlightText(spriteID, color[0])
	endif

endFunction spriteID
 
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
