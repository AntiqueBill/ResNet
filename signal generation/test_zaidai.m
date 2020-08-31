d = fdesign.bandpass('N,Fst1,Fp1,Fp2,Fst2,C',1000,8.75e7,9e7,9.2e7,9.5e7,4e8);
d.Stopband1Constrained = true;
d.Astop1 = 50;
d.Stopband2Constrained = true;
d.Astop2 = 50;

Hd = design(d,'equiripple');
fvtool(Hd)
measure(Hd)

x=wgn(1,2000,1);
yt=filter(Hd,x);
powerx= sum(x.^2);
powery= sum(yt.^2);
