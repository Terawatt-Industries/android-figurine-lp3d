// creative commons share alike 3.0 
// copyright longevity software d.b.a. terawatt industries
// author: free beachler

use <functions.scad>;
use <head.scad>;
use <body.scad>;
use <neck.scad>;

$fn = 150;

o = 0.01;
height = 30;
has_eyes = 1; // vals: [-1, 0, 1]
eye_radius = 1.75;
eye_separation = height * 4 / 7;
has_antennae = 1; // vals: [-1, 0, 1]
antennae_radius = 1;

android3dPlate(height, has_eyes, eye_radius, eye_separation, has_antennae, antennae_radius, o);

% translate([-100, -100, -5]) cube([200, 200, 5]);

module android3dPlate(h = 35, he = 1, er = 5, es = 5, ant = 1, ar, o = 0.01) {
	translate([0, 0, 0]) head(h, he, er, es, ant, ar, o);
	translate([andWidth(h) * 2 + 2, 0, 0]) rotate([0, 0, 0]) body(h, o);
	translate([0, andWidth(h) * 2 + 2, 1.5 / 2]) neck(h, o);
}


