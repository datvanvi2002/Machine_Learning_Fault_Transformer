function k = Duval_DGA(CH4,C2H2,C2H4)
g1 = CH4/(CH4+C2H4+C2H2);
g2 = C2H4/(CH4+C2H4+C2H2);
g3 = C2H2/(CH4+C2H4+C2H2);

L = 500;
P1 = g1*L;
P2 = g2*L;
P3 = g3*L;
Y0 = P1*sin(pi/3) + 50;
X0 = L-P3-P1*cos(pi/3) + 50;

x = [50 300 550 267.5 290 295 305 165 325 340 350 327.5 367.5 387.5...
     415 425 405 475];
y  = [50 483 50 426.7 465.7 474.4 474.4 50 327.1 379.1 396.4 184.2...
     253.5 201.6 249.2 266.5 50 50];

x1 = [x(1) x(4) x(9) x(8)];
y1 = [y(1) y(4) y(9) y(8)];
patch(x1,y1,'c');

x2 = [x(8) x(9) x(13) x(12) x(17)];
y2 = [y(8) y(9) y(13) y(12) y(17)];
patch(x2,y2,'b');

x3 = [x(4) x(5) x(15) x(14) x(18) x(17) x(12) x(13)];
y3 = [y(4) y(5) y(15) y(14) y(18) y(17) y(12) y(13)];
patch(x3,y3,'m');

x4 = [x(6) x(2) x(7)];
y4 = [y(6) y(2) y(7)];
patch(x4,y4,'k');

x5 = [x(5) x(6) x(7) x(11) x(10)];
y5 = [y(5) y(6) y(7) y(11) y(10)];
patch(x5,y5,'y');

x6 = [x(10) x(11) x(16) x(15)];
y6 = [y(10) y(11) y(16) y(15)];
patch(x6,y6,'g');

x7 = [x(14) x(16) x(3) x(18)];
y7 = [y(14) y(16) y(3) y(18)];
patch(x7,y7,'r');
hold on;

x0 = [450 500 500 450];
y0 = [450 450 500 500];

axis([0 600 0 600]);

D1 = inpolygon(X0,Y0,x1,y1);
if (D1 == 1)
    text(200,550,'Low energy discharge (D1)');
    patch(x0,y0,'c');
    k = 2;
end

D2 = inpolygon(X0,Y0,x2,y2);
if (D2 == 1)
    text(200,550,'High energy discharge (D2)');
    patch(x0,y0,'b');
    k = 3;
end

DT = inpolygon(X0,Y0,x3,y3);
if (DT == 1)
    text(150,550,'Mixtures of electrical and thermal faults (DT)');
    patch(x0,y0,'m');
    k = 6;
end

PD = inpolygon(X0,Y0,x4,y4);
if (PD == 1)
    text(200,550,'Partial discharge (PD)');
    patch(x0,y0,'k');
    k = 1;
end

T1 = inpolygon(X0,Y0,x5,y5);
if (T1 == 1)
    text(200,550,'Thermal faults T<300C (T1)');
    patch(x0,y0,'y');
    k = 4;
end

T2 = inpolygon(X0,Y0,x6,y6);
if (T2 == 1)
    text(200,550,'Thermal faults 300C<T<700C (T2)');
    patch(x0,y0,'g');
    k = 4;
end

T3 = inpolygon(X0,Y0,x7,y7);
if (T3 == 1)
    text(200,550,'Thermal faults T>700C (T3)');
    patch(x0,y0,'r');
    k = 5;
end

plot(X0,Y0,'kx','linewidth',5);

x = [X0 P1*cos(pi/3)+50];
y = [Y0 P1*sin(pi/3)+50];
line(x,y,'Color','black','LineStyle','--');

x = [X0 L-P3+50];
y = [Y0 50];
line(x,y,'Color','black','LineStyle','--');

x = [X0 L-(L-P2)*cos(pi/3)+ 50];
y = [Y0 (L-P2)*sin(pi/3)+50];
line(x,y,'Color','black','LineStyle','--');

% title('Duval Triangle DGA (c) 2021 Son Nguyen, Ph.D.');
text(45,200,'CH4(%)');
text(480,200,'C2H4(%)');
text(270,30,'C2H2(%)');

text(20,450,'CH4(%) =');
text(130,450,num2str(g1*100,'%0.2f'));
text(20,400,'C2H4(%) =');
text(140,400,num2str(g2*100,'%0.2f'));
text(20,350,'C2H2(%) =');
text(140,350,num2str(g3*100,'%0.2f'));











