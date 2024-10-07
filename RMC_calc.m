function [RMC1,pers,speed, exit_flags] = RMC_calc(msd)
sem_cell = msd(1:ceil(end/2),3);
msd_cell = msd(1:ceil(end/2),2);
tau_cell = msd(1:ceil(end/2),1);

if sum(msd_cell) == 0 || isnan(sum(msd_cell))==1
    RMC = nan;
    P=[nan,nan];
    S=nan;
    exitflag2=nan;
    %[P,S,exitflag2]=fminunc(@(P) prandwalk(P,tau_cell,msd_cell,sem_cell),[1.1 1.1],options);
    
    pers=P(2);
    speed=P(1);
    
    exitflag1=nan;
    exitflag2=nan;
    
    %[P,S,exitflag2]=fminunc(@(P) prandwalk(P,tau_cell,msd_cell,sem_cell),[1.1 1.1],options);
    
    pers=P(2);
    speed=P(1);
    
    exit_flags=[exitflag1,exitflag2];
else
    options = optimoptions('fminunc','Display','off');
    
    init_fun=randwalk(1,tau_cell,msd_cell,sem_cell);
    %if isundefined(init_fun)==0
    [D,~,exitflag1]=fminunc(@(D) randwalk(D,tau_cell,msd_cell,sem_cell),[1],options);
    %else
    %exitflag1=nan;
    %D=nan;
    %end
    RMC1 = D;
    P=[nan,nan];
    S=nan;
    exitflag2=nan;
    %[P,S,exitflag2]=fminunc(@(P) prandwalk(P,tau_cell,msd_cell,sem_cell),[1.1 1.1],options);
    
    pers=P(2);
    speed=P(1);
    
    exit_flags=[exitflag1,exitflag2];
    
%     [con_v,D,exitflag3]=fminunc(@(con_v,D) convective_randwalk(con_v,D,tau_cell,msd_cell,sem_cell),[200 1],options);
%     RMC2=D;
%     exit_flags=[exitflag1,exitflag2,exitflag3];

    
end

end

function F=prandwalk(P,t,msd,sem)
fit=2*P(1)^2*P(2).*(t-P(2).*(1-exp(-t./P(2))));
F=sum((1./sem.^0.5).*(msd-fit).^2);
end

function F=randwalk(D,t,msd,sem)
fit=4*D*t;
F=sum((1./(sem+.000001).^0.5).*(msd-fit).^2);
end

function F=convective_randwalk(convective_v,D,t,msd,sem)
fit=convective_v^2*t.^2+4*D*t;
F=sum((1./(sem+.000001).^0.5).*(msd-fit).^2);
end