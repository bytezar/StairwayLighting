include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../../StairwayLighting_Vars_Common.scad>
include<../../StairwayLighting_Vars_Screws.scad>
include<../StairwayLighting_Vars_Holders.scad>

use<../StairwayLighting_Holders_Common.scad>

draw_test_circle=false;

d=hr[0];
h=hr[1];

module screw_m4_holder()
{
	w=d/2-hr[3]-srhk[1];
	
	back(srhk[1])
	cuboid([hr[4],w,h],align=V_UP+V_BACK);
}

module screw_m4_hole()
{
	y=nt25[3]/4;
	hh=d/2-srhk[1]+y+2;
	
	move([0,srhk[1]-y-1,h/2])
	ycyl(d=sr4[0],h=hh,center=false,$fn=s_fn);
}

module vertical_holder()
{
	difference()
	{
		union()
		{
			top_head();
			screw_m4_holder();
			screws_m25_holders();
		}
		
		screw_m4_hole();
		screws_m25_holes();
	}
}

vertical_holder();

if (draw_test_circle)
{
	test_circle();
}
