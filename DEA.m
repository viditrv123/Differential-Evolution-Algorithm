%% DEA Rastrigen
clear all; clc;
format short
% INITIALIZATION
D=2;
NP=50;
F=0.5;
CR=0.7;
IT=50;
G_max=200;
Run=1;
X_max=[5.12,5.12];
X_min=[-5.12,-5.12];

    for m=1:50
        for n=1:D
            X(m,n)=X_min(n) + rand()*(X_max(n)-X_min(n));
        end
    end


% POPULATION GENERATED

% MUTATION TIME


for p=1:G_max
    for i=1:NP
        r0=randi(50,1);
        r1=randi(50,1);
        r2=randi(50,1);
        while r0==i
            r0=floor(rand*NP);
            if r0==0
                r0=1;
            end
        end
        while r1==r0 || r1==i
            r1=floor(rand*NP);
            if r1==0
                r1=1;
            end
        end
        while r2==r1 || r2==r0 || r2==i
            r2=floor(rand*NP);
            if r2==0
                r2=1;
            end
        end
        jrand=floor(D*rand);
        
        % Mutation
        
        for j=1:D
                U(i,j)=X(r0,j)+F*(X(r1,j)-X(r2,j));
                if(U(i,j)>5.12)
                    U(i,j)=5.12;
                end
                if(U(i,j)<-5.12)
                    U(i,j)=-5.12;
                end

        end
        
        % Crossover
        
        for j=1:D
            if rand <= CR || j==jrand
                continue;
            else
                U(i,j)=X(i,j);
            end
        end
    end
    
    %Selection
    
    for i=1:NP
        if Rastrigen(U(i,:))<=Rastrigen(X(i,:))
            X(i,:)=U(i,:); 
        end
    end
    FX = Rastrigen(X);
    [minfx, ind_fx] = min(FX);
    X(ind_fx,:)
    Rastrigen(X(ind_fx,:))
    a(1,p)=minfx;
    b(1,p)=p;
end
plot(b,a);
