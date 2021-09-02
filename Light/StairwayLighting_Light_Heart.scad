include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>
include<StairwayLighting_Light_Vars.scad>
use<StairwayLighting_Light_Common.scad>

th=base_thickness;
ht=heart_light;

module heart()
{
	lh=ht[0];
	lh2=lh/2;
	lht=lh-2*th;
	
	s1=[lh,lh];
	s2=[lht,lht];
	
	ymove(ht[1])
	zrot(45)
	{
		prismoid(size1=s1,size2=s2,h=th);
		
		back(lh2)
		zcyl(d1=lh,d2=lht,h=th,center=0,$fn=xl_fn);
		
		right(lh2)
		zcyl(d1=lh,d2=lht,h=th,center=0,$fn=xl_fn);
	}
}

light()
heart();
