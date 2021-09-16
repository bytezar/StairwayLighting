include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Vars_Holders.scad>

h=hr[1];

module main_shape()
{
	cuboid([mh[0],mh[1],h],align=V_UP+V_BACK);
	cuboid([bh[0],mh[2],h],align=V_UP+V_BACK);
}

module screws_m25_holes()
{
  xflip_copy()
	move([bh[2]/2,-1,h/2])
	ycyl(d=sr25[0],h=mh[2]+2,
		center=false,$fn=s_fn);
}

module screw_m4_hole()
{
	move([0,-1,h/2])
	ycyl(d=sr4[0],h=mh[1]+2,
		center=false,$fn=s_fn);
	
	move([0,-1,h/2])
	ycyl(d=srh4[0],h=srh4[1]+1,
		center=false,$fn=6);
}

module middle_holder()
{
	difference()
	{
		main_shape();
		
		screws_m25_holes();
		screw_m4_hole();
	}
}

middle_holder();
