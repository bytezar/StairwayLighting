include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use <BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Holders_Vars.scad>

use<StairwayLighting_Holders_Top.scad>
use<StairwayLighting_Holders_Middle.scad>
use<StairwayLighting_Holders_Bottom.scad>

hd=hole_diameter;

th=top_holder;
mh=middle_holder;
bh=bottom_holder;

back(hd/2-th[1])
color("LightGray")
top_holder();

back(hd/2-th[1]-mh[1])
color("DarkGray")
middle_holder();

color("LightGray")
fwd(hd/2-bh[1]-bh[3])
yflip()
bottom_holder();

down(2)
color("Green")
cylinder(d=hd,h=2,$fn=xl_fn);
