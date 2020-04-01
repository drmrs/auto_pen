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

difference() {
    cylinder(d=25, h=20, $fn=100);

    union() {
        cylinder(d=14, h=20, $fn=100);
        translate([((14/2)-5)+2,-2.5,0])
        cube([5,5,20]);
    }
}