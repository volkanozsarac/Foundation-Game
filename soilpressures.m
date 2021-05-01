function [qnet_max,qnet_min,qnet_ave] = soilpressures(Q,M1,M2,L,B,Df,t,Gama)
%concrete unit weight = 24kN/m3
%q1,q2,q3,q4 stresses at corners, qave average of four points
%Q column force
%M1 & M2 moments
%a,b column dimensions
%L,B foundation dimensions
%Df foundation depth
%t foundation tickness
%Gama_s soil unit weight
%if there is GW, there is also Gama_sat (GW level is from surface)

Qnew=Q+(t*B*L)*24 + Gama*((L*B)*(Df-t));

e1=M1/Qnew;
e2=M2/Qnew;

q1=(Qnew/(B*L))*(1+(6*e1/L)+(6*e2/B));

q2=(Qnew/(B*L))*(1+(6*e1/L)-(6*e2/B));

q3=(Qnew/(B*L))*(1-(6*e1/L)+(6*e2/B));

q4=(Qnew/(B*L))*(1-(6*e1/L)-(6*e2/B));

q=[q1,q2,q3,q4];
qnet_max=max(q) - t*Gama;
qnet_min=min(q) - t*Gama;
qnet_ave=(q1+q2+q3+q4)/4 - t*Gama;

end