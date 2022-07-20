fontSize = 14

legend_pos = 'NorthWest';
%legend_pos = 'SouthEast';

titles = []
c = []
string(titles);
string(c);

titles = ["Dilithium 2" "Dilithium 3" "Dilithium 4" "Falcon 512" "Falcon 1024" "Rainbow Ia Classic" "Rainbow IIIc Classic" "Rainbow Vc Classic"];
c = ["#8888FF" "#0000FF" "#000088" "#FF8888" "#FF0000" "#88FF88" "#00FF00" "#008800"];
fig = figure("Name", "Quantum");
axis square;
appended_lines = [];
appended_titles = strings([0]);
%xlabel("Mesage Length (bytes)", 'FontSize', fontSize);
ylabel("Qubit Cost", 'FontSize', fontSize);
set(gca, 'YGrid', 'on', 'XGrid', 'on');
hold on;

ylabel("Qubit Cost", 'FontSize', fontSize);
%oldy = [94 125 160 103 230 13.559585049638548 15.514091825649079 16.24921571720169];
y = [94 125 160 103 230 173.297 340.497 439.097];

% ylabel("Quantum Gate Cost", 'FontSize', fontSize);
% %oldy = [93.5169 124.517 159.517 102.517 229.517 4.45783 5.13521 5.38998];
% y = [46.6515 62.1515 79.6515 51.1515 114.651 86.3 169.9 219.2];

% DW No Annealing
% ylabel("DW Cost (without annealing)", 'FontSize', fontSize);
% y = [53.2061 69.1173 86.9734 57.838 122.497 93.7371 227.978 227.978];


% DW Annealing
% ylabel("DW Cost (annealing)", 'FontSize', fontSize);
% %oldy = [4.54329 4.82831 5.07517 4.63473 5.43808 7.06492 7.87696 8.17803];
% y = [6.55459 6.96578 7.32193 6.6865 7.84549 93.7371 227.978 227.978];

ba = bar(1, y(1));
bb = bar(2, y(2));
bc = bar(3, y(3));
bd = bar(4, y(4));
be = bar(5, y(5));
bf = bar(6, y(6));
bg = bar(7, y(7));
bh = bar(8, y(8));
set(ba, 'FaceColor', c(1));
set(bb, 'FaceColor', c(2));
set(bc, 'FaceColor', c(3));
set(bd, 'FaceColor', c(4));
set(be, 'FaceColor', c(5));
set(bf, 'FaceColor', c(6));
set(bg, 'FaceColor', c(7));
set(bh, 'FaceColor', c(8));
%text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
%text(1:length(y_slow),y_slow+offset,num2str(y_slow'),'vert','bottom','horiz','center', 'FontSize', 12); 
box off
set(gca,'xticklabel',titles);
xlim([-1 length(titles)]+1)
xticks(1:length(titles));
xtickangle(45);
%set(gca, 'YScale', 'log');
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
%axis square;

%legend([ba bb bc bd be bf bg bh], titles, 'Location', legend_pos, 'FontSize', 12);

