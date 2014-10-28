// creative commons share alike 3.0 
// copyright longevity software d.b.a. terawatt industries
// author: free beachler

use <functions.scad>;

$fn = 150;

o = 0.01;
height = 30;

neck(height, o);

module neck(h = height, o = 0.01) {
	union() {
		cylinder(r = andWidth(h) - 1.5, h = 1.5, center=true);
		translate([0, 0, 1.5 - o]) cylinder(r = 3.5, h = 1.5 + 2 * o, center=true);
	}
}