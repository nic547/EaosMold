moldX = 28;
moldZ = 28;
moldY = 72;
wallThickness = 3;
ribThickness = 3;
ribWidth = 5;

module bounds() {
    cube([moldX+2*wallThickness, moldY + wallThickness, moldZ]);
}

module mold() {
    cube([moldX, moldY, moldZ]);
}

module rib() {
    cube([ribThickness, moldY + wallThickness, ribWidth]);
}


difference() {
    bounds();
    translate([wallThickness,0,0])
    mold();
    translate([0.9,0,0.9])
    cube([1.2,1.2, moldZ - 2 + 0.2]);
}
    translate([wallThickness*2 + moldX -2,-1,1])
    cube([1,1, moldZ - 2]);

    translate([-wallThickness,0,6])
    rib();
    translate([-wallThickness,0,17])
    rib();

    translate([moldX+2*wallThickness,0,6])
    rib();
    translate([moldX+2*wallThickness,0,17])
    rib();

