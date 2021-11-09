%%
clear all
load('results.mat')
figure(1)
hist(AngleDiff,2)
figure(2)
hist(HypoDiff,10)