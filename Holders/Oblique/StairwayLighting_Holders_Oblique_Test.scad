include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use <BOSL/shapes.scad>

include<../../StairwayLighting_Vars_Common.scad>
include<../../StairwayLighting_Vars_Screws.scad>
include<../StairwayLighting_Vars_Holders.scad>

use<StairwayLighting_Holders_Oblique.scad>
use<../StairwayLighting_Holders_Common.scad>

color("LightGray")
oblique_holder(1);

test_screw_head_holder(true);

test_circle();
