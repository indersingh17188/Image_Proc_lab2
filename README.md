# Image_Proc_lab2
Laboratory 2 for Image Processing MSCV 2018-2020

This lab was to give us an overview on Geometric Transformations including rotation, scaling, shifting etc without using inbuilt functions.



Translation - Rotation and Interpolation
1. Write a function that shifts the image vertically by tx pixels and horizontally by ty pixels. Write your own code !!

2. Write a function that rotate an image about its center (xc; yc) by an angle of "thita". Write your own code (you should use inverse mapping and try both nearest neighbour and bilinear interpolation) !!


Projective transformation
If a camera captures an image of a 3-D object, then, in general, there will be a perspective mapping of points on the object to corresponding points in the image. Pairs of points that are the same distance apart on the object will be nearer or further apart in the image depending on their distance from the camera and their orientation with respect to the image plane. In a perspective transformation we consider 3-D world coordinates (X; Y;Z) which are arbitrarily distributed in 3-D space and mapped (typically) to the image plane of a camera.
Projective transforms are useful for registering or aligning images or more generally ‘scenes’ which can be approximated as flat obtained fromdifferent viewpoints. Figure 2 illustrates the use of projective transformation as a means to register an image with respect to a different viewpoint.

Here, we will try to acheive the same result, by follwing steps bellow:
1. Read the two images ’plate_side.jpg’ and ’plate_reference.jpg’. The first image is the image to be registered while the second is the reference image.
2. Using MATLAB function ginput, interactively define the coordinates of the 4 corners of the plate quadrilateral in both images.
3. Say that X is the set of coordinates of the points in the reference image, and Y is the set of coordinates of the corresponding points in thes ide image.

Then, we need to find a projective transformation T such that X = TX.
(a) Use MATLAB built-in fucntions cp2tform1 to find the projective transformation T given X and Y .
(b) Apply the obtained transformation to the side image . You could use imtransform.

Try this with your own images.

4 Procrustes analysis
1. Translation: place the origin at the centroid of your reference coordinates (that set of points to which you wish to align) and translate the input coordinates (the points you wish to align) to this origin by subtracting the centroids.
2. Scaling: 
3. Rotation:

You are given two set of points: ’star_points’.mat and ’hand_points.mat’. Write a function that implement the abover Procrustes method and apply it to theses two sets. Your function should look like :

function [Z] = my_procrustes(X, Y)

where Z is the transformed set of point, and X and Y are the input and reference points respectively. You should not use MATLAB built-in function procrustes, but can use it to check if your results are correct!
