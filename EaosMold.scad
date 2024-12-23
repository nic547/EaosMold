/* Based on measurements of a SBB Fas - Märklin 46890 - approx 144.5x30x21.5*/

Width = 30;
Height = 21.5;
Length = 144.5;

/* [Hidden] */

tolerance = 0.2;

moldX = Width - tolerance;
moldY = (Length - tolerance)/2;
moldZ = Height; // No tolerance for the height

wallThickness = 3;
ribThickness = 2;
ribWidth = 4;

module bounds() {
    cube([moldX+2*wallThickness, moldY + wallThickness, moldZ]);
}

module mold() {
    cube([moldX, moldY, moldZ]);
}

module rib() {
    cube([ribThickness, moldY + wallThickness, ribWidth]);
}

module endRib() {
    cube([moldX+2*wallThickness+2* ribThickness, ribThickness, ribWidth]);
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

    ribSpacing = (moldZ - 2*ribWidth)/3;

    translate([-ribThickness,0,ribSpacing])
    rib();
    translate([-ribThickness,0,ribSpacing*2+ribWidth])
    rib();

    translate([moldX+2*wallThickness,0,ribSpacing])
    rib();
    translate([moldX+2*wallThickness,0,ribSpacing*2+ribWidth])
    rib();

    translate([-ribThickness,moldY + wallThickness,ribSpacing])
    # endRib();

    translate([-ribThickness,moldY + wallThickness,ribSpacing*2+ribWidth])
    endRib();

