clear all;
global y_axis_index fontSize data_num classical_data data_str appended_lines appended_titles;

% 1 = CLASSICAL Dilithium and Falcon
% 2 = CLASSICAL SPHINCS f and SPHINCS s
% 3 = POST QUANTUM Dilithium and Falcon
% 4 = POST QUANTUM SPHINCS f and SPHINCS s
plotNum = 4

% 3 = public + signature
% 5 = public
% 6 = signature
y_axis_index = 6;

fontSize = 14;


 %legend_pos = 'NorthWest';
 legend_pos = 'NorthEast';

data_num = readmatrix('Signature_Params_journal.csv');
classical_data = readmatrix('Classical_Signature_Params_journal.csv');


%data_str = csvread('Signature_Params.csv');

appended_lines = [];
appended_titles = strings([0]);

global x_tick_labels y_tick_labels
x_tick_labels = [0];
y_tick_labels = [0];

fig = figure('Name', 'Security Parameters');
%title('Signature Algorithm Parameters');

addSpacing = 0;
if (plotNum == 2 || plotNum == 4) && y_axis_index == 6
    addSpacing = 1;
end


grid on;
hold on;
disp(data_num(3,4));

if plotNum == 1
    
    ylabel('Cost (bits)', 'FontSize', fontSize);
    if y_axis_index == 6
        axis([0 5000 80 320]);
        legend_pos = 'NorthEast';
    else
        axis([600 2900 80 320]);
        legend_pos = 'NorthWest';
    end
    plotData("Dilithium", "#0000FF", ":", "o", 1, 3, "classical");
    plotData("Falcon", "#FF0000", ":", "s", 4, 2, "classical");
    y_tick_labels = [min(ylim), y_tick_labels];
    y_tick_labels(end+1) = max(ylim);


elseif plotNum == 2

    ylabel('Cost (bits)', 'FontSize', fontSize);
    if y_axis_index == 6
        axis([0 60000 80 320]);
        legend_pos = 'NorthWest';
    else
        axis([28 68 80 320]);
        legend_pos = 'NorthWest';
    end
    plotData("SPHINCS+ f", "#00FF00", ":", "o", 6, 3, "classical"); % Classical bit cost
    plotData("SPHINCS+ s", "#FF00FF", ":", "v", 9, 3, "classical"); % Classical bit cost
    y_tick_labels = [min(ylim), y_tick_labels];
    y_tick_labels(end+1) = max(ylim);

elseif plotNum == 3

    ylabel('Cost (qubits)', 'FontSize', fontSize);
    if y_axis_index == 6
        axis([0 5000 80 320]);
        legend_pos = 'NorthEast';
    else
        axis([600 2900 80 320]);
        legend_pos = 'NorthWest';
    end
    plotData("Dilithium", "#0000FF", "-", "o", 1, 3, "quantum");
    plotData("Falcon", "#FF0000", "-", "s", 4, 2, "quantum");
    y_tick_labels = [min(ylim), y_tick_labels];
    y_tick_labels(end+1) = max(ylim);




elseif plotNum == 4
    ylabel('Cost (qubits)', 'FontSize', fontSize);
    if y_axis_index == 6
        axis([0 60000 80 320]);
        legend_pos = 'NorthWest';
    else
        axis([28 68 80 320]);
        legend_pos = 'NorthWest';
    end
    if y_axis_index == 5
        addSpacing = 1;
    end
    plotData("SPHINCS+ f", "#00FF00", "-", "o", 6, 3, "quantum");
    plotData("SPHINCS+ s", "#FF00FF", "-", "v", 9, 3, "quantum");
    y_tick_labels = [min(ylim), y_tick_labels];
    y_tick_labels(end+1) = max(ylim);

end

% % % ylabel('Cost (qubits)', 'FontSize', fontSize);
% % % plotData("Picnic FS", "#00CC55", "o", 18, 3);
% % % plotData("Picnic UR", "#9A00D6", "s", 21, 3);
% % % 
% % %  ylabel('Cost (qubits)', 'FontSize', fontSize);
% % %  plotData("SPHINCS+ f", "#ED3D0C", "o", 24, 3);
% % %  plotData("SPHINCS+ s", "#3C0BE3", "s", 33, 3);


if addSpacing == 1
    if y_axis_index == 3
        xlabel('Signature + Public Key Length (bytes)       ', 'FontSize', fontSize);
    elseif y_axis_index == 6
        xlabel('Signature Length (bytes)       ', 'FontSize', fontSize);
    elseif y_axis_index == 5
        xlabel('Public Key Length (bytes)       ', 'FontSize', fontSize);
    end
else
    if y_axis_index == 3
        xlabel('Signature + Public Key Length (bytes)', 'FontSize', fontSize);
    elseif y_axis_index == 6
        xlabel('Signature Length (bytes)', 'FontSize', fontSize);
    elseif y_axis_index == 5
        xlabel('Public Key Length (bytes)', 'FontSize', fontSize);
    end
end
legend(appended_lines, appended_titles, 'Location', legend_pos, 'FontSize', fontSize);

set(gca, 'XTickLabel', num2cell(get(gca, 'XTick')));
set(gca, 'YTickLabel', num2cell(get(gca, 'YTick')));
x_tick_labels = unique(sort(x_tick_labels));
y_tick_labels = unique(sort(y_tick_labels));
xticks(x_tick_labels);
xtickangle(-90);
yticks(y_tick_labels);
xticklabels(x_tick_labels);
yticklabels(y_tick_labels);
xtickformat('auto')
axis square;

ax = gca
ax.XAxis.FontSize = fontSize;
ax.YAxis.FontSize = fontSize;

hold off

function [] = plotData(title, color, lineStyle, marker, y, length, dataType)
    global y_axis_index fontSize;
    global data_num classical_data appended_lines appended_titles;
    global x_tick_labels y_tick_labels;
    range = y : (y + length - 1);
    if dataType == "quantum"
        [x_arr0, sortIdx] = sort(data_num(range,y_axis_index), 'ascend');
        y_arr0 = data_num(range,4)
    elseif dataType == "classical"
        [x_arr0, sortIdx] = sort(classical_data(range,y_axis_index), 'ascend');
        y_arr0 = classical_data(range,4)
    end
        
    y_arr0 = y_arr0(sortIdx);
    x_arr = [];
    y_arr = [];
    for i = 1:size(x_arr0,1)
        x_arr(end+1) = x_arr0(i);
        y_arr(end+1) = y_arr0(i);
        if i ~= size(x_arr0,1)
            x_arr(end+1) = x_arr0(i + 1);
            y_arr(end+1) = y_arr0(i);
        end
        x_tick_labels(end+1) = x_arr0(i);
        y_tick_labels(end+1) = y_arr0(i);
    end
    disp(x_arr)
    disp(y_arr)
    l = plot(nan, nan, strcat(lineStyle, marker), 'color', color, 'LineWidth', 3, 'MarkerSize', 10);
    l1 = plot(x_arr, y_arr, lineStyle, 'color', color, 'LineWidth', 3, 'MarkerSize', 10);
    l2 = plot(x_arr(1:2:end), y_arr(1:2:end), marker, 'color', color, 'LineWidth', 3, 'MarkerSize', 10);
    

    appended_lines(end+1) = l;
    appended_titles(end+1) = title;
end