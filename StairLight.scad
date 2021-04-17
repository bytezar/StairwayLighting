useHeartBase=false;

length=78;
baseThickness=2.6;
wallThickness=1.2;

lightHolderLength=50;
lightHolderWidth=40;
lightHolderHeight=12;
lightHolderOffsetY=-14;
lightHoleWidth=6;
lightHolderAngle=-22.5;

screwDistanceX=46;
screwHoleOffsetY=-2;

screwHeadDiameter=7.5;
screwHeadBigDiameter=9;
screwDiameter=6;
screwHolderThickness=0.4;
screwHoleConeThickness=1.0;
screwHoleThickness=0.6;
screwHoleLength=8;

heartLength=60;
heartDiagonal=heartLength*sqrt(2);
heartOffsetY=-5;

wiresHoleWidth=4.4;
wiresHoleHeight=2.4;
wiresHoleOffsetX=-lightHolderHeight/2+3*wallThickness;
wiresHoleLength=-wiresHoleOffsetX+lightHolderLength/2;
wiresConnectorWidth=6.4;
wiresConnectorHeight=3.6;
lightHolderCenterZ=(lightHolderHeight-wallThickness)/2+1.30;

epsilon=0.000000000000000000000001;


module squareBase()
{
	linear_extrude(baseThickness,scale=0.9)
	translate([-length/2,-length/2])
	square(length);
}

module heart2D(){
  square(heartLength);

  translate([heartLength/2,heartLength,0])
  circle(heartLength/2,$fn=64);

  translate([heartLength,heartLength/2,0])
  circle(heartLength/2,$fn=64);
}

module heartBase(){
	translate([0,heartOffsetY,0])
	linear_extrude(baseThickness,scale=0.9)
	{
		translate([0,-heartDiagonal/2-10])
		rotate(45)
		heart2D();
	}
}


module cubeRounded(x,y,h)
{
	h2=h/2;
	cube([x,y,h]);
	
	for (t=[[-h2,0],[x,x]]) 
	{
		translate([t[0],0,0])
		cube([h2,y,h2]);
		
		translate([t[1],0,h2])
		rotate([-90,0,0])
		cylinder(d=h,h=y,$fn=32);
	}
}

module screwHole(t)
{
	h=screwHolderThickness+screwHoleConeThickness+screwHoleThickness;
	translate([0,-screwHoleLength,0])
	union()
	{
		minkowski()
		{
			union()
			{
				cylinder(d=screwDiameter,h=screwHolderThickness,$fn=32);
				
				translate([0,0,screwHolderThickness])
				cylinder(d1=screwDiameter,d2=screwHeadDiameter,h=screwHoleConeThickness,$fn=32);
				
				translate([0,0,screwHolderThickness+screwHoleConeThickness])
				cylinder(d=screwHeadDiameter,h=screwHoleThickness,$fn=32);
			}
			
			cube([epsilon,screwHoleLength,epsilon]);
		}
		
		cylinder(d=screwHeadBigDiameter,h=h,$fn=32);
	}
}

module screwHoleTest()
{
	difference()
	{
		translate([-33,-15,0])
		cube([66,20,1.8]);
		
		for(t=[-1,0,1])
		{
			translate([t*screwDistanceX/2,0,0])
			screwHole(t);
		}
	}
}

difference()
{
	union()
	{
		if (useHeartBase) {
			heartBase();
		} else {
			squareBase();
		}
		
		translate([-lightHolderLength/2,lightHolderOffsetY,baseThickness])
		rotate([lightHolderAngle,0,0])
		difference()
		{
			cubeRounded(lightHolderLength,lightHolderWidth,lightHolderHeight);
			
			translate([wallThickness,-1,0])
			cubeRounded(lightHolderLength-2*wallThickness,lightHoleWidth+1,lightHolderHeight-wallThickness);
			
			translate([wiresHoleOffsetX,lightHoleWidth-1,lightHolderCenterZ-wiresHoleWidth/2])
			cube([wiresHoleLength,wiresHoleHeight+1,wiresHoleWidth]);
		}
	}
	
	translate([-length/2,-length/2,-length])
	cube([length,length,length]);
	
	for(t=[-1,1])
	{
		translate([t*screwDistanceX/2,screwHoleOffsetY,0])
		screwHole();
	}
	
	translate([0,lightHolderOffsetY,baseThickness])
	rotate([lightHolderAngle,0,0])
	union()
	{
		translate([-wiresConnectorHeight/2,lightHoleWidth-1,lightHolderCenterZ-wiresConnectorWidth/2])
		cube([wiresConnectorHeight,length,wiresConnectorWidth]);
		
		translate([-wiresConnectorHeight/2-wiresHoleHeight,lightHoleWidth+wiresHoleHeight-1,lightHolderCenterZ-wiresHoleWidth/2])
		linear_extrude(wiresHoleWidth)
		polygon([
			[0,0],
			[0,1],
			[wiresHoleHeight,wiresHoleHeight+1],
			[2*wiresHoleHeight,wiresHoleHeight+1],
			[2*wiresHoleHeight,0],
		]);
	}
		
}
