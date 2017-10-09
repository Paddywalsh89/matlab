%% calc_Lexp (Blackledge, unpublished 2012)
function index=calc_LExp(data,N)
%Computation of the Lyapuov Exponent
%
for i=2:N-1
Ldata(i)=log(data(i))-log(data(i-1));
end
Ldata(N)=Ldata(N-1);
%Compute and return the index
index=sum(Ldata);
index=index/N;