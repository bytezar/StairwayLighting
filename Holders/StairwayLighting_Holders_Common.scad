include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Vars_Holders.scad>

use<StairwayLighting_Holders_ScrewHeadBase.scad>
use<StairwayLighting_Holders_ScrewHeadTop.scad>

d=hr[0];
h=hr[1];

module top_head()
{
	intersection()
	{
		cylinder(d=d,h=h,$fn=xl_fn);
		
		move([0,d/2-hr[3],-1])
		cuboid([hr[2],hr[3]+2,h+2],
		  align=V_UP+V_BACK);
	}
}

module make_for_m25_screws()
{
	xflip_copy()
	move([srhk[0]/2,srhk[1],0])
	children();
}

module screws_m25_holders()
{
	back(srhk[1])
	cuboid([srhk[0],nt25[3]/2,h],align=V_UP);
	
	make_for_m25_screws()
	{
		zcyl(d=sr25[1],h=h,
			center=false,$fn=m_fn);
		
		h2=hr[5]+nt25[1]+nt25[4];
		zcyl(d=nt25[3],h=h2,
			center=false,$fn=m_fn);
	}
}

module screws_m25_holes()
{
	make_for_m25_screws()
	{
		down(1)
		zcyl(d=nt25[0],h=hr[5]+nt25[1]+1,
			center=false,$fn=6);
		
		up(hr[5]+nt25[1]-epsilon)
		zcyl(d1=nt25[0],d2=sr25[0],
			h=nt25[5],center=false,$fn=6);
		
		down(1)
		zcyl(d=sr25[0],h=h+2,
			center=false,$fn=s_fn);
	}
}

module test_circle()
{
	down(2)
	color("Green")
	cylinder(d=d,h=2,$fn=xl_fn);
}

module test_screw_head_holder(oblique)
{
	zrot(oblique?hro[0]:0)
	fwd(d/2-shh[1])
	{
		color("DarkGray")
		screw_head_base_holder();

		color("LightGray")
		yflip()
		screw_head_top_holder();
	}
}
