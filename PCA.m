load('teapots.mat')
% mean of dataset
xm=mean(teapotImages);
% plotting the mean image
figure(1)
imagesc(reshape(xm(1,:),38,50));
colormap gray;
title('Mean Image');
% computing the covariance matrix
covar=cov(teapotImages);
% computing the eigen vectors and sorting them in decreasing order
[v,D]=eig(covar);
[k srt]=sort(diag(D),'descend');
v=v(:,srt);
% copying the top 3 eigen vectors into a separate matrice
t3=v(:,1:3);
% plotting the top 3 eigen vectors
figure(2)
subplot(1,3,1);
imagesc(reshape(v(:,1)',38,50));
colormap gray;
subplot(1,3,2);
imagesc(reshape(v(:,2)',38,50));
colormap gray;
subplot(1,3,3);
imagesc(reshape(v(:,3)',38,50));
colormap gray;
title("top 3 eigenvectors")
% Encoding 
C=(teapotImages-xm)*t3;
% Decoding and generating new data set. nxt is the new data set
nxt=xm+C*t3';
i=1;
% plotting images before reconstruction or original dataset
figure(3)
while i<=10
    subplot(2,5,i);
    imagesc(reshape(teapotImages(i,:),38,50));
    colormap gray;
    i=i+1;
end
title("Images before reconstruction")
% plotting images after reconstruction or new dataset
i=1;
figure(4)
while i<=10
    subplot(2,5,i);
    imagesc(reshape(nxt(i,:),38,50));
    colormap gray;
    i=i+1;
end
title("Images after reconstruction")