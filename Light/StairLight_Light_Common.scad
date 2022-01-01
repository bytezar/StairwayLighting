include<BOSL/constants.scad>
use<BOSL/transforms.scad>
use<BOSL/shapes.scad>

include<../StairLight_Vars_Common.scad>
include<../StairLight_Vars_Screws.scad>
include<StairLight_Vars_Light.scad>

th=lt[0];
wth=lsh[3];

echo("Led strip width space:", 
  lsh[2]-lsh[3]+lsh[4]*tan(lsh[5]));

module led_strip_holder()
{
	s1=[lsh[0],lsh[1],lsh[2]];
	s2=[lsh[0]-2*wth,lsh[4]+1,lsh[2]-wth+1];
	
	top_half(z=th)
	move([0,lsh[6],th])
	xrot(lsh[5])
  difference()
	{
		cuboid(s1,fillet=lsh[2]/2,
			align=V_UP+V_BACK,
			edges=EDGES_Y_TOP,$fn=l_fn);
		
		move([0,-1,-1])
		cuboid(s2,fillet=lsh[2]/2-wth,
			align=V_UP+V_BACK,
			edges=EDGES_Y_TOP,$fn=l_fn);
	}
}

module wires_hole()
{
	x1=lsh[0]/2-wth;
	x2=x1-wh[7];
	x3=x2-wh[6];
	h=lsh[2]-lsh[3];
	z1=lsh[4]*tan(-lsh[5]);
	z2=(h+z1)/2;
	
	move([0,lsh[6],th])
	xrot(lsh[5])
	move([0,lsh[4]-epsilon,z2])
	union()
	{
		right(epsilon)
		intersection()
		{		
			s1=[wh[6],wh[4],wh[5]];
			left(x2)
			cuboid(s1,align=V_BACK+V_RIGHT);
			
			s2=[x1,wh[4],h];
			down(z1/2)
			cuboid(s2,fillet=lsh[2]/2-wth,
			  align=V_BACK+V_LEFT,
			  edges=EDGE_TOP_LF,$fn=l_fn);
		}
		
		w1=wh[4]-wh[0];
		if(w1>0)
		{
			s3=[w1,wh[1],w1];
			left(x3+epsilon)
			back(wh[0]-epsilon)
			xrot(-90)
			right_triangle(s3,align=V_UP+V_RIGHT);
		}
		
		s4=[x2-wh[6],wh[0],wh[1]];
		cuboid(s4,align=V_BACK+V_LEFT);
		
		left(wh[2]/2-epsilon)
		back(wh[0]-epsilon)
		xflip()
		xrot(-90)
		right_triangle(wh[1],align=V_UP+V_RIGHT);
		
		s5=[wh[2],lsh[1],wh[3]];
		cuboid(s5,align=V_BACK);
	}
}

module screw_hole()
{
	sd=screw_m25[0];
	h=srhh25[0]+srh25[1]+srhh25[1];
	
	down(epsilon)
	fwd(srhh25[3])
	union()
	{
		minkowski()
		{
			union()
			{
				cylinder(d=sd,h=srhh25[0],$fn=m_fn);
				
				up(srhh25[0])
				cylinder(d1=sd,d2=srh25[0],
					h=srh25[1],$fn=m_fn);
				
				up(srhh25[0]+srh25[1])
				cylinder(d=srh25[0],h=srhh25[1],$fn=m_fn);
			}
			
			cube([epsilon,srhh25[3],epsilon]);
		}
		
		cylinder(d=srhh25[2],h=h,$fn=m_fn);
	}
}

module screws_holes()
{
	xflip_copy()
	right(srhk[0]/2)
	ymove(srhk[1])
	screw_hole();
}

module light()
{
	difference()
	{
		union()
		{
			children();
			led_strip_holder();
		}
		
		wires_hole();
		screws_holes();
	}
}

module test()
{
	l=lt[1];
	s1=[l,l];
	s2=[l-2*th,l-2*th];
	
	light()
  prismoid(size1=s1,size2=s2,h=th);
}

//test();
