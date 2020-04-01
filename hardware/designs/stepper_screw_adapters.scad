/*
Copyright Dr. Mrs. The Mistress 2020.
This documentation describes Open Hardware and is licensed under the CERN OHL v. 1.2.

You may redistribute and modify this documentation under the terms of the
CERN OHL v.1.2. (http://ohwr.org/cernohl). This documentation is distributed
WITHOUT   ANY   EXPRESS   OR   IMPLIED   WARRANTY,   INCLUDING   OF
MERCHANTABILITY,   SATISFACTORY   QUALITY   AND   FITNESS   FOR   A
PARTICULAR   PURPOSE.   Please   see   the   CERN   OHL   v.1.2  for   applicable
conditions.
*/

// This is an adapter that allows you to use a m3 screw in a larger hole with a nut.
translate([0,0,14])
rotate([180,0,0])
difference() {
    
    union() {
        cylinder(d=6.40,h=10, $fn=100 );
        translate([0,0,10])
        cylinder(d=9,h=3, $fn=100 );
    }
    cylinder(d=3.05,h=14, $fn=50 );
    translate([0,0,14-2.6])
    nut_trap();
}

module nut_trap (w = 5.5, h = 2.6){
    cylinder(r = w / 2 / cos(180 / 6) + 0.05, h=h, $fn=6);
}   