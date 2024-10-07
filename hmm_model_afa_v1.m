%%%%%% HMM model


function [ds,turning_angle,displacement,dx_disp,dy_disp,dx,dy]=hmm_model_afa_v1(x,y)
% close all
% clear all
% clc
%%%%% plot step length and turning angle distribution
% n=50000;
% x=5*rand([1,n]);
% y=5*rand([1,n]);

dx=nan(length(x),1);
dy=nan(length(x),1);
ds=nan(length(x),1);
dtheta=nan(length(x),1);
theta=nan(length(x),1);

turning_angle=nan(length(x),1);

displacement=nan(length(x),1);
dx_disp=nan(length(x),1);
dy_disp=nan(length(x),1);



first_time=find(~isnan(x),1);
%first_time=find(~isnan(x)|~isnan(y),1);

displacement(first_time)=0;

for i=1:length(x)-1
    dx(i)=-x(i)+x(i+1);
    dy(i)=-y(i)+y(i+1);
    ds(i)=sqrt(dx(i)^2+dy(i)^2);
    theta(i)=atan(dy(i)/dx(i));

    if i>first_time
        dx_disp(i)=x(i)-x(first_time);
        dy_disp(i)=y(i)-y(first_time);
        displacement(i)=sqrt((x(i)-x(first_time))^2+(y(i)-y(first_time))^2);
    end

end

% for i=2:length(x)-1
%     turning_angle(i)=theta(i)-theta(i-1);
% end

% for i=2:length(x)-1
%     vec1=[x(i)-x(i-1),y(i)-y(i-1),0];
%     vec2=[x(i+1)-x(i),y(i+1)-y(i),0];
%     turning_angle(i)=vecangle(vec1,vec2,[0,0,1]);
% end


for i=2:length(x)-1
     aa=[x(i)-x(i-1),y(i)-y(i-1),0];
     bb=[x(i+1)-x(i),y(i+1)-y(i),0];

        % NA angle if zero step length
    if (all(aa==0) || all(bb==0))
        turning_angle(i)=nan;
    else

     turning_angle(i)=atan2(bb(2),bb(1))-atan2(aa(2),aa(1));
     if turning_angle(i)<=-pi
         turning_angle(i)=turning_angle(i)+2*pi;
     end

     if turning_angle(i)>pi
         turning_angle(i)=turning_angle(i)-2*pi;
     end
    end
 end

%%%%make sure that x and -x are nearly same.

% subplot(1,3,1)
% hold on;
% plot(x,y,'r-o')
%
% subplot(1,3,2)
% hold on;
% hist(ds);
%
% subplot(1,3,3)
% hold on;
% hist(theta);
