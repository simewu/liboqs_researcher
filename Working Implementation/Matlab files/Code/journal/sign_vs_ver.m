

%Dilithium Sign times
x = [0.194727
0.30118
0.336457];

%Dilithium Verify times
y = [5.38E-02
8.95E-02
1.42E-01];

%Falcon Sign times
x1 = [0.420371
0.723592];

%Falcon Verify times
y1 = [0.0559
0.109];


%%%%%%Sphincs+ Sign times

%%%Haraka Sign times%%
x2 = [7.295554
6.84137
154.920122
127.223039
13.35303
10.474239
297.84396
239.504653
24.724417
22.636599
258.22917
202.684292];

%%%SHA256 Sign times%%
x3 = [36.776146
19.825445
707.867853
378.426505
60.113728
32.361305
1324.032423
715.201087
236.233227
62.096827
2165.537508
591.698341];

%%Shake256 Sign times
x4 = [82.90739
45.603018
1520.738942
836.083978
131.592388
73.131604
2638.411854
1480.624835
253.760331
142.070129
2285.694803
1286.607528];


%%%%%%Sphincs+ Verify times

%%%Haraka Verify times%%
y2 = [4.49E-01
3.34E-01
1.71E-01
1.21E-01
7.14E-01
4.96E-01
2.66E-01
1.88E-01
7.06E-01
5.08E-01
3.73E-01
2.66E-01];

%%%SHA256 Verify times%%
y3 = [2.88E+00
1.53E+00
9.86E-01
5.40E-01
4.24E+00
2.27E+00
1.51E+00
7.83E-01
4.85E+00
2.25E+00
2.58E+00
1.12E+00];

%%%Shake Verify times%%
y4 = [1.01E+01
5.35E+00
3.77E+00
1.94E+00
1.70E+01
8.20E+00
5.49E+00
2.76E+00
1.62E+01
8.21E+00
7.82E+00
4.01E+00];

% fig = figure("Name", "only dilithium");
% scatter(y,x,30,'blue')
% hold on
% set(gca, 'YScale', 'log');
% set(gca, 'YGrid', 'on', 'XGrid', 'off');
% %scatter(x1,y1,30,'green')
% %scatter(x2,y2,30,'magenta')
% xlabel('Verifying Time (\mus)');
% ylabel('Signing Time (\mus)');
% axis square;

fig = figure("Name", "all");
scatter(y,x,30,'blue')
hold on
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
set(gca, 'YGrid', 'on', 'XGrid', 'off');
scatter(y1,x1,30,'green')
scatter(y2,x2,30,'magenta')
scatter(y3,x3,30,'black')
scatter(y4,x4,30,'cyan')
xlabel('Verifying Time (\mus)');
ylabel('Signing Time (\mus)');
axis square;