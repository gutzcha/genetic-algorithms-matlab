function make_plots(target, rocket,gen, obstacles)
x=target(1,1);
y=target(2,1);
r=target(3,1);
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit);

%axis 
%xlimits= (abs(target(1,1))+1)*3
limits=[-100, 100, -0.2*y-1, 1.2*y+1];
axis(limits)

hold on

x0=0;
y0=0;
r0=0.1;
th0 = 0:pi/50:2*pi;
xunit0 = r0 * cos(th0) + x0;
yunit0 = r0 * sin(th0) + y0;
plot(xunit0, yunit0,'LineWidth',4);

plot (target(1),target(2),'ro')

for i=1:size(obstacles,2)
    plot (obstacles(i).obstacles(1,:),obstacles(i).obstacles(2,:),'LineWidth',4)
end

for i=1:size(rocket,2)
plot (rocket(i).path(1,:),rocket(i).path(2,:),'color',rand(1,3))
end

legend(num2str(gen))
hold off
