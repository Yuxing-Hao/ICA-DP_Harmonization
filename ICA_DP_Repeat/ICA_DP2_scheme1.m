
%%%% Data Preparation
%%%% non-harmonized data: X, with size subject*voxels
%%%% variables: Site, Signal

R = size(A,2);

p_site_KW = zeros(1, R);

for i = 1:R

    p_site_KW(i) = kruskalwallis(A(:,i), Site, 'off');  % Kruskal-Wallis test

end

[~, ~, ~, p_site_fdr]=fdr_bh(p_site_KW);


Index_Site = find(p_site_fdr<0.05);

Q = categorical(Signal);
Q = dummyvar({Q});

P = Q*inv(Q'*Q)*Q';

L_Site = A(:,Index_Site);

L_Site = (eye(length(P))-P)*L_Site; %%%% correct procedure


P_L = L_Site*pinv(L_Site);

X_har = (eye(length(P_L))-P_L)*X;
