% Andy Mason
% 7 July 2022
% MECH 608
% HW 1
% Kirch's Stress Field Solution for Uniaxial Tension about a Circular Hole
%%Given
Sy = 10; % Tension in y-dir (ksi)
a = 3; % Hole Radius (mm)
[r,theta] = meshgrid(a:0.1:20,0:0.01:pi/2); % Mesh grid of radial points 

f = a./r;
rr_t1 = 1-(f.^2);
rr_t2 = 0.5*Sy*(1-(4*(f.^2))+(3*(f.^4)));
Srr = 0.5*Sy*(rr_t1+rr_t2).*cos(2*theta);

rt_t1 = 1+(f.^2);
rt_t2 = -0.5*Sy*(1+(3*(f.^4)));
Srt = 0.5*Sy*(rt_t1+rt_t2).*cos(2*theta);

tt_t1 = 1+(2*(f.^2));
tt_t2 = -3*(f.^4);
Stt = -0.5*Sy*(tt_t1+tt_t2).*sin(2*theta);


%Srr = 0.5*Sy*(1-(a./r).^2)+0.5*Sy*(1-4*(a./r).^2+3*(a./r).^4).*cos(2*theta);
%Srt = 0.5*Sy*((1+(a./r).^2)-0.5*Sy*(1+3*(a./r).^4)).*cos(2*theta);
%Stt = -0.5*Sy*((1+2*(a./r).^2)-3*(a./r).^4).*sin(2*theta);

for i = 1:158
    for j = 1:171
        Q = [sin(theta(i)), cos(theta(i)); cos(theta(i)), -sin(theta(i))];
        Qt = transpose(Q);
        sigma = [Srr(i,j), Srt(i,j); Srt(i,j), Stt(i,j)];
        stress_hold = Q*sigma*Qt;
        stress_11(i,j) = stress_hold(1,1);
        stress_12(i,j) = stress_hold(1,2);
        stress_21(i,j) = stress_hold(2,1);
        stress_22(i,j) = stress_hold(2,2);
    end
end

%I have made each of the stress tensor values and contained them in an
%array

%idea copy paste repository
% Q = [sin(theta), cos(theta); cos(theta), -sin(theta)];
% Qt = transpose(Q);
%sigma = [Srr, Srt; Srt, Stt];

%transform from polar to cartesian
x = r.*cos(theta);
y = r.*sin(theta);
figure(1)
p=pcolor(x,y,stress_11);
colorbar
set(p,'edgecolor','none')
figure(2)
h = pcolor(x,y,stress_22);
colorbar
set(h,'edgecolor','none')
