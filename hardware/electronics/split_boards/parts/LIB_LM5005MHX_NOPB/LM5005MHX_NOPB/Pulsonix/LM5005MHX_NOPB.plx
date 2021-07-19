PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//235059/450452/2.49/21/3/Integrated Circuit

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r145_45"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.45) (shapeHeight 1.45))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r435_315"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 3.15) (shapeHeight 4.35))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "SOP65P640X110-21N" (originalName "SOP65P640X110-21N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r145_45) (pt -2.925, 2.925) (rotation 90))
			(pad (padNum 2) (padStyleRef r145_45) (pt -2.925, 2.275) (rotation 90))
			(pad (padNum 3) (padStyleRef r145_45) (pt -2.925, 1.625) (rotation 90))
			(pad (padNum 4) (padStyleRef r145_45) (pt -2.925, 0.975) (rotation 90))
			(pad (padNum 5) (padStyleRef r145_45) (pt -2.925, 0.325) (rotation 90))
			(pad (padNum 6) (padStyleRef r145_45) (pt -2.925, -0.325) (rotation 90))
			(pad (padNum 7) (padStyleRef r145_45) (pt -2.925, -0.975) (rotation 90))
			(pad (padNum 8) (padStyleRef r145_45) (pt -2.925, -1.625) (rotation 90))
			(pad (padNum 9) (padStyleRef r145_45) (pt -2.925, -2.275) (rotation 90))
			(pad (padNum 10) (padStyleRef r145_45) (pt -2.925, -2.925) (rotation 90))
			(pad (padNum 11) (padStyleRef r145_45) (pt 2.925, -2.925) (rotation 90))
			(pad (padNum 12) (padStyleRef r145_45) (pt 2.925, -2.275) (rotation 90))
			(pad (padNum 13) (padStyleRef r145_45) (pt 2.925, -1.625) (rotation 90))
			(pad (padNum 14) (padStyleRef r145_45) (pt 2.925, -0.975) (rotation 90))
			(pad (padNum 15) (padStyleRef r145_45) (pt 2.925, -0.325) (rotation 90))
			(pad (padNum 16) (padStyleRef r145_45) (pt 2.925, 0.325) (rotation 90))
			(pad (padNum 17) (padStyleRef r145_45) (pt 2.925, 0.975) (rotation 90))
			(pad (padNum 18) (padStyleRef r145_45) (pt 2.925, 1.625) (rotation 90))
			(pad (padNum 19) (padStyleRef r145_45) (pt 2.925, 2.275) (rotation 90))
			(pad (padNum 20) (padStyleRef r145_45) (pt 2.925, 2.925) (rotation 90))
			(pad (padNum 21) (padStyleRef r435_315) (pt 0, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -3.9 3.55) (pt 3.9 3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 3.9 3.55) (pt 3.9 -3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 3.9 -3.55) (pt -3.9 -3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -3.9 -3.55) (pt -3.9 3.55) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.2 3.25) (pt 2.2 3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.2 3.25) (pt 2.2 -3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.2 -3.25) (pt -2.2 -3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.2 -3.25) (pt -2.2 3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.2 2.6) (pt -1.55 3.25) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.65 3.5) (pt -2.2 3.5) (width 0.2))
		)
	)
	(symbolDef "LM5005MHX_NOPB" (originalName "LM5005MHX_NOPB")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -325 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 5) (pt 0 mils -400 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -425 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 6) (pt 0 mils -500 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -525 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 7) (pt 0 mils -600 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -625 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 8) (pt 0 mils -700 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -725 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 9) (pt 0 mils -800 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -825 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 10) (pt 0 mils -900 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -925 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 11) (pt 700 mils -1400 mils) (rotation 90) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 725 mils -1170 mils) (rotation 90]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 12) (pt 1400 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 13) (pt 1400 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 14) (pt 1400 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 15) (pt 1400 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 16) (pt 1400 mils -400 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -425 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 17) (pt 1400 mils -500 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -525 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 18) (pt 1400 mils -600 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -625 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 19) (pt 1400 mils -700 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -725 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 20) (pt 1400 mils -800 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -825 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 21) (pt 1400 mils -900 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1170 mils -925 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 1200 mils 100 mils) (width 6 mils))
		(line (pt 1200 mils 100 mils) (pt 1200 mils -1200 mils) (width 6 mils))
		(line (pt 1200 mils -1200 mils) (pt 200 mils -1200 mils) (width 6 mils))
		(line (pt 200 mils -1200 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 1250 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 1250 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "LM5005MHX_NOPB" (originalName "LM5005MHX_NOPB") (compHeader (numPins 21) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "VCC") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "SD") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "VIN_1") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "4" (pinName "VIN_2") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "5" (pinName "SYNC") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "6" (pinName "COMP") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "7" (pinName "FB") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "8" (pinName "RT") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "9" (pinName "RAMP") (partNum 1) (symPinNum 9) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "10" (pinName "AGND") (partNum 1) (symPinNum 10) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "21" (pinName "EP") (partNum 1) (symPinNum 11) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "20" (pinName "BST") (partNum 1) (symPinNum 12) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "19" (pinName "PRE") (partNum 1) (symPinNum 13) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "18" (pinName "SW_2") (partNum 1) (symPinNum 14) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "17" (pinName "SW_1") (partNum 1) (symPinNum 15) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "16" (pinName "IS_2") (partNum 1) (symPinNum 16) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "15" (pinName "IS_1") (partNum 1) (symPinNum 17) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "14" (pinName "PGND_2") (partNum 1) (symPinNum 18) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "13" (pinName "PGND_1") (partNum 1) (symPinNum 19) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "12" (pinName "OUT") (partNum 1) (symPinNum 20) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "11" (pinName "SS") (partNum 1) (symPinNum 21) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "LM5005MHX_NOPB"))
		(attachedPattern (patternNum 1) (patternName "SOP65P640X110-21N")
			(numPads 21)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "5")
				(padNum 6) (compPinRef "6")
				(padNum 7) (compPinRef "7")
				(padNum 8) (compPinRef "8")
				(padNum 9) (compPinRef "9")
				(padNum 10) (compPinRef "10")
				(padNum 11) (compPinRef "11")
				(padNum 12) (compPinRef "12")
				(padNum 13) (compPinRef "13")
				(padNum 14) (compPinRef "14")
				(padNum 15) (compPinRef "15")
				(padNum 16) (compPinRef "16")
				(padNum 17) (compPinRef "17")
				(padNum 18) (compPinRef "18")
				(padNum 19) (compPinRef "19")
				(padNum 20) (compPinRef "20")
				(padNum 21) (compPinRef "21")
			)
		)
		(attr "Manufacturer_Name" "Texas Instruments")
		(attr "Manufacturer_Part_Number" "LM5005MHX/NOPB")
		(attr "Mouser Part Number" "926-LM5005MHX/NOPB")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/LM5005MHX-NOPB/?qs=QbsRYf82W3Hdo32mIlauHA%3D%3D")
		(attr "Arrow Part Number" "LM5005MHX/NOPB")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/lm5005mhxnopb/texas-instruments")
		(attr "Description" "7-75V Wide Vin, 2.5A Current Mode Non-Synchronous Buck Regulator")
		(attr "<Hyperlink>" "http://www.ti.com/lit/gpn/LM5005")
		(attr "<Component Height>" "1.1")
		(attr "<STEP Filename>" "LM5005MHX_NOPB.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
