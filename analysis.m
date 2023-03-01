file = readtable('/Users/dianakazarian/Desktop/WV6_Data_csv_v20201117.csv', 'Delimiter', ';');
religion = file(:, {'C_COW_ALPHA', 'V2', 'V9', 'V19', 'V25', 'V41', 'V106', 'V107', 'V147', 'V152', 'V154', 'V156', 'V183', 'V211'});
armenia = religion(strcmp(religion.C_COW_ALPHA, 'ARM'), :);
azerbaijan = religion(strcmp(religion.C_COW_ALPHA, 'AZE'), :);
importance_religion_armenia = armenia.V9(ismember(armenia.V9, [1,2,3,4]));

importance_religion_azerbaijan = azerbaijan.V9(ismember(azerbaijan.V9, [1,2,3,4]));

[pvalue, ~, stats] = ranksum(importance_religion_armenia, importance_religion_azerbaijan, 'tail', 'both');
disp(['Mann-Whitney U test p-value: ', num2str(pvalue)]);
disp(['Mann-Whitney U test statistic: ', num2str(stats.ranksum)]);

fig = figure();
fig.Position(3:4) = [800 400];
ax1 = subplot(1, 2, 1);
counts_armenia = histcounts(importance_religion_armenia, 'BinLimits', [0.5 4.5], 'BinMethod', 'integers');
proportions_armenia = counts_armenia / sum(counts_armenia);
bar(ax1, 1:4, proportions_armenia, 'FaceColor', '#A8A8A8');
ax1.XTick = 1:4;
ax1.XTickLabels = {'Very', 'Rather', 'Not very', 'Not at all'};
ax1.Title.String = 'Armenia';
ax1.Title.FontAngle = 'italic';
ax1.Title.FontSize = 12;
ax1.YLabel.String = 'Proportion';
ax1.YLabel.FontAngle = 'italic';
ax1.XLabel.String = 'Importance';
ax1.XLabel.FontAngle = 'italic';
ax1.YLim = [0, max(proportions_armenia)*1.1]; % Set y-axis limits to extend slightly above the maximum proportion
ax2 = subplot(1, 2, 2);
counts_azerbaijan = histcounts(importance_religion_azerbaijan, 'BinLimits', [0.5 4.5], 'BinMethod', 'integers');
proportions_azerbaijan = counts_azerbaijan / sum(counts_azerbaijan);
bar(ax2, 1:4, proportions_azerbaijan, 'FaceColor', '#A8A8A8');
ax2.XTick = 1:4;
ax2.XTickLabels = {'Very', 'Rather', 'Not very', 'Not at all'};
ax2.Title.String = 'Azerbaijan';
ax2.Title.FontAngle = 'italic';
ax2.Title.FontSize = 12;
ax2.YLim = [0, max(proportions_armenia)*1.1];
ax2.YLabel.String = 'Proportion';
ax2.YLabel.FontAngle = 'italic';
ax2.XLabel.String = 'Importance';
ax2.XLabel.FontAngle = 'italic';
sgtitle('How important is religion in your life?');


wave7 = readtable('/Users/dianakazarian/Desktop/wave7.csv');
religion_wave7 = wave7.Q6;
%%
fig = figure;
fig.Position = [0 0 1200 500];

ax1 = subplot(1, 3, 1);
histogram(ax1, armenia_religion_wave3, 'BinWidth', 0.5, 'FaceColor', '#A8A8A8');
ax1.XTick = [1 2 3 4];
ax1.YLim = [0 950];
ax1.XTickLabel = {'Very', 'Rather', 'Not Very', 'Not At All'};
ax1.Title.String = '1997';
ax1.Title.FontSize = 12;
ax1.YLabel.String = 'Proportion';
ax1.YLabel.FontAngle = 'italic';
ax1.XLabel.String = 'Importance';
ax1.XLabel.FontAngle = 'italic';
ax1.Position = [0.07 0.15 0.25 0.7];

ax2 = subplot(1, 3, 2);
histogram(ax2, importance_religion_armenia, 'BinWidth', 0.5, 'FaceColor', '#A8A8A8');
ax2.XTick = [1 2 3 4];
ax2.YLim = [0 950];
ax2.XTickLabel = {'', '', '', ''};
ax2.Title.String = '2011';
ax2.Title.FontSize = 12;
ax2.YLabel.String = 'Proportion';
ax2.YLabel.FontAngle = 'italic';
ax2.XLabel.String = 'Importance';
ax2.XLabel.FontAngle = 'italic';

ax3 = subplot(1, 3, 3);
histogram(ax3, armenia_religion_wave7, 'BinWidth', 0.5, 'FaceColor', '#A8A8A8');
ax3.XTick = [1 2 3 4];
ax3.YLim = [0 950];
ax3.XTickLabel = {'', '', '', ''};
ax3.Title.String = '2021';
ax3.Title.FontSize = 12;
ax3.YLabel.String = 'Proportion';
ax3.YLabel.FontAngle = 'italic';
ax3.XLabel.String = 'Importance';
ax3.XLabel.FontAngle = 'italic';

% Set the XTickLabel property for the entire figure
xticklabels(ax1, {'Very', 'Rather', 'Not Very', 'Not At All'});

sgtitle('Armenia: How important is religion in your life?', 'FontSize', 16);
ax3.YLabel.FontAngle = 'italic';
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

