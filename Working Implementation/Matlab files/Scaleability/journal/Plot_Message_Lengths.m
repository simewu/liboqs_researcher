fontSize = 14

data_num = readmatrix('COMBINED_1_SCALABILITY_SAMPLES.csv');


% ************************************* SIGNING

legend_pos = 'NorthWest';
%legend_pos = 'SouthEast';


titles = []
c = []
string(titles);
string(c);
titles = ["Dilithium 2" "Dilithium 3" "Dilithium 5" "Falcon 512" "Falcon 1024"] % "SPHINCS+ Haraka 128f robust" "SPHINCS+ Haraka 128f simple" "SPHINCS+ Haraka 128s robust" "SPHINCS+ Haraka 128s simple" "SPHINCS+ Haraka 192f robust" "SPHINCS+ Haraka 192f simple" "SPHINCS+ Haraka 192s robust" "SPHINCS+ Haraka 192s simple" "SPHINCS+ Haraka 256f robust" "SPHINCS+ Haraka 256f simple" "SPHINCS+ Haraka 256s robust" "SPHINCS+ Haraka 256s simple" "SPHINCS+ SHA256 128f robust" "SPHINCS+ SHA256 128f simple" "SPHINCS+ SHA256 128s robust" "SPHINCS+ SHA256 128s simple" "SPHINCS+ SHA256 192f robust" "SPHINCS+ SHA256 192f simple" "SPHINCS+ SHA256 192s robust" "SPHINCS+ SHA256 192s simple" "SPHINCS+ SHA256 256f robust" "SPHINCS+ SHA256 256f simple" "SPHINCS+ SHA256 256s robust" "SPHINCS+ SHA256 256s simple" "SPHINCS+ SHAKE256 128f robust" "SPHINCS+ SHAKE256 128f simple" "SPHINCS+ SHAKE256 128s robust" "SPHINCS+ SHAKE256 128s simple" "SPHINCS+ SHAKE256 192f robust" "SPHINCS+ SHAKE256 192f simple" "SPHINCS+ SHAKE256 192s robust" "SPHINCS+ SHAKE256 192s simple" "SPHINCS+ SHAKE256 256f robust" "SPHINCS+ SHAKE256 256f simple" "SPHINCS+ SHAKE256 256s robust" "SPHINCS+ SHAKE256 256s simple"];
c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];

syms d2(x) d3(x) d4(x) f512(x) f1024(x) ria(x) riac(x) rvc(x)
d2(x) = @(x) 1.929e-15*x^2 + 3.115e-06*x + 0.104;
d3(x) = @(x) 3e-15*x^2 + 3.115e-06*x + 0.104;
d4(x) = @(x) 1.926e-15*x^2 + 3.104e-06*x + 0.1397;
f512(x) = @(x) 1.979e-15*x^2 + 3.099e-06*x + 3.773;
f1024(x) = @(x) 1.942e-15*x^2 + 3.1e-06*x + 8.082;
ria(x) = @(x) 1.846e-15*x^2 + 4.994e-07*x + 1.099;
riac(x) = @(x) 2.846e-15*x^2 + 4.994e-07*x + 1.099;
rvc(x) = @(x) 1.553e-15*x^2 + 1.136e-06*x + 18.64;

% Minimum intersection, x=380405

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
    p = plot(x(1:end), sign_y(1:end), '.-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    appended_lines(end+1) = p;
    appended_titles(end+1) = titles(i);
    %disp(titles(i))
    %cftool
    %disp("FINISHED ITERATION")
    %pause;
    if i == 1
        fplot(d2, '--', 'color', 'black');
    elseif i == 2
        fplot(d4, '--', 'color', 'black');
    elseif i == 3
        fplot(f512, '--', 'color', 'black');
    elseif i == 4
        fplot(f1024, '--', 'color', 'black');
    elseif i == 5
        fplot(ria, '--', 'color', 'black');
    elseif i == 6
        fplot(rvc, '--', 'color', 'black');
    end
    
end
xticks(x);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
axis([1 100000000 0.01 34143.34])
legend(appended_lines, appended_titles, 'Location', legend_pos, 'FontSize', 11);

pause

% ************************************* VERIFYING

legend_pos = 'NorthWest';
%legend_pos = 'SouthEast';


titles = []
c = []
string(titles);
string(c);
titles = ["Dilithium 2" "Dilithium 3" "Dilithium 4" "Falcon 512" "Falcon 1024" "Rainbow Ia Cyclic" "Rainbow-Ia-Classic" "Rainbow Vc Cyclic"];
c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];

syms d2(x) d4(x) f512(x) f1024(x) ria(x) riac(x) rvc(x)
d2(x) = @(x) 1.929e-15*x^2 + 3.115e-06*x + 0.03062;
d3(x) = @(x) 2.929e-15*x^2 + 3.115e-06*x + 0.03062;
d4(x) = @(x) 1.959e-15*x^2 + 3.102e-06*x + 0.06278;
f512(x) = @(x) 2.031e-15*x^2 + 3.094e-06*x + 0.03726;
f1024(x) = @(x) 2.036e-15*x^2 + 3.089e-06*x + 0.07483;
ria(x) = @(x) 1.913e-15*x^2 + 4.91e-07*x + 1.227;
riac(x) = @(x) 2.913e-15*x^2 + 4.91e-07*x + 1.227;
rvc(x) = @(x) 1.926e-15*x^2 + 1.096e-06*x + 21.97;

% Minimum intersection, x=455936

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
    p = plot(x(1:end), verify_y(1:end), '.-', 'LineWidth', 2, 'MarkerSize', 20, 'Color', c(i));
    appended_lines(end+1) = p;
    appended_titles(end+1) = titles(i);
    %disp(titles(i));
    %cftool;
    %pause;
    if i == 1
        fplot(d2, '--', 'color', 'black');
    elseif i == 2
        fplot(d4, '--', 'color', 'black');
    elseif i == 3
        fplot(f512, '--', 'color', 'black');
    elseif i == 4
        fplot(f1024, '--', 'color', 'black');
    elseif i == 5
        fplot(ria, '--', 'color', 'black');
    elseif i == 6
        fplot(rvc, '--', 'color', 'black');
    end
end
xticks(x);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
axis([1 100000000 0.01 34143.34])
legend(appended_lines, appended_titles, 'Location', legend_pos, 'FontSize', 11);
