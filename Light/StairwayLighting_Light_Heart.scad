include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairwayLighting_Vars_Common.scad>
include<../StairwayLighting_Vars_Screws.scad>

include<StairwayLighting_Vars_Light.scad>
use<StairwayLighting_Light_Common.scad>

module heart_base()
{
	th=lt[0];
	l=lt[2];
	ll=l-th;
	
	s1=[l,l];
	s2=[ll,ll];
	
	ymove(lt[3])
	zrot(45)
	{
		prismoid(size1=s1,size2=s2,h=th);
		
		back(l/2)
		zcyl(d1=l,d2=ll,h=th,center=0,$fn=xl_fn);
		
		right(l/2)
		zcyl(d1=l,d2=ll,h=th,center=0,$fn=xl_fn);
	}
}

light()
heart_base();
