%%
% Linear Programming Model to Determine Mineral Phase Abundance
%
% Based on Braun, 1986 Linear Programming Analysis
%
% Author: Patrick D. Cavanagh
% Date: 07/23/2014
% Updated version to test the rocknest model; imports csv files created in excel
%
%%

% Switch algorithm to simplex
options=optimoptions('linprog','Algorithm','simplex');

% Input linear programming matrices
A=csvread('a.csv');
B=csvread('b.csv');
Aeq=csvread('aeq.csv');
Beq=csvread('beq.csv');

% Objective function
F=csvread('f.csv');

% Get the size of the objective function vector 
f_len=size(F);
f_len=f_len(2);

% Number of phases in the model
num_phases=11;

% Allocate matrices for the abundance results
x=zeros(f_len,num_phases);
x_max=zeros(num_phases,1);

% Index into x vector for accessing phases abundance values
phase_index=[1,3,13,23,33,34,36,37,41,42,45];

% Standard objective function value of 10
objfun=input('Enter the objective function value:');

% Perform a loop over all phases to maximize
for i=1:num_phases
    F(phase_index(i))=objfun;
    if i == 1
        F(1)=objfun;
        F(2:f_len)=0;
    else 
        F(1:phase_index(1)-1)=0;
        F(phase_index(i)+1:f_len)=0;
    end

    % F is negative in order to maximize the phase value, not default minimize
    [x(:,i),fval,exitflag,output,lambda] = linprog(-F,-A,B,Aeq,Beq,zeros(f_len,1));
    x_max(i)=x(phase_index(i),i); 
    fprintf('**************Phase %d*****************\n', i);
    %print_results(x(:,i))
end

% Print the maximum calculation of each phase and the minimums obtained from all runs
print_max(x_max);
x_min=print_min(x,phase_index);
