function a = vecangle(v1,v2,n)
x1 = cross(v1,v2);
c = sign(dot(x1,n)) * norm(x1);
a = atan2(c,dot(v1,v2));
end