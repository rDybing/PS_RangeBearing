/* *******************************************
 *
 * fBus
 *
 * CC-BY Roy Dybing 2018
 *
 * slack:  rdybing
 * github: rDybing
 *
 * *******************************************/

#include "views.agc"
#include "output.agc"
#include "input.agc"
#include "text.agc"
#include "fileIO.agc"
#include "chores.agc"
#include "structs.agc"
#include "constants.agc"

#constant false		= 0
#constant true			= 1
#constant nil			= -1
#constant spaceKey		= 32
#constant escapeKey	= 27

global media		as media_t				// constant IDs
global font		as font_t				// constant IDs
global layer		as layer_t				// constant layer values
global sprite		as sprite_t				// constant IDs
global txt			as txt_t				// constant IDs
global color		as color_t[5]			// constant after init

aspect				as float				// constant after init
deviceX				as integer				// constant after init
deviceY				as integer				// constant after init
fDeviceX			as float				// constant after init
fDeviceY			as float				// constant after init

dev 				as device_t

SetRandomSeed(GetUnixTime())

dev.os = GetDeviceBaseName()
dev.model = GetDeviceType()

if dev.os = "linux" or dev.os = "windows" or dev.os = "pi"
	SetAntialiasMode(1)
	aspectMode = 1
	select aspectMode
	case 0									// 0 = iPad || 1 = iPhone
		dev.width = 768						// iPad 50% 4/3
		dev.height = 1024					// iPad 50% 4/3
	endCase
	case 1
		dev.width = 640 					// iPhone 16/9
		dev.height = 1136					// iPhone 16/9
	endCase
	case 2
		dev.width = 540
		dev.height = 888
	endCase
	endSelect
else
	dev.width = getDeviceWidth()
	dev.height = getDeviceHeight()
endif

// convert to float and get aspect
fDeviceX = dev.width
fDeviceY = dev.height
aspect = fDeviceX / fDeviceY

dev.aspect = str(aspect, 2)
dev.id = GetDeviceID()

if dev.id = ""
	dev.id = "NA"
endif

constants()
initColor()
importMedia()

SetErrorMode(2)
SetWindowTitle("fBus")
SetWindowSize(dev.width, dev.height, 0)
SetWindowAllowResize(1)
SetDisplayAspect(aspect)
SetScissor(0,0,0,0)
SetOrientationAllowed(1, 1, 0, 0)
SetSyncRate(30, 0)
UseNewDefaultFonts(1)
SetPrintSize(2.0)
SetPrintColor(255, 255, 0)

initWaitSprite()
setBackground()

main(dev)

function main(dev as device_t)

	do

		print("Hello")
		sync()

	loop

endFunction
