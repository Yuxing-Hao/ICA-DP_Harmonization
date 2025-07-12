
%%%% Data Preparation
%%%% non-harmonized data: X, with size subject*voxels
%%%% variables: Site, Signal

R = size(A,2);

p_site_KW = zeros(1, R);
p_signal_KW = zeros(1, R);

for i = 1:R

    p_site_KW(i) = kruskalwallis(A(:,i), Site, 'off');  % Kruskal-Wallis test
    p_signal_KW(i) = kruskalwallis(A(:,i), Signal, 'off');

end

[~, ~, ~, p_site_fdr]=fdr_bh(p_site_KW);
[~, ~, ~, p_signal_fdr]=fdr_bh(p_signal_KW);

Index_Site = find(p_site_fdr<0.05);

Index_Signal = find(p_signal_fdr<0.05);


Index_Site_mix = intersect(Index_Site,Index_Signal);

Index_Site_pure = setdiff(Index_Site,Index_Site_mix);

Q = categorical(Signal);
Q = dummyvar({Q});

P = Q*inv(Q'*Q)*Q';

L_Site = A(:,Index_Site_mix);

L_Site = (eye(length(P))-P)*L_Site; %%%% correct procedure

L_Site = [L_Site,A(:,Index_Site_pure)];

P_L = L_Site*pinv(L_Site);

X_har = (eye(length(P_L))-P_L)*X;
