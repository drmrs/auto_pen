SamacSys ECAD Model
644295/450452/2.49/10/4/Connector

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c150.88888888889_h97"
		(holeDiam 0.97)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.508888888888889) (shapeHeight 1.508888888888889))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.508888888888889) (shapeHeight 1.508888888888889))
	)
	(padStyleDef "c247.5_h165"
		(holeDiam 1.65)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 2.4749999999999996) (shapeHeight 2.4749999999999996))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 2.4749999999999996) (shapeHeight 2.4749999999999996))
	)
	(padStyleDef "c166.5_h333"
		(holeDiam 3.33)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.665) (shapeHeight 1.665))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.665) (shapeHeight 1.665))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "55551531" (originalName "55551531")
		(multiLayer
			(pad (padNum 1) (padStyleRef c150.88888888889_h97) (pt 4.445, 7.685) (rotation 90))
			(pad (padNum 2) (padStyleRef c150.88888888889_h97) (pt 3.175, 5.145) (rotation 90))
			(pad (padNum 3) (padStyleRef c150.88888888889_h97) (pt 1.905, 7.685) (rotation 90))
			(pad (padNum 4) (padStyleRef c150.88888888889_h97) (pt 0.635, 5.145) (rotation 90))
			(pad (padNum 5) (padStyleRef c150.88888888889_h97) (pt -0.635, 7.685) (rotation 90))
			(pad (padNum 6) (padStyleRef c150.88888888889_h97) (pt -1.905, 5.145) (rotation 90))
			(pad (padNum 7) (padStyleRef c150.88888888889_h97) (pt -3.175, 7.685) (rotation 90))
			(pad (padNum 8) (padStyleRef c150.88888888889_h97) (pt -4.445, 5.145) (rotation 90))
			(pad (padNum 9) (padStyleRef c247.5_h165) (pt -7.875, -4.255) (rotation 90))
			(pad (padNum 10) (padStyleRef c247.5_h165) (pt 7.875, -4.255) (rotation 90))
			(pad (padNum 11) (padStyleRef c166.5_h333) (pt -5.715, -1.205) (rotation 90))
			(pad (padNum 12) (padStyleRef c166.5_h333) (pt 5.715, -1.205) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0.000, 0.000) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -8.13 9.335) (pt 8.13 9.335) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 8.13 9.335) (pt 8.13 -9.335) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 8.13 -9.335) (pt -8.13 -9.335) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt -8.13 -9.335) (pt -8.13 9.335) (width 0.2))
		)
		(layerContents (layerNumRef 30)
			(line (pt -10.113 10.335) (pt 10.113 10.335) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 10.113 10.335) (pt 10.113 -10.335) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 10.113 -10.335) (pt -10.113 -10.335) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -10.113 -10.335) (pt -10.113 10.335) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -8.13 -1.715) (pt -8.13 9.335) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -8.13 9.335) (pt 8.13 9.335) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 8.13 9.335) (pt 8.13 -1.715) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -8.13 -6.795) (pt -8.13 -9.335) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -8.13 -9.335) (pt 8.13 -9.335) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 8.13 -9.335) (pt 8.13 -6.795) (width 0.1))
		)
	)
	(symbolDef "5555153-1" (originalName "5555153-1")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 4) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -325 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 5) (pt 0 mils -400 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -425 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 6) (pt 900 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 7) (pt 900 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 8) (pt 900 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 9) (pt 900 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 10) (pt 900 mils -400 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -425 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 700 mils 100 mils) (width 6 mils))
		(line (pt 700 mils 100 mils) (pt 700 mils -500 mils) (width 6 mils))
		(line (pt 700 mils -500 mils) (pt 200 mils -500 mils) (width 6 mils))
		(line (pt 200 mils -500 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 750 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "5555153-1" (originalName "5555153-1") (compHeader (numPins 10) (numParts 1) (refDesPrefix J)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "3" (pinName "3") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "4" (pinName "4") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "5" (pinName "5") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "6" (pinName "6") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "7" (pinName "7") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "8" (pinName "8") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "9" (pinName "9") (partNum 1) (symPinNum 9) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "10" (pinName "10") (partNum 1) (symPinNum 10) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "5555153-1"))
		(attachedPattern (patternNum 1) (patternName "55551531")
			(numPads 10)
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
			)
		)
		(attr "Manufacturer_Name" "TE Connectivity")
		(attr "Manufacturer_Part_Number" "5555153-1")
		(attr "Mouser Part Number" "571-5555153-1")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/TE-Connectivity-AMP/5555153-1?qs=BcfjnG7NVaXMLRW9dVaLuA%3D%3D")
		(attr "Arrow Part Number" "5555153-1")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/5555153-1/te-connectivity")
		(attr "Description" "ModJack,RightAngle,8Position,Cat3 TE Connectivity Cat3 RJ45 Connector Socket, Right Angle, Through Hole")
		(attr "Datasheet Link" "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=5555153&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=5555153-1")
		(attr "Height" "12 mm")
	)

)
