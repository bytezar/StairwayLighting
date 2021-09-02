include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Holders_Vars.scad>

sr25=screw_m25;
srh25=screw_m25_cone_head;

th=top_holder;

hh=holder_height;
hd=hole_diameter;

module main_shape()
{
	intersection()
	{
		back(th[1])
		fwd(hd/2)
		cylinder(d=hd,h=hh,$fn=xl_fn);
		
		down(1)
		left(th[0]/2)
		cube([th[0],th[1]+2,hh+2]);
	}
}

module screw_head_holes()
{
	xflip_copy()
	right(th[2]/2)
	up(hh/2)
	union()
	{
		fwd(1)
		ycyl(d=sr25[0],h=th[1]+2,
			center=false,$fn=s_fn);	
		
		back(th[3]+epsilon)
		ycyl(d1=sr25[0],d2=srh25[0],
			h=srh25[1],center=false,$fn=s_fn);
		
		back(th[3]+srh25[1])
		ycyl(d=srh25[0],h=th[1],
			center=false,$fn=s_fn);
	}
}

module top_holder()
{
	difference()
	{
		main_shape();
		screw_head_holes();
	}
}

top_holder();
