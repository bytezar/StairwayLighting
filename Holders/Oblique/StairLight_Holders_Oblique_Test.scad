include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use <BOSL/shapes.scad>

include<../../StairLight_Vars_Common.scad>
include<../../StairLight_Vars_Screws.scad>
include<../StairLight_Vars_Holders.scad>

use<StairLight_Holders_Oblique.scad>
use<../StairLight_Holders_Common.scad>

color("LightGray")
oblique_holder(1);

test_screw_head_holder(true);

test_circle();
