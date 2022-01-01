include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../../StairLight_Vars_Common.scad>
include<../../StairLight_Vars_Screws.scad>
include<../StairLight_Vars_Holders.scad>

use<../StairLight_Holders_Common.scad>
use<StairLight_Holders_Oblique.scad>

draw_test_circle=false;

module oblique_holder_left()
{
	oblique_holder(1);
}

oblique_holder_left();

if (draw_test_circle)
{
	test_circle();
}
