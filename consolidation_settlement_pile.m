function Sc = consolidation_settlement_pile(qnet_ave,mv,H,u,z,B,L)
%qnet average net soil pressure
%H layer height
%mv coefficient of volume compressbility
%u skempton and bjerrum correction factor
%depth of present soil layer
%B & L foundation dimensions
%effective stress changes are found by 60degree approximation
%z depth of top of layer

%dividing layer into two

%first oedemeter settlement layer calculations
delta_q1 = (qnet_ave*B*L)/((B+2*tand(30)*(z+H/4))*(L+2*tand(30)*(z+H/4)));
Soed1 = H/2*mv*delta_q1;
%second layer oedemeter settlement calculations
delta_q2 = (qnet_ave*B*L)/((B+2*tand(30)*(z+3*H/4))*(L+2*tand(30)*(z+3*H/4)));
Soed2 = H/2*mv*delta_q2;
%skempton and bjerrum correction
Soed=Soed1+Soed2;
Sc = Soed*u;
Sc = Sc*1000;
end
