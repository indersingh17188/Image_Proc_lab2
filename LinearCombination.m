function C = LinearCombination (A,B,w1,w2)
%This function will receive two input images (of same size) with their 
%respective weightages and gives their linear combination w1*A+w2*B as an output image
w1=w1/(w1+w2);
w1=w2/(w1+w2);
A1=immultiply(A,w1);
B1=immultiply(B,w2);
C=imadd(A1,B1);
C=uint8(C);
