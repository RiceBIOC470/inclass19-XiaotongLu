%In class 19
%GB comments
1A 100
1B 100
1C 100
2. 80 No comments to address the question asked. 
Overall 95


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 
figure(1);
group=[placebo;treatment1;treatment2];
Group=group';
bar(Group);
hold on;
err_1=[];
err_2=[];
err_3=[];
[m,n]=size(placebo);
for i=1:n
    err1(i)=placebo(i)-mean(placebo);
    err_1=[err_1,err1(i)];
    err2(i)=treatment1(i)-mean(treatment1);
    err_2=[err_2,err2(i)];
    err3(i)=treatment2(i)-mean(treatment2);
    err_3=[err_3,err3(i)];
end
err=[err_1;err_2;err_3];
err=err';
numgroups=size(Group, 1); 
numbars=size(Group, 2); 
groupwidth=min(0.8,numbars/(numbars+1.5));
for i=1:numbars
      x=(1:numgroups)- groupwidth/2+(2*i-1)*groupwidth/(2*numbars);  % Aligning error bar with individual bar
      errorbar(x, Group(:,i), err(:,i),'k','linestyle','none');
end

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 
figure(2);
[p,table,stats]=anova1(group');
The treatment2 group showed significant difference with placebo group but the treatment1 group does not show significant 
difference with placebo group.
%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 
figure(3);
multcompare(stats)
Treatment2 group shows significant difference with placebo group.

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.
load('data.mat');
figure(4);
plot(xdat,ydat,'r.','MarkerSize',24)
hold on;
[coeff,~]=polyfit(xdat,ydat,1);
plot(xdat,polyval(coeff,xdat),'k-','LineWidth',3);
hold off;

figure(5);
plot(xdat,ydat,'r.','MarkerSize',24)
hold on;
[coeff,~]=polyfit(xdat,ydat,2);
plot(xdat,polyval(coeff,xdat),'k-','LineWidth',3);
hold off;

figure(6);
plot(xdat,ydat,'r.','MarkerSize',24)
hold on;
[coeff,~]=polyfit(xdat,ydat,3);
plot(xdat,polyval(coeff,xdat),'k-','LineWidth',3);
hold on;

figure(7);
plot(xdat,ydat2,'r.','MarkerSize',24)
hold on;
[coeff,~]=polyfit(xdat,ydat2,1);
plot(xdat,polyval(coeff,xdat),'k-','LineWidth',3);
hold off;

figure(8);
plot(xdat,ydat2,'r.','MarkerSize',24)
hold on;
[coeff,~]=polyfit(xdat,ydat2,2);
plot(xdat,polyval(coeff,xdat),'k-','LineWidth',3);
hold off;

figure(9);
plot(xdat,ydat2,'r.','MarkerSize',24)
hold on;
[coeff,~]=polyfit(xdat,ydat2,3);
plot(xdat,polyval(coeff,xdat),'k-','LineWidth',3);
hold on;
fit_out=fit(xdat',ydat2','poly2');
plot(fit_out,xdat,ydat2);
set(gca,'FontSize',24)
hold off
