include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Light_Vars.scad>

use<StairwayLighting_Light_Common.scad>

difference()
{
	l=20; 
	h=5;
	
	prismoid(size1=[l,l],size2=[l-h,l-h],h=5);
	
	back(4)
	screw_hole();
}
