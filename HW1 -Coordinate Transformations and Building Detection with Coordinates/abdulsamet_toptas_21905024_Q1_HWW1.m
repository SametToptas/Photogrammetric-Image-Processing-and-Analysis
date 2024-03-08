% Abdulsamet TOPTAŞ - 21905024
% 1- (50 Points) Please perform the Object Space -> Image Space transformation with 
% the help of the Projection Matrix in homogeneous coordinates.

format longG

% file coordinate system
ox = 3840.0; % pixel - colpp
oy = 6912.0; % pixel - rowpp 

focal_length = 120;
pixel_size = 0.012;


% Projection Centres (X0,Y0,Z0 in meters)
cx = 497049.238;
cy = 5420301.525;
cz = 1163.806;

% coordinates in meters
coordinates = [
    497113.220, 5419946.461, 287.650, 1;
    497130.081, 5419948.322, 287.650, 1;
    497132.582, 5419926.619, 287.700, 1;
    497128.209, 5419926.155, 287.650, 1;
    497130.884, 5419901.053, 287.650, 1;
    497141.373, 5419902.170, 287.300, 1;
    497142.131, 5419895.066, 287.650, 1;
    497118.956, 5419892.610, 287.650, 1;
    497113.220, 5419946.461, 287.650, 1
];

% Rotation angles in radians
omega = 2.05968 * (pi / 200);
phi = 0.67409 * (pi / 200);
kappa = 199.23470 * (pi / 200);

% Rotation matrix
R = [
    cos(phi) * cos(kappa) + sin(phi) * sin(omega) * sin(kappa), cos(omega) * sin(kappa), -sin(phi) * cos(kappa) + cos(phi) * sin(omega) * sin(kappa), 0;
    -cos(phi) * sin(kappa) + sin(phi) * sin(omega) * cos(kappa), cos(omega) * cos(kappa), sin(phi) * sin(kappa) + cos(phi) * sin(omega) * cos(kappa), 0;
    sin(phi) * cos(omega), -sin(omega), cos(omega) * cos(phi), 0;
    0, 0 ,0, 1];

% Projection Centres (X0,Y0,Z0 in meters)
T = [1, 0, 0, -cx;
    0, 1, 0, -cy;
    0, 0, 1, -cz;
    0, 0, 0, 1];

% External matrices
external = R * T; 

f_sx_sy = focal_length / pixel_size;

% Perspective projection matrix - Intrinsic parameters
perspective_projection = [-f_sx_sy, 0, ox, 0;
    0, f_sx_sy, oy, 0;
    0, 0, 1, 0];

% Homogeneous coordinates
coordinates_homogeneous = coordinates * (external' * perspective_projection');

% Normalize homogeneous coordinates
image_coordinates = coordinates_homogeneous(:, 1:2) ./ coordinates_homogeneous(:, 3);

% Giving result
disp('Image Coordinates in Image Space:');
disp(image_coordinates);