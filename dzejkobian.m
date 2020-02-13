    %% nowy skrypt nowy rozdział 
    % dodajemy 3 człon ktory obraca sie wokół osi Z w zwiazku z czym on w =[0 0 1]
    uz = [0 0 0] % położenie punktu początkowego członu obracanego w osi Z
    wz = [0 0 1] % wskazanie osi obrotu 
    pz = [1 0 0 1] % punkt koncowy
    u = [1 0 0]'  % położenie punktu początkowego pierwszego członu (const) 
    w = [0 1 0]'  % prędkość kątowa wokół osi [X Y Z] 1rad/s -  tu trzeba wrzucic kat od rotacji członu 1 (rotacja Z)
    p0 = [0 0 0 1]' %Połozenie początkowe końca pierwszego członu
    s =[w; -cross(w,u)];
    hat = @(s)[ 0 -s(3) s(2) s(4);...
                s(3) 0  -s(1) s(5);...
                -s(2) s(1) 0 s(6); ...
                0 0 0 0;];
    u1 = [0 0 0]' % położenie punktu początkowego drugiego członu
    w1 = [0  1 0]' %(prawdfopodobie prędkość kątowa wokół Z 1rad/s)
    p01 = [2 1 0 1]' %Połozenie początkowe końca drugiego członu
    s1 =[w1; -cross(w1,u1)];
    %% nowy rozdział nowa pętelka 
    for theta = 0:0.1:2*pi
        omegate = hat(s)*theta;
        omegate1 = hat(s1)*theta;
        p = expm(omegate)*p0;
        p1=expm(omegate)*expm(omegate1)*p01;
        plot3([5, p(1),p1(1)],...
             [4, p(2),p1(2)],...
             [0, p(3),p1(3)],'bo-');
        view(45,-90)
        axis([-20 20 -20 20 -20 20])

        pause(0.1)
    end
