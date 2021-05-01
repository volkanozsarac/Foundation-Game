function Qs = skin_friction_cohesionless(Phi,sigma_effective_0,D,pilelength_along_layer)
%As shaft area (Perimeter x Pile Length)
%Concrete Bored pile is considered Ks=0.5%
%sigma_effective_0 initial effective stress (considered mid of the layer)

Delta=3/4*Phi;
As=pi*D*pilelength_along_layer;
Qs=0.5*sigma_effective_0*tand(Delta)*As;
end
