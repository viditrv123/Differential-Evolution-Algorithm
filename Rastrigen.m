%% Rastrigen
function y=Rastrigen(H)
A=10;
n=2;
m=0;
for i=1:n
    m=m+(H(i)^2)-A*cos(2*pi*H(i));
end

y=10*n+m;

end
