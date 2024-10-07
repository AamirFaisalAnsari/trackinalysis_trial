
 clear all;
 close all;
 clc

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

[filename_pre,FilePath]=uigetfile({'.xml'},...
    'Select XML File', 'MultiSelect', 'on');

filename = [FilePath '\' filename_pre];

maxt=15;

data = parseXML(filename);

timestep=1;
ptoum=1;%0.33;

[x,y,data] = xmltotracks(filename, maxt);
[RMC, MSD] = rmc2(x,y,timestep,ptoum);
