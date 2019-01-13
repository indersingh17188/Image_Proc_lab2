function C = imageRotate(I,angle)
%%Referenece taken from StackOverflow.com. This will rotate an image about
%%it's center by an angle and will preserve the information from original
%%image.
[r,c] = size(I);
rads=2*pi*angle/360;  

%%calculating array dimensions such that rotated image gets fit in it exactly 
%we are using absolute so that we get positve value in any case. any quadrant.

r1=ceil(r*abs(cos(rads))+c*abs(sin(rads)));                      
c1=ceil(r*abs(sin(rads))+c*abs(cos(rads)));                     

% define an array with calculated dimensions and fill it with zeros
C=uint8(zeros([r1 c1]));

%calculating center of original and final image
xo=ceil(r/2);                                                            
yo=ceil(c/2);

midx=ceil((size(C,1))/2);
midy=ceil((size(C,2))/2);

% in this loop we calculate corresponding coordinates of pixel of I 
% for each pixel of C, and its intensity will be  assigned after checking
% whether it lies in the bound of I (original image)
for i=1:size(C,1)
    for j=1:size(C,2)                                                       

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);                                       
         y= -(i-midx)*sin(rads)+(j-midy)*cos(rads);                             
         x=round(x)+xo;
         y=round(y)+yo;

         if (x>=1 && y>=1 && x<=size(I,1) &&  y<=size(I,2) ) 
              C(i,j)=I(x,y);  
         end

    end
end