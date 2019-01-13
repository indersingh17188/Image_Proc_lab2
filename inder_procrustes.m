function Z = inder_procrustes (X,Y)
%This function will accept two set of points, one of which will be input
%image which needs to be aligned and other will a reference image to which
%the input image needs to be aligned
figure, subplot(221)
scatter(X(:,1),X(:,2));%Display the set of points we wish to align
hold on;
scatter(Y(:,1),Y(:,2));%Display the set of points to which we wish to align X
title('Original Set of Points');

%Let's find centroid of two set of points
YC=mean(Y);
XC=mean(X);
%Let's find new set of points centered together
Y_CENTERED=[(Y(:,1)-YC(1,1)) (Y(:,2)-YC(1,2))];
X_CENTERED=[(X(:,1)-XC(1,1)) (X(:,2)-XC(1,2))];

%Let's display the plot of these points after Translation
subplot(222)
scatter(X_CENTERED(:,1),X_CENTERED(:,2));
hold on;
scatter(Y_CENTERED(:,1),Y_CENTERED(:,2));
title('Result of Translation');

%Let's find the scaling factor
s=norm(Y_CENTERED)/norm(X_CENTERED);
%Let's scaled the input image as per reference image
X_SCALED=s*X_CENTERED;

%Let's display the plot of these points after Scaling
subplot(223)
scatter(X_SCALED(:,1),X_SCALED(:,2));
hold on;
scatter(Y_CENTERED(:,1),Y_CENTERED(:,2));
title('Result of Scaling');

%Let's do the rotation part now
[U S V]=svd(X_SCALED*Y_CENTERED',0);
R=V*U';
Z=R*X_SCALED;

%Let's display the final result
subplot(224)
scatter(Z(:,1),Z(:,2));
hold on;
scatter(Y_CENTERED(:,1),Y_CENTERED(:,2));
title('Final Result after alignment');