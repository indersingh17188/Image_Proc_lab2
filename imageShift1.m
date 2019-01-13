function O = imageShift1(I,x,y)
%This function will shift an input image I by x pixels in vertical and y
%pixel in horizontal axis and the output image will be of same size which
%means it will always loose some pixels from original image.
[r,c]=size(I);
O=uint8(zeros(r,c));
for i=1:r
    for j=1:c
        if(i+x<=r && j+y<=c)
        O(i+x,j+y)=I(i,j);
        end
    end
end