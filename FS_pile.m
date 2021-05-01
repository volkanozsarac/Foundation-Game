function FS = FS_pile(Qpile,Qult,n,m);

%%%%PILE GROUP EFFICIENCY%%%%%
%%%%Spacing between piles is taken constant as 3*Diameter
%%%%Therefore D/S=1/3;
%%%%n: number of rows of Piles
%%%%m: number of piles in one row

%% Group Effect%%
% theta=atand(1/3);
% efficiency = 1-(theta*((m-1)*n+(n-1)*m))/(90*m*n);
%FS=(efficiency*Qult)/Qpile;
%%
FS=Qult/Qpile;

end