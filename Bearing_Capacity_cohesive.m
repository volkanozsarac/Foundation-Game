function qnf = Bearing_Capacity_cohesive(Gama,cu,Df,B,L,GW,t)
%Bearing capacity calculation for rectangular footings

%Phi: friction angle (degree)
%Gama: unit weight of soil (kN/m3)
%c: cohesion of soil (kPa)
%Df: depth of foundation (m)
%B: smaller dimension of foundation (m)
%L: bigger dimension of rectangular foundation (m)
%GW: Ground water level from surface(m)


Nc = (2+pi)*(1+0.27*sqrt(Df/B));

Sc = 1+0.2*(B/L);


%including buoyant effect

%%% Deep foundation water case %%%

if GW>Df  
    
    qnf = Sc*Nc*cu + Gama*Df - t*Gama;
    

%%% Ground Water is above the foundation level %%%    

elseif GW<=Df
    
    qnf = Sc*Nc*cu + (Gama-10)*Df - t*Gama;
end

end
