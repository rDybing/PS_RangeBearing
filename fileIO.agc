/* *******************************************
 *
 * fileIO.agc
 *
 * Project: PS_RangeBearing
 *
 * *******************************************/
 
 // ************************************************ Load from Storage *************************************************
 
function importMedia()
	
	fileName as string 
	
	loadFont(media.font, "BebasKai-Regular.otf")
	loadFont(media.fontB, "lcd.ttf")
	LoadFont(media.fontC, "Roboto-Medium.ttf")
	//loadImage(media.back, "grainyMetal02.jpg")
	loadImage(media.back, "carbon_background.jpg")
	loadImage(media.bSmall, "button_small.png")
	loadImage(media.bLarge, "button_large.png")
	loadImage(media.bLarge2, "button_large2.png")
	loadImage(media.lcd, "lcdDisplayAdjusted2.png")
	loadImage(media.hexHead, "hexScrewHead.png")

	LoadSound(media.keyClick, "keyClick.wav")
		
endFunction
