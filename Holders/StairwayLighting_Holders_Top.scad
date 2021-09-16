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
	w=d/2-th[1]-srhk[1];
	back(w)
	intersection()
	{
		fwd(d/2-th[1])
		cylinder(d=d,h=h,$fn=xl_fn);
		
		down(1)
		cuboid([th[0],th[1]+2,h+2],
		  align=V_UP+V_BACK);
	}
}

module nut_holder()
{
	w=d/2-th[1]-srhk[1];
	cuboid([th[2],w,h],align=V_UP+V_BACK);
}

module screw_m4_hole()
{
	y=nt25[3]/4;
	h2=d/2-srhk[1]+y+2;
	
	move([0,-y-1,h/2])
	ycyl(d=sr4[0],h=h2,center=false,$fn=s_fn);
}

module screws_m25_holders()
{
	cuboid([srhk[0],nt25[3]/2,h],align=V_UP);
	
	xflip_copy()
	right(srhk[0]/2)
	{
		zcyl(d=sr25[1],h=h,
			center=false,$fn=m_fn);
		
		h2=th[4]+nt25[1]+nt25[4];
		zcyl(d=nt25[3],h=h2,
			center=false,$fn=m_fn);
	}
}

module screws_m25_holes()
{
	xflip_copy()
	right(srhk[0]/2)
	{
		down(1)
		zcyl(d=nt25[0],h=th[4]+nt25[1]+1,
			center=false,$fn=6);
		
		up(th[4]+nt25[1]-epsilon)
		zcyl(d1=nt25[0],d2=sr25[0],
			h=nt25[5],center=false,$fn=6);
		
		down(1)
		zcyl(d=sr25[0],h=h+2,
			center=false,$fn=s_fn);
	}
}

module top_holder()
{
	difference()
	{
		union()
		{
			main_shape();
			nut_holder();
			screws_m25_holders();
		}
		
		screw_m4_hole();
		screws_m25_holes();
	}
}

top_holder();
