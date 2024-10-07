

    function F=prandwalk(P,t,msd,sem)
        fit=2*P(1)^2*P(2).*(t-P(2).*(1-exp(-t./P(2))));
        F=sum((1./sem.^0.5).*(msd-fit).^2);
    end



