# ICA-DP_Harmonization
Harmonization of multi-site MRI data with dual-projection based on ICA 
## Introduction 
While combing the multi-site MRI data has great convenience that enhances the statistical results and obviates some of the shortcomings of single-site study, the site effects comes naturally, confounding the MRI data analysis and making the results hard to interpret. We proposed a dual-projection data-driven method based on ICA to eliminate the site effects and preserve the signal of interest. 
## Input and Output
Input:  
**X**, Data matrix with two dimensions of (subject, feature).  
**L**, subject loadings extracted by ICA.  
**Site_Index**, the labels of components that significantly related to site effects.  
**Covariates**, signals of interest to be preserved, e.g., age, gender or variables refer to disease.  

Output:  
**X_ICADP**, the harmonized data by ICA-DP
## References
Hao, Yuxing and Xu, Huashuai and Xia, Mingrui and Yan, Chenwei and Zhang, Yunge and Zhou, Dongyue and Karkkainen, Tommi and Nickerson, Lisa D and Li, Huanjie and Cong, Fengyu. (2023). Removal of site effects and enhancement of signal using dual projection independent component analysis for pooling multi-site MRI data. European Journal of Neuroscience, 58(6), 3466–3487. https://doi.org/10.1111/ejn.16120 

Xu, Huashuai and Hao, Yuxing and Zhang, Yunge and Zhou, Dongyue and Karkkainen, Tommi and Nickerson, Lisa D and Li, Huanjie and Cong, Fengyu. (2023). Harmonization of multi-site functional MRI data with dual-projection based ICA model. Frontiers in Neuroscience, 17, 1225606. https://doi.org/10.3389/fnins.2023.1225606

