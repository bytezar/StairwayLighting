include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../../StairwayLighting_Vars_Common.scad>
include<../../StairwayLighting_Vars_Screws.scad>
include<../StairwayLighting_Vars_Holders.scad>

use<../StairwayLighting_Holders_Common.scad>
use<StairwayLighting_Holders_Oblique.scad>

draw_test_circle=false;

module oblique_holder_right()
{
	oblique_holder(-1);
}

oblique_holder_right();

if (draw_test_circle)
{
	test_circle();
}
