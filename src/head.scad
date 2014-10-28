// creative commons share alike 3.0 
// copyright longevity software d.b.a. terawatt industries
// author: free beachler

use <functions.scad>;

$fn = 150;

o = 0.01;
height = 30;
has_eyes = 1; // vals: [-1, 0, 1]
eye_radius = 1.75;
eye_separation = height * 4 / 7;
has_antennae = 1; // vals: [-1, 0, 1]
antennae_radius = 1;

head(height, has_eyes, eye_radius, eye_separation, has_antennae, antennae_radius, o);

module head(h, eyes = 1, er, es, ant = 1, ar, o = 0.01) {
	difference() {
	// main nugget
	difference() {
		scale([1.0, 1.0, 0.8]) sphere(r = andWidth(h));
		translate([0, 0, -andWidth(h) / 2 - o]) cube([andWidth(h) * 2, andWidth(h) * 2, andWidth(h) + o], center = true);
		translate([0, 0, -o]) cylinder(r = 4 + 0.25, h = 1.5 * 3);
	}
	// eyes and antennae
	assign(eye_sep_rads = es / andWidth(h) * PI) {
echo("eye sep angle", eye_sep_rads);
		assign(x = -er * 1.75 + andWidth(h) * cos(eye_sep_rads * 2 * PI), y = andWidth(h) * sin(eye_sep_rads * 2 * PI)) {
			for (i = [1, -1]) {
				if (eyes == -1) {
					translate([x + er, y * i, andWidth(h) * sin(19)]) rotate([0, -19 * 1.5, eye_sep_rads * PI * 2 * i]) eye(er, o);
				}
				if (ant == -1) {
					// negative antenna
					translate([0, y * i + ar / 2 * i, andWidth(h) * 0.55]) rotate([-eye_sep_rads * PI * 2 * i - 10 * i, 0, 0]) cylinder(r = ar, h = andWidth(h) / 2);
				}
			}
		}
	}
	}
	// positive eyes and antennae
	assign(eye_sep_rads = es / andWidth(h) * PI) {
echo("eye sep angle", eye_sep_rads);
		assign(x = -er * 0.75 + andWidth(h) * cos(eye_sep_rads * 2 * PI), y = andWidth(h) * sin(eye_sep_rads * 2 * PI)) {
			for (i = [1, -1]) {
				if (eyes == 1) {
					translate([x, y * i, andWidth(h) * sin(19)]) rotate([0, -22 * 1.5, eye_sep_rads * PI * 2 * i]) eye(er, o);
				}
				if (ant == 1) {
					// antenna
					translate([0, y * i + ar / 2 * i, andWidth(h) * 0.55]) rotate([-eye_sep_rads * PI * 2 * i - 10 * i, 0, 0]) cylinder(r = ar, h = andWidth(h) / 2);
				}
			}
		}
	}
}

module eye(er, o) {
	scale([0.5, 1.3, 1.5]) sphere(er);
}

