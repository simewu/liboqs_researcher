clear all;

fontSize = 14

data_num = readmatrix('SAMPLE_10_8i6Fr27Hwm.csv');


% ************************************* SIGNING

legend_pos = 'NorthWest';
%legend_pos = 'SouthEast';


titles = []
c = []
string(titles);
string(c);
titles = ["Dilithium 2" "Dilithium 3" "Dilithium 4" "Falcon 512" "Falcon 1024" "Rainbow Ia Cyclic" "Rainbow Ia Classic" "Rainbow Vc Cyclic"];
c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];

syms d2(x) d3(x) d4(x) f512(x) f1024(x) ria(x) riac(x) rvc(x)
d2(x) = @(x) 1.845e-15*x^2 + 3.215e-06*x + 0.09799;
d3(x) = @(x) 1.767e-15*x^2 + 3.225e-06*x + 0.1398;
d4(x) = @(x) 1.865e-15*x^2 + 3.216e-06*x + 0.1384;
f512(x) = @(x) 1.783e-15*x^2 + 3.233e-06*x + 3.923;
f1024(x) = @(x) 1.859e-15*x^2 + 3.216e-06*x + 8.4;
ria(x) = @(x) 1.802e-15*x^2 + 5.265e-07*x + 1.14;
riac(x) = @(x) 1.792e-15*x^2 + 5.311e-07*x + 1.146;
rvc(x) = @(x) 1.463e-15*x^2 + 1.181e-06*x + 19.23;

% Minimum intersection, x=387578

fig = figure("Name", "Message Lengths");
axis square;
appended_lines = [];
appended_titles = strings([0]);
xlabel("Mesage Length (Bytes)", 'FontSize', fontSize);
ylabel("Signing Time (ms)", 'FontSize', fontSize);
set(gca, 'YGrid', 'on', 'XGrid', 'on');
hold on;
x = [0 1 10 100 1000 10000 100000 1000000 10000000 100000000];
for i=1:length(titles)
    sign_y = data_num(i, 4:4:end-1).';
    p = plot(x(1:end), sign_y(1:end), '.', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    nan_p = plot(nan, nan, '.-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    appended_lines(end+1) = nan_p;
    appended_titles(end+1) = titles(i);
    %disp(titles(i));
    %cftool;
    %pause;
    if i == 1
        fplot(d2, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 2
        fplot(d3, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 3
        fplot(d4, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 4
        fplot(f512, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 5
        fplot(f1024, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 6
        fplot(ria, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 7
        fplot(riac, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 8
        fplot(rvc, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    end
    
end
xticks(x);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
axis([1 100000000 0.02,74770])
legend(appended_lines, appended_titles, 'Location', legend_pos, 'FontSize', 11);

%pause;

% ************************************* VERIFYING

legend_pos = 'NorthWest';
%legend_pos = 'SouthEast';


titles = []
c = []
string(titles);
string(c);
titles = ["Dilithium 2" "Dilithium 3" "Dilithium 4" "Falcon 512" "Falcon 1024" "Rainbow Ia Cyclic" "Rainbow Ia Classic" "Rainbow Vc Cyclic"];
c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];

syms d2(x) d4(x) f512(x) f1024(x) ria(x) riac(x) rvc(x)
d2(x) = @(x) 1.865e-15*x^2 + 3.213e-06*x + 0.02525;
d3(x) = @(x) 1.815e-15*x^2 + 3.221e-06*x + 0.04121;
d4(x) = @(x) 1.902e-15*x^2 + 3.211e-06*x + 0.05348;
f512(x) = @(x) 1.848e-15*x^2 + 3.225e-06*x + 0.03987;
f1024(x) = @(x) 1.867e-15*x^2 + 3.215e-06*x + 0.08054;
ria(x) = @(x) 1.915e-15*x^2 + 5.135e-07*x + 1.271;
riac(x) = @(x) 1.939e-15*x^2 + 5.143e-07*x + 1.129;
rvc(x) = @(x) 1.915e-15*x^2 + 1.135e-06*x + 22.67;

% Minimum intersection, x=461478

fig = figure("Name", "Message Lengths");
axis square;
appended_lines = [];
appended_titles = strings([0]);
xlabel("Mesage Length (Bytes)", 'FontSize', fontSize);
ylabel("Verifying Time (ms)", 'FontSize', fontSize);
set(gca, 'YGrid', 'on', 'XGrid', 'on');
hold on;
x = [0 1 10 100 1000 10000 100000 1000000 10000000 100000000];
for i=1:length(titles)
    x = [0 1 10 100 1000 10000 100000 1000000 10000000 100000000];
    verify_y = data_num(i, 5:4:end).';
    p = plot(x(1:end), verify_y(1:end), '.', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    nan_p = plot(nan, nan, '.-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    appended_lines(end+1) = nan_p;
    appended_titles(end+1) = titles(i);
    %disp(titles(i));
    %cftool;
    %pause;
    if i == 1
        fplot(d2, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 2
        fplot(d3, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 3
        fplot(d4, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 4
        fplot(f512, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 5
        fplot(f1024, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 6
        fplot(ria, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 7
        fplot(riac, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    elseif i == 8
        fplot(rvc, '-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    end
end
xticks(x);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
axis([1 100000000 0.02,74770])
legend(appended_lines, appended_titles, 'Location', legend_pos, 'FontSize', 11);
