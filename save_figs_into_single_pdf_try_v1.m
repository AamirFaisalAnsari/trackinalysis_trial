close all
clc
clear all

delete('myplots2.pdf')

x=normrnd(0,2,[1,100]);

figure_1=figure(1);
histogram(x)


ax = gca;
%exportgraphics(figure_1,'myplots2.pdf');

close all
figure_2=figure(2);
figure_2.Position=[0,0,1500,300];
bar(1:10)
%exportgraphics(figure_2,'myplots2.pdf','Append',true)

close all


exportgraphics(figure_1,'myplots2.pdf');
exportgraphics(figure_2,'myplots2.pdf','Append',true)
