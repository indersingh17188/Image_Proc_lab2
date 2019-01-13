function J = rotateImage2 (I,angle)
%This function will rotate an image I around it's center by an angle and
%the dimension of output image will be same as input which means we will
%loose some information using this function in the output image. Also this
%function uses nearest bilinear interpolation technique to find the correct
%intensity value of each pixel of output image.
[r,c]=size(I);
J=uint8(zeros(r,c));
xc=ceil(r/2);
yc=ceil(c/2);
rads=pi*angle/180;
for i=1:r
    for j=1:c
        %for inverse mapping, we used +sin in 1st and -sin in 2nd row
        x=((i-xc)*cos(rads)+(j-yc)*sin(rads))+xc;
        y=(-(i-xc)*sin(rads)+(j-yc)*cos(rads))+yc;
        %Calculating indices of 4 neighbours for bilinear
        x1=floor(x); x2=1+x1; y1=floor(y); y2=1+y1; 
       if (x1>0 && x1<r && y1>0 && y1<c && x2>0 && x2<r && y2>0 && y2<c)
           %Calculating distances of 4 nearby indices
            a=x-x1; b=1-a; c1=y-y1; d=1-c1;
            %using bilinear interpolation formula                
            J(i,j) = d*(a*I(x2,y1)+b*I(x1,y1)) + c1*(a*I(x2,y2)+b*I(x1,y2));            
       end
    end
end