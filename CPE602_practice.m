% clear all;
close all;
clc;

% chinese remainder theorem
% m1,m2,m3 should be pairwise relatively prime
a1 = 14; % remainder 1
m1 = 31; % divisor 1
a2 = 16;
m2 = 32;
a3 = 18;
m3 = 33;

m = m1*m2*m3;
M1 = m/m1;
M2 = m/m2;
M3 = m/m3;
y1 = inverse_of_mod(M1,m1);
y2 = inverse_of_mod(M2,m2);
y3 = inverse_of_mod(M3,m3);
x_r = mod(a1*M1*y1+a2*M2*y2+a3*M3*y3,m); % the smallest number
syms n integer;
x = m*n+x_r % x_r mod m
% x = factorial(n); % n!
% x = nchoosek(5,3); % C(3,5) 求组合数
% x = prod(3:5); % A(3,5) 求排列数

function [d c c1] = inverse_of_mod(M,m)
% inverse of mod
a = M;
b = m;
r(1,1) = b;
r(1,2) = floor(a/b);
r(1,3) = mod(a,b);
i = 1;
while r(i,3)~=1
    r(i+1,1) = r(i,3);
    r(i+1,2) = floor(r(i,1)/r(i,3)); % quotient
    r(i+1,3) = mod(r(i,1),r(i,3)); % remainder
    i = i+1;
end
s(1,1) = 1*1;
s(1,2) = -r(i,2);
j = 2;
while i~=1
    s(j,1) = 1*s(j-1,2);
    s(j,2) = -r(i-1,2)*s(j-1,2)+s(j-1,1);
    i = i-1;
    j = j+1;
end

if s(j-1,1)<0
    d = b+s(j-1,1);
else
    d = s(j-1,1);
end
syms n integer;
c = b*n+d;
c1=subs(c,n,-3:1:3);
end

% inverse of mod
%{
a = 4;
b = 9;
r(1,1) = b;
r(1,2) = floor(a/b);
r(1,3) = mod(a,b);
i = 1;
while r(i,3)~=1
    r(i+1,1) = r(i,3);
    r(i+1,2) = floor(r(i,1)/r(i,3)); % quotient
    r(i+1,3) = mod(r(i,1),r(i,3)); % remainder
    i = i+1;
end
s(1,1) = 1*1;
s(1,2) = -r(i,2);
j = 2;
while i~=1
    s(j,1) = 1*s(j-1,2);
    s(j,2) = -r(i-1,2)*s(j-1,2)+s(j-1,1);
    i = i-1;
    j = j+1;
end
if s(j-1,1)<0
    d = b+s(j-1,1);
else
    d = s(j-1,1);
end
syms n integer;
c = b*n+d
c1=subs(c,n,-3:1:3)
%}




















