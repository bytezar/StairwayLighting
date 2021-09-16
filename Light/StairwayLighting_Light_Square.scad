include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>

include<StairwayLighting_Vars_Light.scad>
use<StairwayLighting_Light_Common.scad>

module square_base()
{
	th=lt[0];
	l=lt[1];
	
	s1=[l,l];
	s2=[l-2*th,l-2*th];
	prismoid(size1=s1,size2=s2,h=th);
}

light()
square_base();
