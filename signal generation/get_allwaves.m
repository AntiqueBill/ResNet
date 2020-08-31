function data=get_allwaves(y, yh)
y_cum = cumulant(yh);
[N,~]=size(y);
for i=1:N
    wpt=wpdec(y(i,:), 1 , 'haar');
    A(i,:) = wenergy(wpt);
end
for i=1:N
    wpt=wpdec(y(i,:), 2 , 'haar');
    B(i,:) = wenergy(wpt);
end
for i=1:N
    wpt=wpdec(y(i,:), 3 , 'haar');
    C(i,:) = wenergy(wpt);
end
for i=1:N
    wpt=wpdec(y(i,:), 4 , 'haar');
    D(i,:) = wenergy(wpt);
end
for i=1:N
    wpt=wpdec(y(i,:), 5 , 'haar');
    E(i,:) = wenergy(wpt);
end
for i=1:N
    wpt=wpdec(y(i,:), 6 , 'haar');
    F(i,:) = wenergy(wpt);
end

data = [y_cum A B C D E F];
   
%end
%data = y_cum;