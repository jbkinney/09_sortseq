clear all
close all
clc

load file_S3.mat
models_to_save = {};

% Record best CRP emats
x = crp_fullwt;
[zz, i] = max(x.Is);
best_crp_fullwt = x.emats(:,:,i);

x = crp_crpwt;
[zz, i] = max(x.Is);
best_crp_crpwt = x.emats(:,:,i);

x = crp_full150;
[zz, i] = max(x.Is);
best_crp_full150 = x.matrices(:,:,i);

x = crp_full500;
[zz, i] = max(x.Is);
best_crp_full500 = x.emats(:,:,i);

% Recrod best RNAP emats
x = rnap_fullwt;
[zz, i] = max(x.Is);
best_rnap_fullwt = x.emats(:,:,i);

x = rnap_rnapwt;
[zz, i] = max(x.Is);
best_rnap_rnapwt = x.emats(:,:,i);

x = rnap_full0;
[zz, i] = max(x.Is);
best_rnap_full0 = x.emats(:,:,i);

x = rnap_full150;
[zz, i] = max(x.Is);
best_rnap_full150 = x.emats(:,:,i);

x = rnap_full500;
[zz, i] = max(x.Is);
best_rnap_full500 = x.emats(:,:,i);

% Record best thermodynamic models
x = tau_fullwt;
[zz, i] = max(x.Is);
best_tau_fullwt.crp_emat = x.crp_emats(:,:,i);
best_tau_fullwt.rnap_emat = x.rnap_emats(:,:,i);
best_tau_fullwt.crp_shift = x.crp_shifts(i);
best_tau_fullwt.rnap_shift = x.rnap_shifts(i);
best_tau_fullwt.epsiloni = x.epsilonis(i);
best_tau_fullwt.Cc = x.Ccs(i);

x = tau_sixepsilonis_all;
[zz, i] = max(x.sumNIs);
best_tau_sixepsilonis.crp_emat = x.crp_emats(:,:,i);
best_tau_sixepsilonis.rnap_emat = x.rnap_emats(:,:,i);
best_tau_sixepsilonis.crp_shift = x.crp_shifts(i);
best_tau_sixepsilonis.rnap_shift = x.rnap_shifts(i);
best_tau_sixepsilonis.epsiloni_fullwt = x.epsilonis_fullwt(i);
best_tau_sixepsilonis.epsiloni_crpwt = x.epsilonis_crpwt(i);
best_tau_sixepsilonis.epsiloni_rnapwt = x.epsilonis_rnapwt(i);
best_tau_sixepsilonis.epsiloni_full500 = x.epsilonis_full500(i);
best_tau_sixepsilonis.epsiloni_full150 = x.epsilonis_full150(i);
best_tau_sixepsilonis.epsiloni_full0 = x.epsilonis_full0(i);
best_tau_sixepsilonis.Cc_fullwt = x.Ccs_fullwt(i);
best_tau_sixepsilonis.Cc_crpwt = x.Ccs_crpwt(i);
best_tau_sixepsilonis.Cc_rnapwt = x.Ccs_rnapwt(i);
best_tau_sixepsilonis.Cc_full500 = x.Ccs_full500(i);
best_tau_sixepsilonis.Cc_full150 = x.Ccs_full150(i);
best_tau_sixepsilonis.Cc_full0 = x.Ccs_full0(i);

x = tau_final_all;
[zz, i] = max(x.sumNIs);
best_tau_final_all.crp_emat = x.crp_emats(:,:,i);
best_tau_final_all.rnap_emat = x.rnap_emats(:,:,i);
best_tau_final_all.crp_shift = x.crp_shifts(i);
best_tau_final_all.rnap_shift = x.rnap_shifts(i);
best_tau_final_all.epsiloni = x.epsilonis(i);
best_tau_final_all.Cc_fullwt = x.Ccs_fullwt(i);
best_tau_final_all.Cc_crpwt = x.Ccs_crpwt(i);
best_tau_final_all.Cc_rnapwt = x.Ccs_rnapwt(i);
best_tau_final_all.Cc_full500 = x.Ccs_full500(i);
best_tau_final_all.Cc_full150 = x.Ccs_full150(i);
best_tau_final_all.Cc_full0 = x.Ccs_full0(i);

% Save best models + models from literature + lac promoter sequence
save best_models.mat best_crp_crpwt best_crp_full150 best_crp_full500 ...
    best_crp_fullwt best_crp_fullwt best_rnap_full0 best_rnap_full150 ...
    best_rnap_full500 best_rnap_fullwt best_rnap_rnapwt best_tau_fullwt ...
    best_tau_sixepsilonis best_tau_final_all crp_gunasekera crp_nagaraj ...
    crp_robison rnap_harley rnap_kiryu rnap_lisser wt_lac_promoter