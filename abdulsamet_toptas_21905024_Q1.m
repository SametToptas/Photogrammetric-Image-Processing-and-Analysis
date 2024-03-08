% 1.Question -- Abdulsamet TOPTAŞ (21905024)

% Loading images - images must be in the same file path
im2 = imread('florence2.jpg');
im3 = imread('florence3.jpg');

% Fundamental Matrix for Florence2 and Florence3
Fmatrix23 = [3.03994528999160e-08, 2.65672654114295e-07, -0.000870550254997210;
             4.67606901933558e-08, -1.11709498607089e-07, -0.00169128012255720;
             -1.38310618285550e-06, 0.00140690091935593, 0.999997201170569];

% Number of points to select
numPoints = 5;

% Starting figure for manual point selection
figure;
imshow(im2);
title('Select 5 Points in Florence 2');

% Getting manually selected points
points2 = ginput(numPoints);

% Displaying selected points in Florence2
hold on;
plot(points2(:,1), points2(:,2), 'ro', 'MarkerSize', 10, 'LineWidth', 3);
hold off;

% Compute epipolar lines
lines3 = Fmatrix23 * [points2, ones(numPoints, 1)]';

% Displaying corresponding epipolar lines in Florence3
figure;
imshow(im3);
title('Corresponding Epipolar Lines in Florence 3');

hold on;
for i = 1:numPoints
    % Compute the endpoints of the line segment
    x = [1 size(im3, 2)];
    y = (-lines3(1,i)*x - lines3(3,i))/lines3(2,i);
    
    % Plot the epipolar line
    plot(x, y, 'LineWidth', 3, 'Color', rand(1,3));
end
hold off;
