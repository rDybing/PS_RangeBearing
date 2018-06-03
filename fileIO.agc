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
	loadFont(media.fontB, "")
	loadImage(media.back, "grainyMetal02.jpg")
	loadImage(media.bSmall, "button_small.png")
	loadImage(media.bLarge, "button_large.png")

	LoadSound(media.keyClick, "keyClick.wav")
		
endFunction
