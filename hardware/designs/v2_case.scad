stepper_motor_depth = 102;
inner_wall_thickness = 4;
slide_thickness = 12;
90_degree_slide_pinion = 25;

rm = 0.5;


translate([0,0,20])
lid();

translate([0,0,10])
midplate_with_holes();


case_body();



module motor_support() {
    intersection() {
        solid_body();

        translate([(90+10)/2,(90+10)/2,0])
        translate([-60/2,-60/2,0])
        difference() {
            union() {
                translate([5,-50,0])
                cube([10,200,102]);

                translate([25.5,-50,0])
                cube([10,200,102]);

                translate([46,-50,0])
                cube([10,200,102]);

                translate([-50,5,0])
                cube([200,10,102]);

                translate([-50,25.5,0])
                cube([200,10,102]);

                translate([-50,46,0])
                cube([200,10,102]);
            }
            cube([61,61,102]);
        }
    }
}

module slide_screw_cutouts() {
    translate([52.5,0,0])
    circle(d=5, $fn=rm*20);

    translate([115,0,0])
    circle(d=5, $fn=rm*20);

    translate([275,0,0])
    circle(d=5, $fn=rm*20);
}



module midplate_with_holes() {
    
//    translate([5,85,stepper_motor_depth+4])
//    cube([350,45,5]);

    difference() {
        
    union(){
        mid_plate();
        difference() {
            translate([0,0,2])
            mid_plate();
            lid();
        }
        difference() {
            translate([0,0,-2])
            mid_plate();
            case_body();
            translate([(90+10)/2,(90+10)/2,0])
            translate([-60/2,-60/2,0])
            cube([61,61,102]);
        }
    }
        
    translate([2,130-45/2,stepper_motor_depth-2])
    linear_extrude(inner_wall_thickness+4)
    slide_screw_cutouts();
        
    translate([(90+10)/2,(90+10)/2,0])
    translate([-60/2,-60/2,stepper_motor_depth])
    nema_24_face_cutout();
    }
}

module case_body() {
    difference() {
        hollow_body();
        translate([0,0,stepper_motor_depth])
        cube([400,200,stepper_motor_depth]);
        
    }
    
    motor_support();
}


module mid_plate() {
difference(){
    solid_body();
    cube([400,200,stepper_motor_depth]);
    translate([0,0,stepper_motor_depth+inner_wall_thickness])
    cube([400,200,stepper_motor_depth]);
}
}


module lid()
difference(){
hollow_body();
cube([400,200,stepper_motor_depth+inner_wall_thickness]);
translate([0,88,stepper_motor_depth+inner_wall_thickness+4])
cube([90_degree_slide_pinion+slide_thickness,90_degree_slide_pinion+slide_thickness,90_degree_slide_pinion+slide_thickness]);
}

module hollow_body(){
    
    difference(){
    solid_body();
    
    hull(){
            translate([(90+10)/2,(90+10)/2,5])
                cylinder(d=90,h=inner_stuff_thickness, $fn=rm*100);


            translate([(5+10)/2,130,5])
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([140,130,5])
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
        }

        hull() {
            translate([354,130,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([354,130-45,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([50,130,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([50,130-45,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
        }
    }
    
}



inner_stuff_thickness = stepper_motor_depth+inner_wall_thickness+slide_thickness+90_degree_slide_pinion;

module solid_body() {
    union() {
        hull(){
            translate([(90+10)/2,(90+10)/2,5])
            minkowski(){
                cylinder(d=90,h=inner_stuff_thickness, $fn=rm*100);
                sphere(r=5, $fn=rm*25);
            }


            translate([(5+10)/2,130,5])
            minkowski(){
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                sphere(r=5, $fn=rm*25);
            }

            translate([140,130,5])
            minkowski(){
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                sphere(r=5, $fn=rm*25);
            }
        }

        hull() {
            translate([354,130,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }

            translate([354,130-45,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }

            translate([50,130,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }

            translate([50,130-45,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }
        }
    }
}



module counter_sink() {
    union() {
        translate([0,0,inner_wall_thickness+2])
        rotate([180,0,0])
        rotate_extrude($fn=75)
        translate([-3,0,0])
        polygon([[0,0],[3,0],[3,1.7],[1.5,1.7]]);
        
        cylinder(d=3.5, h=inner_wall_thickness+2, $fn=25);
    }
}



module nema_24_face_cutout() {
    
    translate([3,5,0])
    counter_sink();


    translate([60-5,5,0])
    counter_sink();
    
    translate([5,60-5,0])
    counter_sink();
    
    translate([60-5,60-5,0])
    counter_sink();
    
    translate([60/2,60/2,0])
    cylinder(d=36, h=inner_wall_thickness+2, $fn=50);
    
}