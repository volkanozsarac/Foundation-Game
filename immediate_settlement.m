function Si = immediate_settlement(qnet_ave,v,E,B,L)
%settlement at the center
%B least dimension
%L bigger dimension
%H distance between foundation depth and hard stratum
%qnet average net soil pressure
%v poisson's ratio
%E modulus of elasticity of soil
%%%%%%%%%%%%%First Method%%%%%%%%%
%%a=4;
%%B_prime=B/2;
%%m=L/B;
%%n=H/(B/2);
%%A2=m/(n*sqrt(m^2+n^2+1));
%%A1=log((m+sqrt(m^2+1))*(sqrt(1+n^2))/(m+sqrt(m^2+n^2+1)));
%%A0=m*log((1+sqrt(m^2+1))*(sqrt(m^2+n^2))/(m+sqrt(m^2+n^2+1)));
%%F2=n/(2*pi)*atand(A2);
%%F1=1/pi*(A0+A1);
%%Is=F1+(1-2*v)/(1-v)*F2;
%%% OR Is=0.41+0.037*(1-2*v)/(1-v);

%%%Square case%%%
if L/B==1
    Is=1.12;
elseif 1<L/B<=2
    Is=1.12+0.4*(L/B-1);
elseif 2<L/B<=5
    Is=1.52+0.58*(L/B-2)/3;
end

Si=qnet_ave*(1-v^2)/E*B*Is;
%Si=0.8*Si; %Rigid foundation assumption
end