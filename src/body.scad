// creative commons share alike 3.0 
// copyright longevity software d.b.a. terawatt industries
// author: free beachler

use <functions.scad>;

$fn = 150;

o = 0.01;
height = 30;

body(height, o);

module body(h = height, o = 0.01) {
	union() {
		cylinder(r = andWidth(h), h = andBodyHeight(h));
	}
	for (i = [-1, 1]) {
		translate([0, (andWidth(h) - footWidth(h)) * i, andBodyHeight(h) - o]) feet(h, o);
	}
	for (i = [-1, 1]) {
		translate([0, andWidth(h) * i, andBodyHeight(h) * 0.25 - o]) arms(h, o);
	}
}

module feet(h, o) {
	difference() {
	translate([0, 0, -9]) minkowski() {
		cube([andWidth(h) * 1.2 - footWidth(h), 0.01, footHeight(h) - 4], center = true);
			translate([0, 0, 0]) rotate([0, 0, 0]) cylinder(r = footWidth(h) / 2 - 2, h = o);
			translate([0, 0, 10]) rotate([0, 90, 0]) cylinder(r = 1, h = o);
	}
	translate([0, 0, -1]) cube([andWidth(h) * 1.2 + o, footWidth(h) + o * 2, 2], center = true);
	}
}

module arms(h, o) {
	sphere(r = footWidth(h) * 0.67);
	cylinder(r = footWidth(h) * 0.67, h = andBodyHeight(h) * 0.67 - (footWidth(h) * 0.67));
	translate([0, 0, andBodyHeight(h) * 0.67 - (footWidth(h) * 0.67)]) sphere(r = footWidth(h) * 0.67);
}