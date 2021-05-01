function FS = factor_of_safety(qnf,qnet_max)

%Gama: Unit weight of the soil
%Df: Depth of foundation
%Df*Gama: excavated portion for shallow foundation
%qf:Bearing capacity of the soil
%qmax: maximum pressure on the soil

FS=qnf/qnet_max;


end
