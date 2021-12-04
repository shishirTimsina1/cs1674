%% CS1674 S21 
% Harris Corner Detection Demo
% Requires autocorr_surface_v2.m (http://pitt.edu/~sjh95/cs1674_s21/lec3/autocorr_surface_v2).m
%
% Seong Jae Hwang (sjh95@pitt.edu)
% Adriana Kovashka (kovashka@cs.pitt.edu)
%% Create images
% Case 1: original rectangle image
im_case1 = [ones(5, 15); [ones(10, 6) zeros(10, 9)]];

% Case 2: "rotated" rectangle image
im_case2 = zeros(15,15);
for i=1:15
    for j=1:15
        if i <= j
            im_case2(i,j) = 1;
        end
        if i <= 16-j
            im_case2(i,j) = 1;
        end
    end
end

% Choose the image: im_case1 or im_case2
im = im_case2;
im = 1 - im; % make "foreground" 1, "background" 0

% Add some noise and check for robustness
im = im + randn(15, 15)*0.1;

% change the image scale and see if we get stronger eigenvalues
scale = 1;
im = im * scale;

% Examples: (r,c) = (y,x)
% Case 1:
% r = 8; c = 7; % Pretty edgy
% r = 10; c = 7; % Very edgy
% r = 6; c = 7; % Very cornery

% Case 2:
% r = 11; c = 5; % Very edgy
r = 9; c = 8; % Very cornery
% r = 10; c = 6; % Mostly edge, some corner

% Compute Energy surface and approximate using first order Taylor approx
hws = 3; % half window size or max offset


% This is a modified autocorr_surface function.
% autocorr_surface_v2.m (http://pitt.edu/~sjh95/cs1674_s21/lec3/autocorr_surface_v2).m
E = autocorr_surface_v2(im, r, c, hws);

% you can try different edge filters such as 'prewitt', 'central', 'sobel'.
% Each will change the response magnitude.
[Ix_im, Iy_im] = imgradientxy(im, 'central');

% ------------------------- YOUR RESULT HERE -------------------------
% Make your own M!
% Ix = 
% Iy = 
% M = 
% --------------------------------------------------------------------

% Approximate the E surface with M
E_approx = zeros(2*hws+1,2*hws+1);
hws_E = ceil(size(E_approx,1)/2);
for u=-hws:hws
    for v=-hws:hws
        E_approx(hws_E+v,hws_E+u) = [u v]*M*[u;v];
    end
end

% Check the eigenvalues D.
% Note: lambda1 < lambda2 is always true with eig function. Do not worry
% about this as their ratio is what matters.
[V, D] = eig(M);
lambda1 = D(1,1);
lambda2 = D(2,2);

% eigenvectors are unique upto rotation. Thus, check the E and identify the
% direction. If E and [V,D] do not agree, switch the eigenvals. This only
% affects the visualization and NOT the interpretation, thus is not
% necessary for computing the cornerness.
E1 = E(round(V(2,1))+hws+1,round(V(1,1))+hws+1);
E2 = E(round(V(2,2))+hws+1,round(V(1,2))+hws+1);

if E1 < E2 
    D = diag([D(2,2), D(1,1)]);
end

% Plot
% close all;
fig1 = figure(1);
clf(fig1);
subplot(2,2,1);hold on;
imshow(im); plot(c, r, 'r.'); axis ij; title('Full image'); axis on; xlabel('x'); ylabel('y'); legend('Window Center');hold off;
axis image;
colorbar;
subplot(2,2,2);hold on;
imshow(im((r-hws):(r+hws), (c-hws):(c+hws))); plot(hws+1, hws+1, 'r.');  axis on; 
xticks(1:2*hws+1); xticklabels((c-hws):(c+hws)); 
yticks(1:2*hws+1); yticklabels((r-hws):(r+hws)); 
colorbar;
axis image;
title('window around keypoint'); xlabel('x'); ylabel('y');
subplot(2,2,3);
imagesc(Ix); title('Ix of window'); xlabel('x'); ylabel('y');
xticks(1:2*hws+1); xticklabels((c-hws):(c+hws)); 
yticks(1:2*hws+1); yticklabels((r-hws):(r+hws));
colorbar;
axis image;
subplot(2,2,4);
imagesc(Iy); title('Iy of window'); xlabel('x'); ylabel('y');
xticks(1:2*hws+1); xticklabels((c-hws):(c+hws)); 
yticks(1:2*hws+1); yticklabels((r-hws):(r+hws));
colorbar;
axis image;

fig2 = figure(2);
clf(fig2);
subplot(2,2,1);
meshc(E); title('E surface'); axis ij; xlabel('u'); ylabel('v'); xticks(1:2*hws+1); xticklabels(-hws:hws); yticks(1:2*hws+1); yticklabels(-hws:hws);
colorbar;
subplot(2,2,2);
meshc(E_approx); title('E approx surface');  axis ij; xlabel('u'); ylabel('v'); xticks(1:2*hws+1); xticklabels(-hws:hws); yticks(1:2*hws+1); yticklabels(-hws:hws);
colorbar;
subplot(2,2,3);
imagesc(E); title('E(u,v)'); xlabel('u'); ylabel('v'); axis ij; xticks(1:2*hws+1); xticklabels(-hws:hws); yticks(1:2*hws+1); yticklabels(-hws:hws);
colorbar;
subplot(2,2,4);
imagesc(E_approx); title('E approx(u,v) = [u v]M[u;v]'); xlabel('u (shift in x)'); ylabel('v (shift in y)'); axis ij; xticks(1:2*hws+1); xticklabels(-hws:hws); yticks(1:2*hws+1); yticklabels(-hws:hws);
colorbar;

fig3 = figure(3);
clf(fig3);
subplot(1,2,1); hold on;
contour(E);title('E contour'); axis ij; xlabel('u'); ylabel('v'); xticks(1:2*hws+1); xticklabels(-hws:hws); yticks(1:2*hws+1); yticklabels(-hws:hws);
axis equal;
hold off;

subplot(1,2,2); hold on;
contour(E_approx); axis xy; xlabel('u'); ylabel('v'); xticks(1:2*hws+1); xticklabels(-hws:hws); yticks(1:2*hws+1); yticklabels(-hws:hws);
quiver(0+hws+1, 0+hws+1, V(1,1), V(1,2), sqrt(D(1,1)), 'LineWidth', 4, 'Color', 'green', 'MaxHeadSize', 5000); axis ij; 
quiver(0+hws+1, 0+hws+1, V(2,1), V(2,2), sqrt(D(2,2)), 'LineWidth', 4, 'Color', 'magenta', 'MaxHeadSize', 5000); axis ij; 
title(sprintf('E approx contour. l_1: %0.3f, l_2: %0.3f', D(1,1), D(2,2)));

% Plot the ellipse based on our M
t = linspace(0,2*pi,100);
e = [cos(t) ; sin(t)];  
VV = V*sqrt(D);
e = bsxfun(@plus, VV*e, [hws+1; hws+1]);
plot(e(1,:), e(2,:), 'r--', 'LineWidth', 5);
axis equal;
hold off;
