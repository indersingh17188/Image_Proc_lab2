function J = rotateImage(I,angle)
%This function will rotate an image I around it's center by an angle and
%the dimension of output image will be same as input which means we will
%loose some information using this function in the output image. Also this
%function uses nearest neghbour technique
[r,c]=size(I);
J=uint8(zeros(r,c));
%Let's calculate center pixel indices for the input image
xc=ceil(r/2); 
yc=ceil(c/2);
rads=pi*angle/180; %converting degree angle into radians
for i=1:r
    for j=1:c
        %Using inverse mapping to calculate the index of pixel to be pixked
        %from original image
        x=((i-xc)*cos(rads)+(j-yc)*sin(rads))+xc;
        y=(-(i-xc)*sin(rads)+(j-yc)*cos(rads))+yc;
        %Using the nearest index value for pixel
        x1=round(x);
        y1=round(y);
        if (x1>0 && x1<r && y1>0 && y1<c)
                J(i,j)=I(x1,y1);
            
        end
    end
end