fontSize = 14

data_num = readmatrix('COMBINED_1_SCALABILITY_SAMPLES.csv');


% plotNum = 1 : Message Signing
% plotNum = 2 : Message Verifying
plotNum = 1

% ************************************* SIGNING

if plotNum == 1
    legend_pos = 'NorthWest';
    %legend_pos = 'SouthEast';
    
    titles = []
    c = []
    string(titles);
    string(c);
    titles = ["Dilithium 2" "Dilithium 3" "Dilithium 5" "Falcon 512" "Falcon 1024" "SPHINCS+ Haraka" "SPHINCS+ SHA-256" "SPHINCS+ SHAKE-256"] % "SPHINCS+ Haraka 128f robust" "SPHINCS+ Haraka 128f simple" "SPHINCS+ Haraka 128s robust" "SPHINCS+ Haraka 128s simple" "SPHINCS+ Haraka 192f robust" "SPHINCS+ Haraka 192f simple" "SPHINCS+ Haraka 192s robust" "SPHINCS+ Haraka 192s simple" "SPHINCS+ Haraka 256f robust" "SPHINCS+ Haraka 256f simple" "SPHINCS+ Haraka 256s robust" "SPHINCS+ Haraka 256s simple" "SPHINCS+ SHA256 128f robust" "SPHINCS+ SHA256 128f simple" "SPHINCS+ SHA256 128s robust" "SPHINCS+ SHA256 128s simple" "SPHINCS+ SHA256 192f robust" "SPHINCS+ SHA256 192f simple" "SPHINCS+ SHA256 192s robust" "SPHINCS+ SHA256 192s simple" "SPHINCS+ SHA256 256f robust" "SPHINCS+ SHA256 256f simple" "SPHINCS+ SHA256 256s robust" "SPHINCS+ SHA256 256s simple" "SPHINCS+ SHAKE256 128f robust" "SPHINCS+ SHAKE256 128f simple" "SPHINCS+ SHAKE256 128s robust" "SPHINCS+ SHAKE256 128s simple" "SPHINCS+ SHAKE256 192f robust" "SPHINCS+ SHAKE256 192f simple" "SPHINCS+ SHAKE256 192s robust" "SPHINCS+ SHAKE256 192s simple" "SPHINCS+ SHAKE256 256f robust" "SPHINCS+ SHAKE256 256f simple" "SPHINCS+ SHAKE256 256s robust" "SPHINCS+ SHAKE256 256s simple"];
    c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];
    
    syms d2(x) d3(x) d4(x) f512(x) f1024(x) shar(x) ssha(x) sshake(x)
    d2(x) = @(x) 2.275e-15*x^2 + 5.045e-06*x + 0.1974;
    d3(x) = @(x) 2.262e-15*x^2 + 5.037e-06*x + 0.2897;
    d4(x) = @(x) 2.217e-15*x^2 + 5.045e-06*x + 0.3375;
    f512(x) = @(x) 2.276e-15*x^2 + 5.039e-06*x + 0.4087;
    f1024(x) = @(x) 2.207e-15*x^2 + 5.039e-06*x + 0.698;
    shar(x) = @(x) 2.26e-15*x^2 + 2.752e-06*x + 7.664;
    ssha(x) = @(x) 2.207e-15*x^2 + 1.213e-06*x + 36.93;
    sshake(x) = @(x) 5.689e-17*x^2 + 1.029e-05*x + 83.9;
    
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
%         disp(titles(i))
%         cftool
%         disp("FINISHED ITERATION")
%         pause;
        if i == 1
            fplot(d2, '--', 'color', 'black');
        elseif i == 2
            fplot(d4, '--', 'color', 'black');
        elseif i == 3
            fplot(f512, '--', 'color', 'black');
        elseif i == 4
            fplot(f1024, '--', 'color', 'black');
        elseif i == 5
            fplot(shar, '--', 'color', 'black');
        elseif i == 6
            fplot(sshake, '--', 'color', 'black');
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
    
elseif plotNum == 2
    % ************************************* VERIFYING
    
    legend_pos = 'NorthWest';
    %legend_pos = 'SouthEast';
    
    
    titles = []
    c = []
    string(titles);
    string(c);
    titles = ["Dilithium 2" "Dilithium 3" "Dilithium 5" "Falcon 512" "Falcon 1024" "SPHINCS+ Haraka" "SPHINCS+ SHA-256" "SPHINCS+ SHAKE-256"];
    c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];
    
    syms d2(x) d4(x) f512(x) f1024(x) shar(x) ssha(x) sshake(x)
    d2(x) = @(x) 2.294e-15*x^2 + 5.043e-06*x + 0.05107;
    d3(x) = @(x) 2.276e-15*x^2 + 5.035e-06*x + 0.08682;
    d4(x) = @(x) 2.17e-15*x^2 + 5.041e-06*x + 0.1377;
    f512(x) = @(x) 2.23e-15*x^2 + 5.036e-06*x + 0.05265;
    f1024(x) = @(x) 2.237e-15*x^2 + 5.035e-06*x + 0.104;
    shar(x) = @(x) 2.286e-15*x^2 + 1.396e-06*x + 0.448;
    ssha(x) = @(x) 2.196e-15*x^2 + 6.317e-07*x + 2.847;
    sshake(x) = @(x) 1.831e-15*x^2 + 5.122e-06*x + 10.93;
    
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
%         disp(titles(i));
%         cftool;
%         pause;
        if i == 1
            fplot(d2, '--', 'color', 'black');
        elseif i == 2
            fplot(d4, '--', 'color', 'black');
        elseif i == 3
            fplot(f512, '--', 'color', 'black');
        elseif i == 4
            fplot(f1024, '--', 'color', 'black');
        elseif i == 5
            fplot(shar, '--', 'color', 'black');
        elseif i == 6
            fplot(sshake, '--', 'color', 'black');
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
end