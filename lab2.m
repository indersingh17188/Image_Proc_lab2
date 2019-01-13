%Excercise 2.1
A=imread('cameraman.tif');
[r,c]=size(A);
C=(100*ones(r,c));
for i=1:r
for j=1:c
B(i,j)=A(i,j)+C(i,j);
end
end
B=uint8(B);
E=imadd(A,100);
figure;
subplot(1,2,1);imshow(B);title('Image B');
subplot(1,2,2);imshow(E);title('Image E');

%Excercise 2.2
C1=imread('cola1.png');
C2=imread('cola2.png');
C1=rgb2gray(C1);
C2=rgb2gray(C2);
[r,c]=size(C1);
C3=zeros(r,c);
for i=1:r
for j=1:c
C3(i,j)=C1(i,j)-C2(i,j);
end
end
C3=uint8(C3);
figure;
subplot(1,3,1);imshow(C1); title('Cola 1');
subplot(1,3,2);imshow(C2); title('Cola 2');
subplot(1,3,3);imshow(C3); title('Result of Difference');

C4=zeros(r,c);
for i=1:r
for j=1:c
C4(i,j)=abs(C1(i,j)-C2(i,j));
end
end
C4=uint8(C4);
figure;
subplot(131);imshow(C1);title('Cola 1');
subplot(132);imshow(C2); title('Cola 2');
subplot(133);imshow(C4);title('Result of Difference with absolute');

%Excercise 2.3
D=LinearCombination(A,B,0.2,0.5);
figure; imshow (D); title ('Linear Combination');

%Excercise 2.1 Part 1 Image Shifting
Ioriginal = imread('cameraman.tif');
Ishifted = shiftImage(Ioriginal,30,50);%without loosing any pixels
Ishifted1 = imageShift1(Ioriginal,30,50);%loosing pixel information
figure;
subplot(131);imshow(Ioriginal);title('Original Image');
subplot(132);imshow(Ishifted);title('Shifted Image - Full size');
subplot(133);imshow(Ishifted1);title('Shifted Image - Same size');

%Excercise 2.1 Part 2 Image Rotation
I = imread('cameraman.tif');
J = imageRotate(I,50);%Using a function that retains all original image info
K = rotateImage(I,50);%Using nearest neighbour (loosing image info)
L = rotateImage2(I,50);%Using bilinear interpolation (loosing image info)
figure;
subplot(221);imshow(I);title('Original Image');
subplot(222);imshow(J);title('Rotated Image-w/o loosing information');
subplot(223);imshow(K);title('Rotated Image-Nearest Neighbour');
subplot(224);imshow(L);title('Rotated Image-Bilinear');

%Excercise 3 Projective Transformation
I=imread('inder_side.jpg');
J=imread('inder_ref.jpg');
%Calculate X & Y using ginput command (we are using manually here)
X =[   8.0000   19.0000
  518.0000   23.0000
  518.0000  123.0000
   18.0000  125.0000
   ];
Y = [  550   751
   990   713
   984   865
   548   929
  ];
%Find Transition matrix
T=cp2tform(Y,X,'projective');
%Calculate new image using imtranspose
K=imtransform(I,T);
K1=imcrop(K, [568.5100  469.5100  545.9800  147.9800]);
figure;
subplot(221); imshow(I);title('Original Side Image');
subplot(222); imshow(J);title('Original Reference Image');
subplot(223); imshow(K);title('Output Image-Projective Transformation');
subplot(224); imshow(K1);title('Cropped Output Image');

%Excercise 4 : Procrustes Analysis
load star_points.mat;
X1=input_points;%The points we wish to align
Y1=base_points;%The set of points to which I wish to align X
Z1=inder_procrustes(X1,Y1);

%Use another set of points
load hand_points.mat;
X2=input_points;
Y2=reference_points;
Z2=inder_procrustes(X2,Y2);
