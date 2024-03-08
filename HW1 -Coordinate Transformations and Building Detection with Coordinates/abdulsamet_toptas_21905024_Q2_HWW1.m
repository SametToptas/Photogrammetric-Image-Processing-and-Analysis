% Abdulsamet TOPTAŞ - 21905024
% 2- (10 points) You are required to plot the projected boundaries of all buildings on 
% image 61.jp2. 

img = imread('61.jp2');
normalized_img = imadjust(img);

% Canny edge detection
edge_img = edge(normalized_img, 'Canny', [0.1 0.4]);

% Binary thresholding
binary_threshold = 0.1;  % Experiment with different threshold values
binary_edge_img = edge_img > binary_threshold;

% Hysteresis Thresholding
final_edge_img = bwareaopen(binary_edge_img, 10); % This step can remove weak edges, optional

% Displaying the original image with building boundaries
figure;
imshow(img);
hold on;

% Overlay building boundaries on original image
visboundaries(binary_edge_img, 'Color', 'g', 'LineWidth', 0.3);

hold off;
