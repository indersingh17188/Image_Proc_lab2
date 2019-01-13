function O = shiftImage (I,x,y)
%%This function will shift an image I with x pixels vertically and y pixels
%%horizontally and output Image is always bigger than input image so that
%%it won't loose any pixels from input image
[r,c] = size (I);
O(1+x:r+x,1+y:c+y) = I;
