function Qp = end_bearing_cohesive(cu,D)

%%%Cu undrained shear strength of the soil%%%
%%%Nc is taken as 9%%%
%%%Ap is base area of pile
Ap=pi*D^2;
Qp=9*cu*Ap;
end