# Open Source Automatic Penetrator

## Building

Note in these images you may see some badly printed parts. You should aim to do better. These parts where the results of me wanting to finish and publish this documentation.

### Tools
1. Metric allen wrench set
2. 3D printer (300mmx300mm) is ideal but a smaller one works too.

### Materials

I will provide links to where I bought mine but you do not have to buy the same item or from the same source. My goals where to do this as economically as possible. Your goals may be different or the purchasing environment may have changed.  

The total cost of this build assuming you own all of the tools is: $201.98. This leaves you with many bolts, screws and parts that you can use for future projects.

If you already have some of these parts the price will be even lower.

#### Nuts & Bolts
1. x4 20mm (or longer) countersunk m3 screws [AliExpress $2.55](https://www.aliexpress.com/item/33007545714.html)
2. x16 m3 nuts [AliExpress $1.89](https://www.aliexpress.com/item/33031240097.html)
3. x4 10mm countersunk m3 screws [AliExpress $1.64](https://www.aliexpress.com/item/33007545714.html)
4. x2 12mm m3 screws [AliExpress $1.74](https://www.aliexpress.com/item/33007545714.html)

#### Electronics
1. NEMA34 Stepper Motor [Stepper Motor / Controller Kit AliExpress $84.19](https://www.aliexpress.com/item/33025486138.html)
2. Stepper Motor Controller [Part of Kit $0](#)
3. 24v 5A DC Power Supply [AliExpress $11.34](https://www.aliexpress.com/item/32905696401.html)
4. 24v USB charger [AliExpress $3.00](https://www.aliexpress.com/item/33031240097.html)
5. MicroUSB/USB C Cable (matching your raspberry pi) [Spare $0](#)
6. Raspberry Pi [Spare $40](https://www.raspberrypi.org/products/)
7. Barrel Jacks [Amazon $9.89](https://www.amazon.com/43x2pcs-Connectors-Security-Lighting-MILAPEAK)
8 18AWG Wire [AliExpress $4.88](https://www.aliexpress.com/item/32903241720.html)

#### Misc.
1. A roll of pla filament [Amazon $16](https://www.amazon.com/s?k=pla+1.75mm+filament)
2. Super Glue [Amazon $3.97](https://www.amazon.com/Loctite-Ultra-Control-4-Gram-1363589)
3. 14" Drawer Slide [Amazon $13.99](https://www.amazon.com/AmazonBasics-Bearing-Drawer-Slides-Plated-Steel/dp/B01MZC15UG)
4. Female Breadboard Jumper Wires [Amazon $6.90](https://www.amazon.com/gp/product/B01EV70C78)

### Step 1: Print Parts

#### 1.1. Main body

All items here printed at 0.3mm layer heights with 10% gyroid infill.

Load the `auto_pen/hardware/bin/main_body.amf` file into your slicer. Break it into its sub-components and lay them out as shown in the image below. If you need to print the items in separate prints this will be fine. If you need to split the items this is also fine. [I recommend you split the main case like this.](TODO)

![Main Case Layed Out](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/main_case_1.png)

If you want a pattern / ventilation (highly recommended) on the main case add a modifier block to the lid section (shown in green here) and set the infill to hex or some other cool pattern and set the top and bottom perimeters to 0. It should look like the below.

![Main Case Layed Out Sliced](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/main_case_2.png)

The two thin objects on thr right hand side of the image need extra strength and should be printed with 6 perimeters and 6 top and bottom layers.

#### 1.2 Rack & Pinion

All items here printed at 0.2mm layer heights with 10% gyroid infill with 4 perimeters and 5 top and bottom layers.

Load and print the rack and pinion from this file `auto_pen/hardware/bin/rack_and_pinion.amf`

It should look like this.

![Rack & Pinion](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/rack_and_pinion.png)

#### 1.3 Stepper Screw Adapters.

All items here printed at 0.2mm layer heights with 10% gyroid infill.

Load and print 4 copies of the screw adapter `auto_pen/hardware/bin/stepper_screw_adapters.amf`

The nut should be facing down and "from build plate only" supports should be enabled.

It should look like this.

![Stepper Screw Adapters](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/screw_adapters.png)

Remove the supports and continue.

#### 1.4 Pusher Plate

There are two types of pusher plates, one uses rope to attach your "tool" to the plate, the other is designed for suction-cup tools. Choose the one you prefer.

All items here printed at 0.3mm layer heights with 15% gyroid infill and 8 perimeters.

Load and print the pusher plate you prefer `auto_pen/hardware/bin/rope_pusher_plate.amf` or `auto_pen/hardware/bin/suction_pusher_plate.amf`

The plate should be facing down.

It should look like this.

![Stepper Screw Adapters](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/rope_pusher_plate.png)

#### 1.5 Hinges

All items here printed at 0.2mm layer heights with 15% gyroid infill.

Load and print 2 copies of the hinge `auto_pen/hardware/bin/hinge.amf`

It should look like this.

![Stepper Screw Adapters](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/hinges.png)

You are Done Printing!

### Step 2: Electronics Assembly

Depending on exactly what you have your wiring may be dine is a slightly different way. If you purchased the exact same items as I did things should be very similar.

A few notes:
1. AC mains power is very dangerous. BE CAREFUL.
2. The Barrel Jack connected to 1 and 2 is connected to mains power. You need to decide the safest way to do this I used a GFIO plug but you may have a safer better way.
3. The Raspberry Pi is plugged into the stepper motor via female breadboard jumper wires with one side stripped off.
4. Different model Raspbery Pis have different GPIO / Ground pin layouts. [Refer to the appropriate documentation](https://www.raspberrypi.org/documentation/usage/gpio/) Make sure the GPIO PIN numbers match what is in the diagram.
5. The USB cable from the Pi should be plugged into the USB 24v adapter.
6. Non Raspberry Pi GPIO wiring is gone with the 18AWG wires.
7. I had to use a hammer to smash the clamps of the 24v USB adapter closed on the 18AWG wire.
8. Make sure your 24v 5A DC Power Supply is set to the correct mains voltage for your region (120v vs 240v)
9. For the default profile you will want to switch your motor controller to 1600steps/revolution. For me this was switch 6 only. Consult your stepper motor's documentation.

[For Full Size click here](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/wires.png)

![Wire Diagram](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/wires.png)

### Step 3: Electronics Testing

Assuming all your connections are sound connect mains power to the 24v 5A DC Power Supply. You may hear some sounds and some LEDs may turn on. If you can not turn the spindle of the stepper motor this is good news!

Precede to the `auto_pen/software/README.md` file to set up your Raspberry Pi.Once you can control your stepper motor precede to the next step.

### Step 4: Final Assembly

#### 4.1 Stepper motor

Press m3 nuts into the stepper motor adapter and press the who adapter into the stepper motor such that the the face is flush.

Note: Your nut should press substantially further in then in these images.

![Adaptor Nut](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/adapter_nut.jpg)

![Stepper Back](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/stepper_back.jpg)

![Stepper Front](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/stepper_front.jpg)

Place the case such that stepper motor face is out and the holes on the second face are down.

Slide the stepper motor into the case with the wire facing up.

Using 4 20mm or longer countersunk screws secure the stepper motor in place. These should be tight.

![Stepper Face](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/stepper_face.jpg)

#### 4.2 Power Supply

The Mains -> 24vDC Power supply goes in the back with the connectors facing the stepper and the screw holes facing down.

Push 10mm countersunk screws through the bottom and line them up with with the screw holes.

With one finger press a nut down onto the screw and use an allen wrench to tighten from the outside.

![Power Left](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/power_left.jpg)
![Power Right](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/power_right.jpg)

Now is a good time to run the USB cable. RUn it from the USB adapter to the right hand side of the box above the power supply.

#### 4.3 Stepper Motor Controller

Mount the controller in the same way you mounted the power supply positioning the raspberry pi to the right and the USB power adapter above the stepper motor to the left.

![Controller Left](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/controller_and_usb_adapter.jpg)
![Controller Right](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/controller_and_pi.jpg)

The pi might be a tight angle but it should fit. I recommend positioning the PI so the SD card is readily available.

When you are done it should look like this:

![Done Inside](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/inside_complete.jpg)

Keep the mains power supply above the stepper motor for now.

You may want to retest things before you continue.

#### 4.4 Drawer Slide and Pusher.

Attach the slide to the "feet" via 2 10mm m3 screws. Tighten and ensure they are perpendicular to the slide.

Apply a generous amount of super glue to the top of the feet and place the main case on it such that:

1. The side of the rail is flush against the case.
2. The back of the rail is flush with the back of the case (raspberry pi side)
3. The extending bar is near the stepper motor.

![Slide](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/slide.jpg)

Let dry for 1 hour.

Using 2 12mm m3 screws and nuts lock the rope based pusher into place.

![Pusher](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/pusher.jpg)

#### 4.5 Rack & Pinion

 Press the gear onto the stepper motor.
 
 With the slider in the locked position position the rack that the gear is not engaged with it. This should be by a few mm. See the photo below. We give it this extra space so in case something goes wrong the rack isn't slammed into the lock.
 
 Glue it in position.
 
 
 ![Gear](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/gear.jpg)
 ![Rack](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/rack.jpg)
 
 #### Cover, Hinges and Power
 
 After printing the hinges may be VERY stiff. move them til they loosen up.
 
 With the hinges in the 90 degree position glue them flush against the upper two corners. THe side with the hole is the top. The hole should be on the left-ish side. (See photo below.)
 
 Allow to dry for 30 min.
 
 With the hinges in the 90 angle glue them against the case such that the lid is flush against the case. Be sure not to glue the hinge to the top of the lid.
 
  Allow to dry for 30 min.
 
 ![Left Hinge](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/left_hinge.jpg)
 ![Right Hinge](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/right_hinge.jpg)
 
 The mains power inlet should friction fit into the hole. Glue it in.
 
 ![Power](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/power.jpg)
 
 Close and you are done!
 
  ![Done](https://raw.githubusercontent.com/drmrs/auto_pen/master/hardware/images/complete.jpg)
 
 If the lid is a bit loose you could use some tape or a small drop of super glue to hold it in place.
 
 Enjoy.
