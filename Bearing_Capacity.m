function qnf = Bearing_Capacity(Phi,Gama,c,Df,B,L,GW,t)
%Bearing capacity calculation for rectangular footings

%Phi: friction angle (degree)
%Gama: unit weight of soil (kN/m3)
%c: cohesion of soil (kPa)
%Df: depth of foundation (m)
%B: smaller dimension of foundation (m)
%L: bigger dimension of rectangular foundation (m)
%GW: Ground water level from surface(m)

Nq = ((1+sind(Phi))/(1-sind(Phi)))*exp(pi*tand(Phi));
Nc = (Nq-1)*cotd(Phi);
Ngama = 1.8*(Nq-1)*tand(Phi);        %suggested by hansen

%Shape factors
%Given in Craig's soil mechanics book
Sq = 1+(B/L)*sind(Phi);
Sc = ((Sq*Nq)-1)/(Nq-1);
Sgama = 1-0.3*B/L;

%including buoyant effect

%%% Deep foundation water case %%%

if GW>Df+2*B  
    
    qnf = (1/2)*Gama*Sgama*Ngama*B + Sc*Nc*c + Sq*Nq*Gama*Df - t*Gama;
    
%%% Ground Water is close to foundation level %%%
    
elseif GW<=Df+2*B && GW>Df     
    
    qnf = (1/2)*(Gama-10)*Sgama*Ngama*B + Sc*Nc*c + Sq*Nq*Gama*Df - t*Gama;

%%% Ground Water is above the foundation level %%%    

elseif GW<=Df
    
    qnf = (1/2)*(Gama-10)*Sgama*Ngama*B +Sc*Nc*c + Sq*Nq*(Gama-10)*Df - t*Gama;
end

end

