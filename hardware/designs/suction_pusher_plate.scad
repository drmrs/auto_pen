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
	union() {
		linear_extrude(15){
			union(){
				polygon( points=[[0,0],[75,75],[75,0]]);
				translate([-32,0,0])
				square([42,10]);
			}
		}

		translate([75,41,7.5])
		rotate([0,90,0])
		cylinder(h=5, r=43, $fn=100);
	}

	translate([3,10,7.5]){
		rotate([90,0,0])
		union() {
			cylinder(h=1.5, d=6, $fn=100);
			cylinder(h=10, d=3, $fn=100);
		}
	}

	translate([-25,10,7.5]){
		rotate([90,0,0])
		union() {
			cylinder(h=1, d=6, $fn=100);
			cylinder(h=10, d=3, $fn=100);
		}
	}
}

