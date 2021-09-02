include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Holders_Vars.scad>

sr4=screw_m4;
bh=bottom_holder;

hh=holder_height;
hd=hole_diameter;

module main_shape()
{
	back(bh[3])
	intersection()
	{
		fwd(hd/2-bh[1])
		cylinder(d=hd,h=hh,$fn=xl_fn);
		
		down(1)
		left(bh[0]/2)
		cube([bh[0],bh[1]+2,hh+2]);
	}
}

module nut_holder()
{
	left(bh[2]/2)
	cube([bh[2],bh[3],hh]);
}

module screw_hole()
{
	h=bh[1]+bh[3]+2;
	
	fwd(1)
	up(hh/2)
	ycyl(d=sr4[0],h=h,center=false,$fn=s_fn);
}

module bottom_holder()
{
	difference()
	{
		union()
		{
			main_shape();
			nut_holder();
		}
		
		screw_hole();
	}
}

bottom_holder();
