function v=variance(s,w)
    sum=0.0;
    for i=1:w
        sum=sum+s(i);
    end
xBar=sum/w;
sum=0.0;
for i=1:w
    sum=sum + (s(i)-xBar)*(s(i)-xBar);
end
v=1/sqrt(sum/w);
 

 
 
 