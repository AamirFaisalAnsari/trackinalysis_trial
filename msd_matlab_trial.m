clc
clear all
close all

load('track_formatted.mat')

displacement=[211.2115243	217.6799151	217.2870236	224.1306184	227.4002565	228.8526958	236.4840345	243.8063547	250.3738474	256.5491001	263.4526987	270.0380375	276.7247345	283.6712741	296.7258828	308.3933837	311.5343897	324.4759241	335.903138	346.1712499	358.6147766	373.6867202	386.172051	394.3506592	409.3669302	433.8350912	448.331805	478.0549472	497.7769387	521.7252741	545.0804031	578.7434841	613.7308342	645.6129758	691.324317	733.8314948	775.525222	851.2414975	921.5443328	1032.187131	1112.369236	1261.364062	1401.000411	1643.894417	1968.931792	2485.500161	3258.523358	4932.547441	NaN	NaN];

SPACE_UNITS = 'µm';
TIME_UNITS = 's';

N_PARTICLES = 10;
N_TIME_STEPS = 100;
N_DIM = 2; % 2D

% Typical values taken from studies of proteins diffusing in membranes:
% Diffusion coefficient
D  = 1e-3; % µm^2/s
% Time step between acquisition; fast acquisition!
dT = 0.05; % s,

% Area size, just used to disperse particles in 2D. Has no impact on
% analysis.
SIZE = 2; % µm


k = sqrt(2 * D * dT);

tracks=track_formatted;
ma = msdanalyzer(2, 'µm', 's');
ma = ma.addAll(tracks);

% Plot trajectories
[hps, ha] = ma.plotTracks;
ma.labelPlotTracks(ha);

ma = ma.computeMSD;
ma.msd

figure
ma.plotMSD;

%cla
%ma.plotMeanMSD(gca, true)

ma = ma.fitLogLogMSD(1);
ma.loglogfit


r2fits = ma.loglogfit.r2fit;
alphas = ma.loglogfit.alpha;

R2LIMIT = 0.8;

% Remove bad fits
bad_fits = r2fits < R2LIMIT;
fprintf('Keeping %d fits (R2 > %.2f).\n', sum(~bad_fits), R2LIMIT);
alphas(bad_fits) = [];

% T-test
%[htest, pval] = ttest(alphas, 1, 0.05, 'left');

% if ~htest
%     [htest, pval] = ttest(alphas, 1, 0.05);
% end

% Prepare string
str = { [ '\alpha = ' sprintf('%.2f ± %.2f (mean ± std, N = %d)', mean(alphas), std(alphas), numel(alphas)) ] };

% if htest
%     str{2} = sprintf('Significantly below 1, with p = %.2g', pval);
% else
%     str{2} = sprintf('Not significantly different from 1, with p = %.2g', pval);
% end

figure
hist(alphas);
box off
xlabel('\alpha')
ylabel('Frequency')

yl = ylim(gca);
xl = xlim(gca);
text(xl(2), yl(2)+2, str, ...
    'HorizontalAlignment', 'right', ...
    'VerticalAlignment', 'top', ...
    'FontSize', 16)
title('\alpha values distribution', ...
    'FontSize', 20)
ylim([0 yl(2)+2])