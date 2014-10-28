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

android3d(height, has_eyes, eye_radius, eye_separation, has_antennae, antennae_radius, o);

% cube([height, height, height]);

module android3d(h = 35, he = 1, er = 5, es = 5, ant = 1, ar, o = 0.01) {
	translate([0, 0, andBodyHeight(h) + 1.5 - o]) head(h, er, es, ant, ar, o);
	translate([0, 0, andBodyHeight(h)]) rotate([0, 180, 0]) body(h, o);
	translate([0, 0, andBodyHeight(h) + 1.5 / 2 - o]) neck(h, o);
}


