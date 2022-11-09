fontSize = 14
legend_pos = "NorthWest";

NAMES = []
x = [];
c = [];
string(x);
string(NAMES);
string(c)

fig = figure("Name", "Memory Allocation");
NAMES = ["Dilithium 2" "Dilithium 4" "Falcon 512" "Falcon-1024" "Rainbow Ia Cyclic" "Rainbow Vc Cyclic"];
x = ["Dilithium" "Falcon" "Rainbow"];
c = ["#0000FF" "#FF0000" "#00FF00"];
y = [
    0.0011 0.0021 0.0035
];
y_slow = [
    0.0016 0.0026 0.0243
];
bslow = bar(y_slow, 'FaceColor', 'none');
hold on
ba = bar(1, y(1));
bb = bar(2, y(2));
bc = bar(3, y(3));
set(ba, 'FaceColor', c(1));
set(bb, 'FaceColor', c(2));
set(bc, 'FaceColor', c(3));
offset = 0.01
text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
text(1:length(y_slow),y_slow+offset,num2str(y_slow'),'vert','bottom','horiz','center', 'FontSize', 12); 
box off
set(gca, 'YGrid', 'on', 'XGrid', 'off')
set(gca,'xticklabel',x);
xtickangle(15);
set(gca, 'YScale', 'log');
ylabel("Memory Allocation Time (ms)", 'FontSize', fontSize);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
axis([-0.5,3.6 0.0034573,38030]);
axis square;

empty1 = bar(nan, 'FaceColor', 'none');
empty2 = bar(nan, 'FaceColor', 'none');
empty3 = bar(nan, 'FaceColor', 'none');
legend([ba empty1 bb empty2 bc empty3], NAMES, 'Location', legend_pos, 'FontSize', 11);










fig = figure("Name", "Key generation");
NAMES = ["Dilithium 2" "Dilithium 4" "Falcon 512" "Falcon-1024" "Rainbow Ia Cyclic" "Rainbow Vc Cyclic"];
x = ["Dilithium" "Falcon" "Rainbow"];
c = ["#0000FF" "#FF0000" "#00FF00"];
y = [
    0.10 13.28 88.50
];
y_slow = [
    0.13 37.89 3200.42
];
bslow = bar(y_slow, 'FaceColor', 'none');
hold on
ba = bar(1, y(1));
bb = bar(2, y(2));
bc = bar(3, y(3));
set(ba, 'FaceColor', c(1));
set(bb, 'FaceColor', c(2));
set(bc, 'FaceColor', c(3));
offset = 0.01
text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
text(1:length(y_slow),y_slow+offset,num2str(y_slow'),'vert','bottom','horiz','center', 'FontSize', 12); 
box off
set(gca, 'YGrid', 'on', 'XGrid', 'off')
set(gca,'xticklabel',x);
xtickangle(15);
set(gca, 'YScale', 'log');
ylabel("Key Generation Time (ms)", 'FontSize', fontSize);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
axis([-0.5,3.6 0.0034573,38030]);
axis square;

empty1 = bar(nan, 'FaceColor', 'none');
empty2 = bar(nan, 'FaceColor', 'none');
empty3 = bar(nan, 'FaceColor', 'none');
legend([ba empty1 bb empty2 bc empty3], NAMES, 'Location', legend_pos, 'FontSize', 11);










fig = figure("Name", "Message signing");
x = ["Dilithium" "Falcon" "Rainbow"];
c = ["#0000FF" "#FF0000" "#00FF00"];
NAMES = ["Dilithium 2" "Dilithium 3" "Falcon 512" "Falcon 1024" "Rainbow Ia Cyclic" "Rainbow Vc Cyclic"];
y = [
    0.10 3.92 1.12
];
y_slow = [
    0.14 8.44 19.23
];
bslow = bar(y_slow, 'FaceColor', 'none');
hold on
ba = bar(1, y(1));
bb = bar(2, y(2));
bc = bar(3, y(3));
set(ba, 'FaceColor', c(1));
set(bb, 'FaceColor', c(2));
set(bc, 'FaceColor', c(3));
offset = 0.01
text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
text(1:length(y_slow),y_slow+offset,num2str(y_slow'),'vert','bottom','horiz','center', 'FontSize', 11); 
box off
set(gca, 'YGrid', 'on', 'XGrid', 'off')
set(gca,'xticklabel',x);
xtickangle(15);
set(gca, 'YScale', 'log');
ylabel("Message Signing (ms)", 'FontSize', fontSize);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
axis([-0.5,3.6 0.0034573,38030]);
axis square;

empty1 = bar(nan, 'FaceColor', 'none');
empty2 = bar(nan, 'FaceColor', 'none');
empty3 = bar(nan, 'FaceColor', 'none');
legend([ba empty1 bb empty2 bc empty3], NAMES, 'Location', legend_pos, 'FontSize', 11);











fig = figure("Name", "Message verifying");
x = ["Dilithium" "Falcon" "Rainbow"];
c = ["#0000FF" "#FF0000" "#00FF00"];
NAMES = ["Dilithium 2" "Dilithium 4" "Falcon 512" "Falcon 1024" "Rainbow Ia Classic" "Rainbow Vc Cyclic"];
y = [
    0.03 0.04 1.27
];
y_slow = [
    0.06 0.08 22.67
];
bslow = bar(y_slow, 'FaceColor', 'none');
hold on
ba = bar(1, y(1));
bb = bar(2, y(2));
bc = bar(3, y(3));
set(ba, 'FaceColor', c(1));
set(bb, 'FaceColor', c(2));
set(bc, 'FaceColor', c(3));
offset = 0.01
text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center', 'FontSize', 12); 
text(1:length(y_slow),y_slow+offset,num2str(y_slow'),'vert','bottom','horiz','center', 'FontSize', 12); 
box off
set(gca, 'YGrid', 'on', 'XGrid', 'off')
set(gca,'xticklabel',x);
xtickangle(15);
set(gca, 'YScale', 'log');
ylabel("Message Verifying (ms)", 'FontSize', fontSize);
ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;
axis([-0.5,3.6 0.0034573,38030]);
axis square;

empty1 = bar(nan, 'FaceColor', 'none');
empty2 = bar(nan, 'FaceColor', 'none');
empty3 = bar(nan, 'FaceColor', 'none');
legend([ba empty1 bb empty2 bc empty3], NAMES, 'Location', legend_pos, 'FontSize', 12);
