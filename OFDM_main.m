
clear
close all
clc
if ~exist('.\data')
    mkdir('.\data');
end
signal=rand(1,32);
pilot=ones(1,32);
save('.\data\signal.mat','signal')
save('.\data\pilot.mat','pilot')
%varargin=[];
%varargout = OFDM(varargin);
