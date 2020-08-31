function data=get_data(y, yh, n)
y_cum = cumulant(yh);
[N,~]=size(y);
for i=1:N
    wpt=wpdec(y(i,:), 6 , 'haar');
    [C, L] = wavedec(y(i,:), 5, 'haar');
    F(i,:) = wenergy(wpt);
    [Ea, Ed] = wenergy(C, L);
    A(i, :)= Ea;
    D(i,:)=Ed;
end

data = [y_cum F A D];
   
%end
%data = y_cum;