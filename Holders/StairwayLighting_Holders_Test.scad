include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use <BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Vars_Holders.scad>

use<StairwayLighting_Holders_Top.scad>
use<StairwayLighting_Holders_Middle.scad>
use<StairwayLighting_Holders_Bottom.scad>

d=hr[0];

back(srhk[1])
color("LightGray")
top_holder();

fwd(d/2-bh[1])
color("DarkGray")
middle_holder();

color("LightGray")
fwd(d/2-bh[1])
yflip()
bottom_holder();

down(2)
color("Green")
cylinder(d=d,h=2,$fn=xl_fn);
