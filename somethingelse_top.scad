
difference() {

    difference() {
     
        
        rotate([0,90,90])
        translate([0,0,-8])
            cube([5,140,50]);
        
        rotate([0,90,90])
        translate([0,2,-5])
            cube([2.5,136,45]);
        
            
    }


    union() {
        translate ([-45,17.5,-50])
        color("blue")
        cylinder ( h = 150, r = 6, $fn = 30);

        translate ([-70,17.5,-50])
        color("blue")
        cylinder ( h = 150, r = 6, $fn = 30);

        translate ([-95,17.5,-50])
        color("blue")
        cylinder ( h = 150, r = 6, $fn = 30);
        
    }


}





translate([0,0,45])
difference () {
   
   
   union () { 
        translate ([-45,17.5,-50])
        color("blue")
        cylinder ( h = 10, r = 6, $fn = 30);

        translate ([-70,17.5,-50])
        color("blue")
        cylinder ( h = 10, r = 6, $fn = 30);

        translate ([-95,17.5,-50])
        color("blue")
        cylinder ( h = 10, r = 6, $fn = 30);        
    }


    union() {
        translate ([-45,17.5,-50])
        color("blue")
        cylinder ( h = 10, r = 5, $fn = 30);

        translate ([-70,17.5,-50])
        color("blue")
        cylinder ( h = 10, r = 5, $fn = 30);

        translate ([-95,17.5,-50])
        color("blue")
        cylinder ( h = 10, r = 5, $fn = 30);
    }
    
    
}