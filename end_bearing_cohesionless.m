function Qp = end_bearing_cohesionless(Phi,sigma_effective_0,D)
%%%for bored piles%%%
if 0<Phi<=20;
    Nq=(4*Phi)/20;
elseif 20<Phi<=25
    Nq=4+(Phi-20)/5;
elseif 25<Phi<=28
    Nq=5+(Phi-25);
elseif 28<Phi<=30
    Nq=8+(Phi-28)*2;
elseif 30<Phi<=34
    Nq=12+(Phi-30)*2.5;
elseif 34<Phi<=36
    Nq=22+(Phi-34)*4;
elseif 36<Phi<=38
    Nq=30+(Phi-36)*5;
elseif 38<Phi<=40
    Nq=40+(Phi-38)*10;
elseif 40<Phi<=42
    Nq=60+(Phi-40)*10;
elseif 42<Phi<=45
    Nq=80+(Phi-42)*(35/3);
end

%%%%Ap is base area of pile%%%%
%%%%sigma_effective_0 initial effective stress at the end of pile%%%%
%%%%intial effective stress becomes constant after critical depth=20*D%%%
%%%%Consider mid of the layer for effective stress%%%%
Ap=pi*D^2;
Qp=Nq*sigma_effective_0*Ap;

end