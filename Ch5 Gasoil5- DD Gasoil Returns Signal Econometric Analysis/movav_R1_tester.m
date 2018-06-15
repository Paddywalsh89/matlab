%25/02/16 
%%R1 - I changed R0 to get rid of snooping, and look back instead

%sum=sum+temp(i+j) changed as MT4 cannot know the value of temp(2) as this
%is in the future. temp(i-j) changes the lookback direction on the MA. 
function ma=movav_R1(s,n,w,shift)

%% 1. Populate test values 
s=[1 7 1 4 4 7 1];
n=7; 
w=3;
shift=0;
%Function to compute the average of the input elements
%in window w.
for i=1:n+w
temp(i)=0.0;
end
for i=1:n
temp(i+floor(shift*w))=s(i);
end
sum=0;
for i=1:w
    sum = sum + temp(i);
    ma(i)= sum/w;
end
for i=w:n    
sum=0.0;

for j=0:w-1; 
    sum=sum+temp(i-j);   
end

ma(i)=sum/w;
end

 
 
 