include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Light_Vars.scad>
use<StairwayLighting_Light_Common.scad>

module square_base()
{
	l=square_length;
	th=base_thickness;
	
	s1=[l,l];
	s2=[l-2*th,l-2*th];
	prismoid(size1=s1,size2=s2,h=th);
}

light()
square_base();
