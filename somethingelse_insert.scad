// Testing Size


translate([00,20])
rotate([-270,180,0])
{
difference() {
cube( [74,10,13] );
translate ([2.5,5,2.5])    
    cube ( [69,8,8]);    
}

//translate([37,0,6.5])
//rotate([90,90,0])
//    cylinder (r=6,h = 25,$fn=50);

}