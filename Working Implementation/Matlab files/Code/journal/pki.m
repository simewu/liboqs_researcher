clear all

selection = 1;
% 1 for cert gen
%2 for cert ver

x = categorical({'RSA 3072','P256','Dilithium 2','Dilithium 3','Dilithium 5','Falcon 512','Falcon 1024','Sphincs-Haraka128f-robust','sphincssha256128frobust','sphincsshake256128frobust'});
x = reordercats(x,{'RSA 3072','P256','Dilithium 2','Dilithium 3','Dilithium 5','Falcon 512','Falcon 1024','Sphincs-Haraka128f-robust','sphincssha256128frobust','sphincsshake256128frobust'});

if selection == 1
    % 1 for cert gen
    y = [5.05 4.66 3.84 3.99 4.05 3.97 4.37 11.48 41.58 89.76];
    bar(x,y)
    ylabel('Certificate Generation Time (ms)','FontSize',18)
    text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
    %xlabel('Algorithms','FontSize',18)
    %set(gca, 'YScale', 'log');
    ylim([0 100])
elseif selection == 2
    %2 for cert ver
    y = [3.15 4.5 3.05 3.59 3.73 3.35 3.53 4.7 10.17 24.28];
    bar(x,y)
    ylabel('Certificate Verification Time (ms)','FontSize',18)
    %xlabel('Algorithms','FontSize',18)
    text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
    ylim([0 100])
end

    grid on
    grid minor
    axis square



% fontSize = 14
% legend_pos = "NorthWest";
% 
% NAMES = []
% x = [];
% c = [];
% string(x);
% string(NAMES);
% string(c);
% 
% fig = figure("Name", "Certificate Signing Time");
% x = ["Dilithium" "Falcon" "SPHINCS+"];
% c = ["#0000FF" "#FF0000" "#00FF00"];
% NAMES = ["Dilithium 2" "Dilithium 4" "Falcon 512" "Falcon 1024" "SPHINCS+Haraka128f-robust" "SPHINCS+Shake256-128f-robust"];
% y = [
%     3.84 3.97 11.48
% ];
% y_slow = [
%     4.05 4.37 89.76
% ];
% bslow = bar(y_slow, 'FaceColor', 'none');
% hold on
% ba = bar(1, y(1));
% bb = bar(2, y(2));
% bc = bar(3, y(3));
% set(ba, 'FaceColor', c(1));
% set(bb, 'FaceColor', c(2));
% set(bc, 'FaceColor', c(3));
% offset = 0.01
% text(1:length(y),y,num2str(y'),'vert','top','horiz','center', 'FontSize', 12); 
% text(1:length(y_slow),y_slow+offset,num2str(y_slow'),'vert','bottom','horiz','center', 'FontSize', 12); 
% box off
% set(gca, 'YGrid', 'on', 'XGrid', 'off')
% set(gca,'xticklabel',x);
% xtickangle(15);
% set(gca, 'YScale', 'log');
% ylabel("Certificate Generation Time (ms)", 'FontSize', fontSize);
% ylim([1 100]);
% ax = gca;
% ax.XAxis.FontSize = fontSize;
% ax.YAxis.FontSize = fontSize;
% axis([-0.5,3.6 0.0034573,38030]);
% axis square;
% 
% empty1 = bar(nan, 'FaceColor', 'none');
% empty2 = bar(nan, 'FaceColor', 'none');
% empty3 = bar(nan, 'FaceColor', 'none');
% legend([ba empty1 bb empty2 bc empty3], NAMES, 'Location', legend_pos, 'FontSize', 12);