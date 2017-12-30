function []=calcu(input,T,fc,a1,d1,np,nc,dnum,handles)
%CALCU Summary of this function goes here
clc
%T=1;%us
%n=ceil(2*T*fc);%n>2*T*fc
n=ceil(50*fc*T);
tau=T/n;
%{
fc=100;%MHZ
a1=[0.5 0.4 0.35 0.3];
d1=[0 1.5 2.5 3]*T;
%path='S:\grade three\fall semester\course\Signals and Systems\pro2\figures\';
%}

%%
%Block 1

M=ceil(np*0.25);
if mod(np+M,2)==1
    M=M-mod(M,2)-1;
else
    M=M-mod(M,2);
end

[xcp,nl]=block1(input,M,T,np,nc,handles);
%%
%Block 3 DAC + Transmitter RF Front-End


%w=2*pi*fc;
strf=block3(xcp,T,n,fc,tau,handles);



%%
% Actual Wireless Channel

denum=d1*n;
sawc=antenna(strf,a1,denum,tau,T,handles);


%%
%Block 4  Receiver RF Front End + ADC 
xadc=Block4(sawc,a1,denum,tau,T,fc,n,handles);


%%
%Block 2
pilot=input(1:np);
Block2(xadc,M,T,handles,np,nc,dnum,pilot);


%{
Statement:
Due to channel gain need to be calculate "outside",
cannot accomplish Block 2 in this function.
See the remaining part outside.
%}


