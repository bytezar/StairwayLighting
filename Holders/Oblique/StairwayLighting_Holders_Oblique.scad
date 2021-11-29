include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../../StairwayLighting_Vars_Common.scad>
include<../../StairwayLighting_Vars_Screws.scad>
include<../StairwayLighting_Vars_Holders.scad>

use<../StairwayLighting_Holders_Common.scad>

draw_test_circle=true;

d=hr[0];
h=hr[1];

module screw_m4_holder()
{
	w=d/2-hro[2]-hr[3];
	
	back(hro[2])
	{
		cuboid([hr[4],w,h],align=V_UP+V_BACK);
		cuboid([sr4[2],hro[1],h],align=V_UP+V_BACK);
	}
}

module screw_m4_hole()
{
	hh=d/2-hro[2]+2;
	
	move([0,hro[2]-1,h/2])
	ycyl(d=sr4[0],h=hh,center=false,$fn=s_fn);
}

module oblique_holder(angle_direction)
{
	difference()
	{
		union()
		{
			zrot(angle_direction*hro[0])
			{
				top_head();
				screw_m4_holder();
			}
			
			screws_m25_holders();
		}
		
		zrot(angle_direction*hro[0])
		screw_m4_hole();
			
		screws_m25_holes();
	}
}

oblique_holder(1);

if (draw_test_circle)
{
	test_circle();
}
