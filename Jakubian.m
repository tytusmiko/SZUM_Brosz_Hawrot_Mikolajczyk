%% liczonko jakobianka /liczonko modelku manipulatorka 

syms   theta1 theta2 theta3  real


u1 = [0 0 0]' %......................położenie punktu początkowego członu pierwszego - obracanego w osi Z
w1 = [0 0 1]' %......................predkosc obrotova wokół osi [X Y Z] 1rad/s wzgledem punku u1
p10 = [1 0 0 1]' %...................punkt konca ramienia
s1 =[w1; -cross(w1,u1)];

u2 = [1 0 0]'  %.....................położenie punktu początkowego drugiego członu (const)
w2 = [0 1 0 ]'  %....................prędkość kątowa wokół osi [X Y Z] 1rad/s względem punktu u2
p20 = [2 0 1 1]' %...................Połozenie początkowe końca drugiego członu
s2 =[w2; -cross(w2,u2)];
       
u3 = [2 0 1]' %......................położenie punktu początkowego trzeciego członu
w3 = [0 1 0]' %......................prędkość kątowa wokół osi [X Y Z] 1rad/s względem punktu u3
p30 = [3 0 0 1]' %...................Połozenie początkowe końca drugiego członu
s3 = [w3; -cross(w3,u3)];

hat = @(s)[ 0 -s(3) s(2) s(4);...
            s(3) 0  -s(1) s(5);...
            -s(2) s(1) 0 s(6); ...
            0 0 0 0;];
        
for theta = 0:0.1:10*pi
    omegate1 = hat(s1)*theta;
    omegate2 = hat(s2)*theta;
    omegate3 = hat(s3)*theta;
   
    p1 = expm(omegate1)*p10;
    p2 = expm(omegate1)*expm(omegate2)*p20;
    p3 = expm(omegate1)*expm(omegate2)*expm(omegate3)*p30;
    plot3([0, p1(1), p2(1),p3(1)],...
          [0, p1(2), p2(2),p3(2)],...
          [0, p1(3), p2(3),p3(3)],'bo-');
    view(3)
    axis([-6 6 -6 6 -6 6])
  
    pause(0.1)
end



A1 = expm(hat(s1)*theta1);
A2 = expm(hat(s2)*theta2);
A3 = expm(hat(s3)*theta3);


J = [hat(s1)*p3,   A1*hat(s2)*inv(A1)*p3,   A1*A2*hat(s3)*A3*p30];  %Wyrażenie na jakobian policzone analitycznie




  
%% całeczka z jakobianeczka

syms   theta1 theta2 theta3  real


[t, theta]=ode45(@dyn,0:0.1:10,[pi/6;pi/6;pi/6])

u1 = [0 0 0]' %......................położenie punktu początkowego członu pierwszego - obracanego w osi Z
w1 = [0 0 1]' %......................predkosc Obrotova -radziecki fizyk
p10 = [1 0 0 1]' %...................punkt konca ramienia
s1 =[w1; -cross(w1,u1)];

u2 = [1 0 0]'  %.....................położenie punktu początkowego drugiego członu (const)
w2 = [0 1 0 ]'  %....................prędkość kątowa wokół osi [X Y Z] 1rad/s -  tu trzeba wrzucic kat od rotacji członu 1 (rotacja Y)
p20 = [2 0 1 1]' %...................Połozenie początkowe końca drugiego członu
s2 =[w2; -cross(w2,u2)];

hat = @(s)[ 0 -s(3) s(2) s(4);...
            s(3) 0  -s(1) s(5);...
            -s(2) s(1) 0 s(6); ...
            0 0 0 0;];
       
u3 = [2 0 1]' %......................położenie punktu początkowego trzeciego członu
w3 = [0 1 0]' %......................prędkość kątowa wokół Z 1rad/s)
p30 = [3 0 0 1]' %...................Połozenie początkowe końca drugiego członu
s3 = [w3; -cross(w3,u3)];

for i=1:length(t) 
   
   
    omegate1 = hat(s1)*theta(i,1);
    omegate2 = hat(s2)*theta(i,2);
    omegate3 = hat(s3)*theta(i,3);
   
    p1 = expm(omegate1)*p10;
    p2 = expm(omegate1)*expm(omegate2)*p20;
    p3 = expm(omegate1)*expm(omegate2)*expm(omegate3)*p30;
    plot3([0, p1(1), p2(1),p3(1)],...
          [0, p1(2), p2(2),p3(2)],...
          [0, p1(3), p2(3),p3(3)],'ro-');
    view(3)
    axis([-6 6 -6 6 -6 6])
    
    pause(0.1)
end
function dx = dyn(t,x)
theta1=x(1);
theta2=x(2);
theta3=x(3);
J=[

[ 3270616151937757/2251799813685248,                                                     (2256944571763519*cos(theta1))/1125899906842624, -2^(1/2)*sin(theta2 + theta3 + pi/4)*cos(theta1)];
[   577621035839997/281474976710656,                                                     (2256944571763519*sin(theta1))/1125899906842624, -2^(1/2)*sin(theta2 + theta3 + pi/4)*sin(theta1)];
[                                 0, (3270616151937757*sin(theta1))/2251799813685248 - (577621035839997*cos(theta1))/281474976710656 + 1,             -2^(1/2)*cos(theta2 + theta3 + pi/4)];
[                                 0,                                                                                                   0,                                                0];
];    %Jakobian uproszczony (simplify(J)) na podstawie J z pierwszej części skryptu (do pojawienia się zmiennych symbolicznych / %% całeczka z jakobianeczka)
dx= inv(J(1:3,:))*[0;cos(t);-sin(t)];
end


