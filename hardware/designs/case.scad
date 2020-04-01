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

LMAX = 112;
electronics_box_width = 280;
electronics_box_depth = 112;
electronics_box_height = 112;
electronics_box_wall_thickness = 5;

power_mount_screw_d = 3.5;
controler_mount_screw_d = 3.5;

power_box_depth = 42.75;
controler_box_depth = 52.55;

// The lid. You will need to use a slicer to add a pattern.
translate([0,-20,0])
lid();

// The main box
box();

// If printing split you may want these
//translate([0,0,-10])
//feet();

// Addons.
translate([0,0,-10])
mounts();


// Feet to glue to the bottom. Stops screws from scratching.
module feet() {
    cube([10,electronics_box_depth+electronics_box_wall_thickness,5]);
    translate([electronics_box_width,0,0])
    cube([10,electronics_box_depth+electronics_box_wall_thickness,5]);
    translate([electronics_box_width/2,0,0])
    cube([20,electronics_box_depth+electronics_box_wall_thickness,5]);
}


module mounts() {
    translate([electronics_box_width/3,0,0])
    mount();
    
    translate([electronics_box_width/1.5,0,0])
    mount();
}

module mount() {
    difference(){
        union(){
            cube([15,electronics_box_depth+electronics_box_wall_thickness,5]);
            translate([0,electronics_box_depth+electronics_box_wall_thickness,0])
            cube([15,45,5+2.4]);
        }
        translate([15/2,electronics_box_depth+electronics_box_wall_thickness+20+4.6/2,0])
        union(){
            nut_trap();
            cylinder(d=3.1, h=5+2.4, $fn=50);
        }
    }
}

// This is a lid. We use a slicer to add a nice hex pattern
module lid(){
    difference(){
        cube([electronics_box_width+electronics_box_wall_thickness*2,5,electronics_box_height+electronics_box_wall_thickness*2]);
        translate([110,0,electronics_box_height+electronics_box_wall_thickness*2-15])
        rotate([-90,0,0])
        cylinder(d=7.02, h=electronics_box_wall_thickness, $fn=50);
    }
}

// The Box Itself
module box() {
    difference() {
        cube([electronics_box_width+electronics_box_wall_thickness*2,electronics_box_depth+electronics_box_wall_thickness,electronics_box_height+electronics_box_wall_thickness*2]);
        translate([electronics_box_wall_thickness,0,electronics_box_wall_thickness])
        cube([electronics_box_width,electronics_box_depth,electronics_box_height]);
        
        //Stepper 
        translate([electronics_box_wall_thickness,electronics_box_depth+electronics_box_wall_thickness,electronics_box_wall_thickness])
        rotate([90,0,0])
        stepper_moter_mounts();
        
        // Power Mounts
        translate([110,electronics_box_depth-power_box_depth,0])
        power_mounts();
        
        // Controler Mounts
        translate([110,electronics_box_depth-power_box_depth-10-controler_box_depth,0])
        controler_mounts();
    }
}


module stepper_moter_mounts() {
    union(){
        translate([43,43])
        cylinder(d=74, h=electronics_box_wall_thickness, $fn=32);
        translate([8.2,8.2]) {
            cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=16);
            counter_sink();
        }
        translate([86-8.2,8.2]) {
            cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=16);
            counter_sink();
        }
        translate([86-8.2,86-8.2]) {
            cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=16);
            counter_sink();
        }
        translate([8.2,86-8.2]){
            cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=16);
            counter_sink();
        }
    }
}

module power_mounts() {
    translate([4.8+power_mount_screw_d/2,12.10+power_mount_screw_d/2,0]){
        union() {
            cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=32);
            counter_sink();
        }
    }
    translate([154,10,0]) {
        union() {
            cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=32);
            counter_sink();
        }
    }
    
}

module controler_mounts() {
    translate([7.75-5.5/2,12.5+5.5/2,0]) {
        cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=16);
        counter_sink();
    }
    translate([149.1-7.75+5.5/2,12.5+5.5/2,0]) {
        cylinder(d=power_mount_screw_d, h=electronics_box_wall_thickness, $fn=16);
        counter_sink();
    }
}

module counter_sink() {
    rotate_extrude($fn=75)
    translate([-3,0,0])
    polygon([[0,0],[3,0],[3,1.7],[1.5,1.7]]);
}

module nut_trap (w = 5.5, h = 2.45){
    cylinder(r = w / 2 / cos(180 / 6) + 0.05, h=h, $fn=6);
}    
