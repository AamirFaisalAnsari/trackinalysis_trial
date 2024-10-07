

    function F=randwalk(D,t,msd,sem)
        fit=4*D*t;
        F=sum((1./sem.^0.5).*(msd-fit).^2);
    end

   

