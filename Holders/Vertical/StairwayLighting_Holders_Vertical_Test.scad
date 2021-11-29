include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use <BOSL/shapes.scad>

include<../../StairwayLighting_Vars_Common.scad>
include<../../StairwayLighting_Vars_Screws.scad>
include<../StairwayLighting_Vars_Holders.scad>

use<StairwayLighting_Holders_Vertical.scad>
use<../StairwayLighting_Holders_Common.scad>

color("LightGray")
vertical_holder();

test_screw_head_holder(false);

test_circle();
