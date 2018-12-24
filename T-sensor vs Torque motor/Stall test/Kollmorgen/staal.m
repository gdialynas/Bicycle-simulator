%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: D:\gdialynas\Desktop\Static simulator project\Testing\T-sesor vs Torque motor\Stall test\Stall 1,6.xlsx
%    Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2017/09/14 16:13:04

%% Import the data
[~, ~, raw] = xlsread('D:\gdialynas\Desktop\Static simulator project\Testing\T-sesor vs Torque motor\Stall test\Stall 1,6.xlsx','Sheet1','A2:E4286');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[3,4]);
raw = raw(:,[1,2,5]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
KistlerNm = data(:,1);
KollmorgenNm = data(:,2);
Steerrad = cellVectors(:,1);
Steerraterads = cellVectors(:,2);
VarName5 = data(:,3);

%% Clear temporary variables
clearvars data raw cellVectors R;
%%
t=0:0.001:4.284;
In=1.6:1.6;
T=transpose(t);
Kistler= -KistlerNm;
hold on;
plot(T,Kistler,'k')
a=1.75*sin(2*pi*1*t)
%plot(T,ones(length(T),1)*nanmean(KollmorgenNm),'k');
plot(T,ones(length(T),1)*mean(Kistler),'g');
plot(T,a);
plot(T,ones(length(T),1)*In,'b');
ylim([1.55 1.85])
xlim([0 4])
xlabel('Time (s)')
ylabel('')
legend('Command (Amp)','Mean torque-sensor (Nm)')
