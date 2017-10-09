function gamma=Levyindex(data,N)
%Computation of the Levy index
%using the least squares algorithm.
%
%Compute the logarithm of the
%data for the first half segment.
for i=1:N
ydata(i)=log(data(i));
xdata(i)=log(i);
end
%Compute each term of the
%least squares formula.
term1=sum(ydata).*sum(xdata);
term2=sum(ydata.*xdata);
term3=sum(xdata)^2;
term4=sum(xdata.^2);
%Compute and return the Levy index
gamma=(term1-(N*term2))/(term3-(N*term4));
 