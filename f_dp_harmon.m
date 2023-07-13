
% Input:
%   data (subject, feature)
%   L (subject, number of components), subject loadings extracted by ICA
%   Index_Site, the lables of components that significantly related to site effectts
%   covariates (subject, number of signals of interest)

% Output:
%    X_ICADP, harmonized data by ICA-DP


function X_ICADP = f_dp_harmon(data, L, Index_Site, covariates)



Signal = covariates - mean(covariates);

L = L - mean(L);



%%%%%% the first projection for regressing out signals of interest from 
%%%%%% site effects-related loadings 

Effects_DP = L(:,Index_Site) - Signal*pinv(Signal)*L(:,Index_Site);

%%%%%% the second projection for regressing out site effects from 
%%%%%% multi-site MRI data while preserving the signals of interest 

Proj_DP = eye(size(L,1))-Effects_DP*pinv(Effects_DP);

X_ICADP = Proj_DP*data;      %%%% ICA-DP harmonized data


end