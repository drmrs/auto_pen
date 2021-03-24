PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//634575/450452/2.49/8/4/Connector

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c150_h100"
		(holeDiam 1)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.500) (shapeHeight 1.500))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.500) (shapeHeight 1.500))
	)
	(padStyleDef "c166.5_h333"
		(holeDiam 3.33)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.665) (shapeHeight 1.665))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.665) (shapeHeight 1.665))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "2158771" (originalName "2158771")
		(multiLayer
			(pad (padNum 1) (padStyleRef c150_h100) (pt 0.000, 0.000) (rotation 90))
			(pad (padNum 2) (padStyleRef c150_h100) (pt 2.540, -1.270) (rotation 90))
			(pad (padNum 3) (padStyleRef c150_h100) (pt 0.000, -2.540) (rotation 90))
			(pad (padNum 4) (padStyleRef c150_h100) (pt 2.540, -3.810) (rotation 90))
			(pad (padNum 5) (padStyleRef c150_h100) (pt 0.000, -5.080) (rotation 90))
			(pad (padNum 6) (padStyleRef c150_h100) (pt 2.540, -6.350) (rotation 90))
			(pad (padNum 7) (padStyleRef c150_h100) (pt 0.000, -7.620) (rotation 90))
			(pad (padNum 8) (padStyleRef c150_h100) (pt 2.540, -8.890) (rotation 90))
			(pad (padNum 9) (padStyleRef c166.5_h333) (pt 8.900, -10.160) (rotation 90))
			(pad (padNum 10) (padStyleRef c166.5_h333) (pt 8.900, 1.270) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 7.750, -4.455) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.3 -12.045) (pt 16.8 -12.045) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 16.8 -12.045) (pt 16.8 3.155) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 16.8 3.155) (pt -1.3 3.155) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.3 3.155) (pt -1.3 -12.045) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.3 -12.065) (pt 16.8 -12.065) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 16.8 -12.065) (pt 16.8 3.155) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 16.8 3.155) (pt -1.3 3.155) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.3 3.155) (pt -1.3 -12.065) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.3 -13.065) (pt 17.8 -13.065) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 17.8 -13.065) (pt 17.8 4.155) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 17.8 4.155) (pt -2.3 4.155) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.3 4.155) (pt -2.3 -13.065) (width 0.1))
		)
	)
	(symbolDef "215877-1" (originalName "215877-1")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 800 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 570 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 800 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 570 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 5) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 6) (pt 800 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 570 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 7) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -325 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 8) (pt 800 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 570 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 600 mils 100 mils) (width 6 mils))
		(line (pt 600 mils 100 mils) (pt 600 mils -400 mils) (width 6 mils))
		(line (pt 600 mils -400 mils) (pt 200 mils -400 mils) (width 6 mils))
		(line (pt 200 mils -400 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 650 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 650 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "215877-1" (originalName "215877-1") (compHeader (numPins 8) (numParts 1) (refDesPrefix J)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "3") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "4" (pinName "4") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "5" (pinName "5") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "6" (pinName "6") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "7" (pinName "7") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "8" (pinName "8") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "215877-1"))
		(attachedPattern (patternNum 1) (patternName "2158771")
			(numPads 8)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "5")
				(padNum 6) (compPinRef "6")
				(padNum 7) (compPinRef "7")
				(padNum 8) (compPinRef "8")
			)
		)
		(attr "Manufacturer_Name" "TE Connectivity")
		(attr "Manufacturer_Part_Number" "215877-1")
		(attr "Mouser Part Number" "571-2158771")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/TE-Connectivity/215877-1?qs=m7RwewakXS9hoFpoHd7ZkA%3D%3D")
		(attr "Arrow Part Number" "215877-1")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/215877-1/te-connectivity")
		(attr "Description" "TE Connectivity Cat3 8P8C-Way Female RJ45 Socket Right Angle Through Hole Unshielded")
		(attr "<Hyperlink>" "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=215877&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=215877-1")
		(attr "<Component Height>" "11.5")
		(attr "<STEP Filename>" "215877-1.stp")
		(attr "<STEP Offsets>" "X=16.85;Y=-4.43;Z=5.83")
		(attr "<STEP Rotation>" "X=90;Y=0;Z=90")
	)

)
