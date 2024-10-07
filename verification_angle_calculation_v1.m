
point2=[-5,-5];
point1=[0,0];

track_angle=atand((point2(2)-point1(2))/(point2(1)-point1(1)))

track_angle2=atan2d(point2(2)-point1(2),point2(1)-point1(1)) + 360*((point2(2)-point1(2))<0)
track_angle3=mod(atan2d(point2(2)-point1(2),point2(1)-point1(1)),360)
