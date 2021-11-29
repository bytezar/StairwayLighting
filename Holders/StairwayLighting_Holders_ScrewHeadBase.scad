include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Vars_Holders.scad>

h=hr[1];

module main_shape()
{
	cuboid([shh[4],shh[5],h],align=V_UP+V_BACK);
	cuboid([shh[0],shh[6],h],align=V_UP+V_BACK);
}

module screws_m25_holes()
{
  xflip_copy()
	move([shh[2]/2,-1,h/2])
	ycyl(d=sr25[0],h=shh[6]+2,
		center=false,$fn=s_fn);
}

module screw_m4_hole()
{
	move([0,-1,h/2])
	ycyl(d=sr4[0],h=shh[5]+2,
		center=false,$fn=s_fn);
	
	move([0,-1,h/2])
	ycyl(d=srh4[0],h=srh4[1]+1,
		center=false,$fn=6);
}

module screw_head_base_holder()
{
	difference()
	{
		main_shape();
		
		screws_m25_holes();
		screw_m4_hole();
	}
}

screw_head_base_holder();
