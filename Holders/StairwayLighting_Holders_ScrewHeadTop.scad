include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Vars_Holders.scad>

d=hr[0];
h=hr[1];

module main_shape()
{
	intersection()
	{
		fwd(d/2-shh[1])
		cylinder(d=d,h=h,$fn=xl_fn);
		
		down(1)
		left(shh[0]/2)
		cube([shh[0],shh[1]+2,h+2]);
	}
}

module screw_head_holes()
{
	xflip_copy()
	right(shh[2]/2)
	up(h/2)
	union()
	{
		fwd(1)
		ycyl(d=sr25[0],h=shh[1]+2,
			center=false,$fn=s_fn);	
		
		back(shh[3])
		ycyl(d1=sr25[0],d2=srh25[0],
			h=srh25[1],center=false,$fn=s_fn);
		
		back(shh[3]+srh25[1]-epsilon)
		ycyl(d=srh25[0],h=shh[1],
			center=false,$fn=s_fn);
	}
}

module screw_head_top_holder()
{
	difference()
	{
		main_shape();
		screw_head_holes();
	}
}

screw_head_top_holder();
