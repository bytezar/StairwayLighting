include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Holders_Vars.scad>

sr25=screw_m25;
nt25=nut_m25;

sr4=screw_m4;
srh4=screw_m4_head;

mh=middle_holder;
th=top_holder;

sd=screws_distance;
hh=holder_height;

hh2=hh/2;
yy=nt25[3]/4;

module main_shape()
{
	left(mh[0]/2)
	cube([mh[0],mh[1],hh]);
}

module top_screws_holders()
{
	left(th[0]/2)
	back(mh[1]-mh[2])
	cube([th[0],mh[2],hh]);
}

module top_screws_holes()
{
	xflip_copy()
	right(th[2]/2)
	up(hh2)
	fwd(yy+1)
	ycyl(d=sr25[0],h=yy+mh[1]+2,
		center=false,$fn=s_fn);
}

module bottom_screws_holders()
{
	left(sd/2)
	fwd(yy)
	cube([sd,nt25[3]/2,hh]);
	
	h=nt25[1]+nt25[4];
	xflip_copy()
	right(sd/2)
	{
		zcyl(d=nt25[3],h=h,
			center=false,$fn=m_fn);
		
		zcyl(d=sr25[1],h=hh,
			center=false,$fn=m_fn);
	}
}

module bottom_screws_holes()
{
	xflip_copy()
	right(sd/2)
	{
		down(1)
		zcyl(d=nt25[0],h=nt25[1]+1,
			center=false,$fn=6);
		
		up(nt25[1])
		zcyl(d1=nt25[0],d2=sr25[0],
			h=nt25[5],center=false,$fn=6);
		
		down(1)
		zcyl(d=sr25[0],h=hh+2,
			center=false,$fn=s_fn);
	}
}

module screw_m4_hole()
{
	move([0,-1-yy,hh2])
	ycyl(d=sr4[0],h=yy+mh[1]+2,
		center=false,$fn=s_fn);
	
	move([0,mh[1]-srh4[1],hh2])
	ycyl(d=srh4[0],h=srh4[1]+1,
		center=false,$fn=6);
}

module middle_holder()
{
	difference()
	{
		union()
		{
			main_shape();
			top_screws_holders();
			bottom_screws_holders();
		}
		
		screw_m4_hole();
		top_screws_holes();
		bottom_screws_holes();
	}
}

middle_holder();
