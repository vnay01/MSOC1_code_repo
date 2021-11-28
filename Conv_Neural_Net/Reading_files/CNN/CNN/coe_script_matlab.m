%% This script transforms an image into coe
clear all;clc;
file = 'Images/imgTst/img_00011.png';

BW = imread(file);
%BW = imbinarize(BW,128) %uncomment in case provided image is grayscale [0,255]
fid = fopen('MemInitData.coe','wt');

fprintf(fid,'memory_initialization_radix = 2;\n');
fprintf(fid,'memory_initialization_vector =\n');
for ii = 1:size(BW,1)-1
    fprintf(fid,'%g',BW(ii,:));
    fprintf(fid,',\n');
end
fprintf(fid,'%g',BW(size(BW,1),:));
fprintf(fid,';\n');
fclose(fid);
