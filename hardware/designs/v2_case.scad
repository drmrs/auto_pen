stepper_motor_depth = 102;
inner_wall_thickness = 4;
slide_thickness = 12;
90_degree_slide_pinion = 25;

upper_length = 360;


buffer = 8;

inner_stuff_thickness = stepper_motor_depth+inner_wall_thickness+slide_thickness+90_degree_slide_pinion+buffer;
echo (inner_stuff_thickness);

rm = .5;


translate([0,0,25])
lid_with_mounting_screws();

translate([0,0,15])
midplate_with_holes();


case_body_with_brass_inserts();




module row_of_hex(rot,num) {
    for(i=[1:11:11*num]) {
        translate([i,0,0])
        rotate([0,0,rot])
        cylinder($fn = 6, r=5, h =5);
    }
}



module bolt_threw_guide(solid=false) {
    
    if (solid==true){
        cylinder(d=7, h=90_degree_slide_pinion+slide_thickness+5+3, $fn=50*rm);
    } else {
        cylinder(d=3.5, h=5, $fn=25*rm);
        translate([0,0,4])
        cylinder(d=5.6, h=90_degree_slide_pinion+slide_thickness+5+3-4, $fn=50*rm);
    }   
}


module power_supply_mounts() {
    translate([24,32,0])
    rotate([0,180,0])
    counter_sink();

    translate([102,32,0])
    rotate([0,180,0])
    counter_sink();

    translate([22,0,15])
    rotate([90,0,0])
    counter_sink();

    translate([139,0,6])
    rotate([90,0,0])
    counter_sink();
    
    translate([139,0,24])
    rotate([90,0,0])
    counter_sink();
    
}

// Assumes 10mm countersunk screws
module power_supply_standoffs() {
    translate([24-8/2,0,0])
    difference() {
        cube([8,stepper_motor_depth+buffer,1.8]);
        translate([8/2,32+6,1.8])
        rotate([0,180,0])
        cylinder(d=3.5,h=1.8, $fn=rm*50);
        
    }
    
    translate([102-8/2,0,0])
    difference() {
        cube([8,stepper_motor_depth+buffer,1.8]);
        translate([8/2,32+6,1.8])
        rotate([0,180,0])
        cylinder(d=3.5,h=1.8, $fn=rm*50);
        
    }
    
    translate([150-8,0,0])
    cube([8,stepper_motor_depth+buffer,1.8]);
}



module mains_inlet() {
    rotate([0,90,0])
    cylinder(d=5,h=5, $fn=rm*100);
    translate([0,56,0])
    rotate([0,90,0])
    cylinder(d=5,h=5, $fn=rm*100);

    translate([0,(56-47.7)/2,-27/2])
    cube([5,47.7,27]);
}


module motor_support() {
    intersection() {
        solid_body();

        translate([(90+10)/2,(90+10)/2,0])
        translate([-60/2,-60/2,0])
        difference() {
            union() {
                translate([5,-50,0])
                cube([15,200,stepper_motor_depth+buffer]);

                translate([41,-50,0])
                cube([15,200,stepper_motor_depth+buffer]);

                translate([-50,5,0])
                cube([200,10,stepper_motor_depth+buffer]);

                translate([-50,25.5,0])
                cube([200,10,stepper_motor_depth+buffer]);

                translate([-50,46,0])
                cube([200,10,stepper_motor_depth+buffer]);
            }
            cube([61,61,stepper_motor_depth+buffer]);
            
            translate([0,61+15,0])
            cube([61,61,stepper_motor_depth+buffer-15]);
            
            translate([0,-61-10,0])
            cube([61,61,stepper_motor_depth+buffer-10]);
            
            translate([61+10,0,0])
            cube([61,61,stepper_motor_depth+buffer-10]);
            
            translate([-61-10,0,0])
            cube([61,61,stepper_motor_depth+buffer-10]);
            
        }
        
    }
    translate([25,96,stepper_motor_depth+buffer-15])
    rotate([0,90,0])
    linear_extrude(15)
    polygon(points=[[0,0],[20,0],[0,20]]);
    

    
    translate([61,96,stepper_motor_depth+buffer-15])
    rotate([0,90,0])
    linear_extrude(15)
    polygon(points=[[0,0],[20,0],[0,20]]);
}

module slide_screw_cutouts() {
    translate([52.5,45/2,0])
    circle(d=5, $fn=rm*20);

    translate([115,45/2,0])
    circle(d=5, $fn=rm*20);

    translate([275,45/2,0])
    circle(d=5, $fn=rm*20);
}



module midplate_with_holes() {
    
    // Simulated Slide
//    translate([8,86,116])
//    cube([350,45,12]);
//    translate([-50,91,116])
//    cube([350,35,12]);

    difference() {
        
    union(){
        mid_plate();
        difference() {
            translate([0,0,2])
            mid_plate();
            lid_pre_mounting_screws();
        }
        difference() {
            translate([0,0,-2])
            mid_plate();
            case_body();
            translate([(90+10)/2,(90+10)/2,0])
            translate([-60/2,-60/2,0])
            cube([61,61,stepper_motor_depth+buffer]);
        }
    }
        
    translate([8,86,stepper_motor_depth+buffer-2])
    linear_extrude(inner_wall_thickness+4)
    slide_screw_cutouts();
        
    translate([(90+10)/2,(90+10)/2,0])
    translate([-60/2,-60/2,stepper_motor_depth+buffer])
    nema_24_face_cutout();
    
    
    
    
        // Lower Right Brass Fitting
        translate([upper_length+4.5/2,83,stepper_motor_depth+buffer])
        cylinder(d=3.5, h=6, $fn=rm*25);
        
        // Upper Right Brass Fitting
        translate([upper_length+4.5/2,137,stepper_motor_depth+buffer])
        cylinder(d=3.5, h=6, $fn=rm*25);
        
        
        // Moter Mount Fittings
        translate([30+2.5,133.5+4.5/2,stepper_motor_depth+buffer])
        cylinder(d=3.5, h=6, $fn=rm*25);
        
        translate([7.5,50.5,stepper_motor_depth+buffer])
        cylinder(d=3.5, h=6, $fn=rm*25);
        
        translate([50,7.5,stepper_motor_depth+buffer])
        cylinder(d=3.5, h=6, $fn=rm*25);
        
        translate([108,71,stepper_motor_depth+buffer])
        cylinder(d=3.5, h=6, $fn=rm*25);
    }
}

module corner_mount() {
    cube([4.5,4.5,6]);
    translate([0,4.5,0])
    rotate([90,0,0])
    linear_extrude(4.5)
    polygon([[0,0],[4.5,0],[4.5,-4.5]]);
}

module case_body_with_brass_inserts() {
    difference() {
        case_body();
        
        // Lower Right Brass Fitting
        translate([upper_length+4.5/2,83,stepper_motor_depth+buffer-6])
        cylinder(d=5, h=6, $fn=rm*250);
        
        // Upper Right Brass Fitting
        translate([upper_length+4.5/2,137,stepper_motor_depth+buffer-6])
        cylinder(d=5, h=6, $fn=rm*250);
        
        
        // Moter Mount Fittings
        translate([30+2.5,133.5+4.5/2,stepper_motor_depth+buffer-6])
        cylinder(d=5, h=6, $fn=rm*250);
        
        translate([7.5,50.5,stepper_motor_depth+buffer-6])
        cylinder(d=5, h=6, $fn=rm*250);
        
        translate([50.5,7.5,stepper_motor_depth+buffer-6])
        cylinder(d=5, h=6, $fn=rm*250);
        
        translate([108,71,stepper_motor_depth+buffer-6])
        cylinder(d=5, h=6, $fn=rm*250);
    }
}

module case_body() {

    difference() {
        
        union() {
            hollow_body();
            
            // Lower Right Mount
            translate([upper_length-2,82.5,stepper_motor_depth+buffer-6])
            corner_mount();
            
            // Upper Right Mount
            translate([upper_length-2,133,stepper_motor_depth+buffer-6])
            corner_mount();
        }
        translate([0,0,stepper_motor_depth+buffer])
        cube([400,200,stepper_motor_depth+buffer]);
        
        // Mains Inlet
        translate([upper_length+2.5,90+66-66/2-27/2,-5/2+buffer/2+stepper_motor_depth/4])
        rotate([90,0,0])
        mains_inlet();
        
        
        // Power Mount
        translate([300,83.5,6])
        rotate([-90,0,0])
        rotate([0,0,180])
        power_supply_mounts();
        
        
        // Hex Grid
        translate([14,102,0]) {
            row_of_hex(30,12);
            translate([-5,10,0])
            row_of_hex(30,13);
            translate([0,20,0])
            row_of_hex(30,13);
            translate([-5,30,0])
            row_of_hex(30,32);
            
            translate([-10,0,0])
            intersection() {
                translate([1.675,-5,0])
                cube([5,15,5]);
                rotate([0,0,30])
                cylinder($fn = 6, r=5, h =5);
            }
            translate([-10,20,0])
            intersection() {
                translate([1.675,-5,0])
                cube([5,15,5]);
                rotate([0,0,30])
                cylinder($fn = 6, r=5, h =5);
            }
        }
    }
    
    // Power supply standoffs
    translate([300,82.5,0])
    rotate([-90,0,0])
    rotate([0,0,180])
    power_supply_standoffs();
    
    
    // Motor Support Structure
    motor_support();
}


module mid_plate() {
    difference(){
        solid_body();
        cube([400,200,stepper_motor_depth+buffer]);
        translate([0,0,stepper_motor_depth+inner_wall_thickness+buffer])
        cube([400,200,stepper_motor_depth+buffer]);
    }
}

module lid_with_mounting_screws() {

    difference() {
        lid_pre_mounting_screws();
        translate([upper_length+4.5/2,83,stepper_motor_depth+buffer+4])
        bolt_threw_guide();
        
        
        translate([upper_length+4.5/2,137,stepper_motor_depth+buffer+4])
        bolt_threw_guide();
        
        // Moter Mount Fittings
        translate([30+2.5,133.5+4.5/2,stepper_motor_depth+buffer+4])
        bolt_threw_guide();    
        translate([7.5,50.5,stepper_motor_depth+buffer+4])
        bolt_threw_guide();    
        translate([50,7.5,stepper_motor_depth+buffer+4])
        bolt_threw_guide();    
        translate([108,71,stepper_motor_depth+buffer+4])
        bolt_threw_guide();
        
    }

    
}


module lid_pre_mounting_screws() {
    difference(){
        hollow_body();
        cube([400,200,stepper_motor_depth+inner_wall_thickness+buffer]);
        translate([0,88,stepper_motor_depth+inner_wall_thickness+buffer-1])
        cube([90_degree_slide_pinion+slide_thickness,4+90_degree_slide_pinion+slide_thickness,90_degree_slide_pinion+slide_thickness+3]);
        
        
        // Lower right cutout
        translate([upper_length+4.5/2,83,stepper_motor_depth+buffer+4])
        cylinder(d=5.5, h=90_degree_slide_pinion+slide_thickness+4+6, $fn=rm*50);
        
        // Upper right cutout
        translate([upper_length+4.5/2,137,stepper_motor_depth+buffer+4])
        cylinder(d=5.5, h=90_degree_slide_pinion+slide_thickness+4+6, $fn=rm*50);
        
        // Moter Mount Fittings
        translate([30+2.5,133.5+4.5/2,stepper_motor_depth+buffer+4+6])
        cylinder(d=5.5, h=90_degree_slide_pinion+slide_thickness+4+6, $fn=rm*50);    
        translate([7.5,50.5,stepper_motor_depth+buffer+4+6])
        cylinder(d=5.5, h=90_degree_slide_pinion+slide_thickness+4+6, $fn=rm*50);    
        translate([50,7.5,stepper_motor_depth+buffer+4+6])
        cylinder(d=5.5, h=90_degree_slide_pinion+slide_thickness+4+6, $fn=rm*50);   
        translate([108,71,stepper_motor_depth+buffer+4+6])
        cylinder(d=5.5, h=90_degree_slide_pinion+slide_thickness+4+6, $fn=rm*50);
        
        
    }
    
    // Lower right bolt
    translate([upper_length+4.5/2,83,stepper_motor_depth+buffer+4])
    bolt_threw_guide(solid=true);
    
    // Upper right bolt
    translate([upper_length+4.5/2,137,stepper_motor_depth+buffer+4])
    bolt_threw_guide(solid=true);
    
    // Moter Mount Fittings
    translate([30+2.5,133.5+4.5/2,stepper_motor_depth+buffer+4])
    bolt_threw_guide(solid=true);    
    translate([7.5,50.5,stepper_motor_depth+buffer+4])
    bolt_threw_guide(solid=true);    
    translate([50,7.5,stepper_motor_depth+buffer+4])
    bolt_threw_guide(solid=true);    
    translate([108,71,stepper_motor_depth+buffer+4])
    bolt_threw_guide(solid=true);
}

module hollow_body(){
    
    difference(){
    solid_body();
    
    hull(){
            translate([(90+10)/2,(90+10)/2,5])
                cylinder(d=90,h=inner_stuff_thickness, $fn=rm*100);


            translate([(5+10)/2,135,5])
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([140,135,5])
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
        }

        hull() {
            translate([upper_length,135,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([upper_length,135-50,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([50,135,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);

            translate([50,135-50,5])
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
        }
    }
    
}





module solid_body() {
    union() {
        hull(){
            translate([(90+10)/2,(90+10)/2,5])
            minkowski(){
                cylinder(d=90,h=inner_stuff_thickness, $fn=rm*250);
                sphere(r=5, $fn=rm*25);
            }


            translate([(5+10)/2,135,5])
            minkowski(){
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*50);
                sphere(r=5, $fn=rm*25);
            }

            translate([140,135,5])
            minkowski(){
                cylinder(d=5,h=inner_stuff_thickness, $fn=rm*50);
                sphere(r=5, $fn=rm*25);
            }
        }

        hull() {
            translate([upper_length,135,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }

            translate([upper_length,135-50,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }

            translate([50,135,5])
                minkowski(){
                    cylinder(d=5,h=inner_stuff_thickness, $fn=rm*100);
                    sphere(r=5, $fn=rm*25);
            }

            translate([50,135-50,5])
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
        rotate_extrude($fn=70*rm)
        translate([-3,0.15,0])
        polygon([[-0.151,-0.151],[3,-0.151],[3,1.7],[1.5,1.7]]);
        
        cylinder(d=3.5, h=inner_wall_thickness+2, $fn=50*rm);
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
    cylinder(d=36, h=inner_wall_thickness+2, $fn=100);
    
}