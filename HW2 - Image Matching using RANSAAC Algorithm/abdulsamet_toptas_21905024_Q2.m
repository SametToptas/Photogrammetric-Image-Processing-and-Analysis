% 2.Question -- Abdulsamet TOPTAŞ (21905024)

% Loading images - images must be in the same file path
im1 = imread('florence1.jpg');
im2 = imread('florence2.jpg');
im3 = imread('florence3.jpg');

% Fundamental Matrix for [Florence1 and Florence3] and [Florence2 and Florence3]
Fmatrix13 = [6.04444985855117e-08, 2.56726410274219e-07, -0.000602529673152695;
             2.45555247713476e-07, -8.38811736871429e-08, -0.000750892330636890;
            -0.000444464396704832, 0.000390321707113558, 0.999999361609429];

Fmatrix23 = [3.03994528999160e-08, 2.65672654114295e-07, -0.000870550254997210;
             4.67606901933558e-08, -1.11709498607089e-07, -0.00169128012255720;
            -1.38310618285550e-06, 0.00140690091935593, 0.999997201170569];

% Number of points to select
numPoints = 5;

% Starting figure for manual point selection
figure;
imshow(im1);
title('Select 5 Points in Florence 1');

% Getting manually selected points
points1 = ginput(numPoints);

% Starting figure for manual point selection
figure;
imshow(im2);
title('Select 5 Points in Florence 2''(same location as im1)');

% Getting manually selected points
points2 = ginput(numPoints);

% Match selected points
matchedPoints = [points1, points2];

% Calculate epipolar lines
lines3_from_im1 = Fmatrix13 * [matchedPoints(:, 1:2), ones(numPoints, 1)]';
lines3_from_im2 = Fmatrix23 * [matchedPoints(:, 3:4), ones(numPoints, 1)]';

% Show corresponding epipolar lines in Florence 3
figure;
imshow(im3);
title('Corresponding Epipolar Lines in Florence 3');

hold on;
for i = 1:numPoints
    % Calculate endpoints of line
    x = [1 size(im3, 2)];
    
    % Drawing epipolar lines of selected points from Florence 1
    y1 = (-lines3_from_im1(1,i)*x - lines3_from_im1(3,i))/lines3_from_im1(2,i);
    
    % Drawing epipolar lines of selected points from Florence 2
    y2 = (-lines3_from_im2(1,i)*x - lines3_from_im2(3,i))/lines3_from_im2(2,i);
    
    % Show two lines on the same chart
    plot(x, y1, 'LineWidth', 3, 'Color', rand(1,3));
    plot(x, y2, 'LineWidth', 3, 'Color', rand(1,3));
end
hold off;
