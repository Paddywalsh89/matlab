%25/02/16 
%%R0 - Untouched movav - before I changed to get rid of snooping, and look back instead

%%22/02/16
%sum=sum+temp(i+j) changed as MT4 cannot know the value of temp(2) as this
%is in the future. temp(i-j) changes the lookback direction on the MA. 
%function ma=movav(s,n,w,shift)
%% 1. Populate test values 
s=[1 7 1 4 4 7 1];
n=7; 
w=3;
shift=1;
%Function to compute the average of the input elements
%in window w.
for i=1:n+w
temp(i)=0.0;
end
for i=1:n
temp(i+floor(shift*w))=s(i);
end

for i=1:n
sum=0.0;
for j=1:w
    %sum=sum+temp(i-j);
    sum=sum+temp(i+j);
end
ma(i)=sum/w
end

 
 
 