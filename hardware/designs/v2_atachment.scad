
difference() {
    translate([0,0,0])
    cube([28,14,14]);
    
    
    translate([8,7,0]){
    cylinder(d=3.5, h=14, $fn=50);

    }
    
    translate([20,7,0]) {
        cylinder(d=3.5, h=14, $fn=50);
    }
}

translate([28,-4,-4])
cube([22,22,22]);