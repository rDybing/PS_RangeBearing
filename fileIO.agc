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
	//loadImage(media.back, "grainyMetal02.jpg")
	loadImage(media.back, "carbon_background.jpg")
	loadImage(media.bSmall, "button_small.png")
	loadImage(media.bLarge, "button_large.png")
	loadImage(media.lcd, "lcdDisplayAdjusted.png")

	LoadSound(media.keyClick, "keyClick.wav")
		
endFunction
