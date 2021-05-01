function Qs = skin_friction_cohesive(cu,D,pilelength_along_layer)

%%Cu undrained shear strength of clay (kN/mm^2)
%%As shaft area (Perimeter x pile length)

if cu<=25
    a=1;
elseif 25<cu<90
    a = 1-0.00615*(cu-25);
elseif 90<=cu<=200
    a = (10^-5)*cu^2 - 0.0066*cu + 1.0851;
end
As=pi*D*pilelength_along_layer;
Qs=a*cu*As;
end
