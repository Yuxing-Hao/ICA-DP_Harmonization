clear;clc; 
close all;
%%

load('Var_Sim.mat');

%%%%% Var_Sim contains L, Site, Age, and HC_ASD

%%%%% L is the simulated subject loadings extracted by ICA

%%%%% Site denotes site effects variable to be removed
%%%%% Age and HC_ASD denote signals of interest

NumSub = length(Age); 

R = size(L,2);

M = 1000;
S = randn(R,M);

X = L*S;


Mean_X = mean(X,1);

X_NonHar = X - Mean_X; %%%% non-harmonized data

%%
count = 0;

for r = 1:R

    P_Site(r) = anova1(L(:,r),Site,'off');

    if P_Site(r) < 0.05/R
        count = count+1;
        Index_Site(count) = r;
    end

end

%%

covariates = [Age, HC_ASD];

X_ICADP = f_dp_harmon(X_NonHar, L, Index_Site, covariates);

X_ICADP = X_ICADP + Mean_X; %%%%% adding back the mean


