function [P]=getP(O,PI,A,TAU,MU,SIG,T)
    B=calcB(O,TAU,MU,SIG);
    [alf_s,bet_s,c,P_s]=get_alf_bet_scale(PI,B,A);
    P1=0;
    for t=1:1:T
        P1=P1+log(c(1,t));   
    end;
    
    P=-P1;

