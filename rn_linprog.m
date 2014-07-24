%
% Braun 1986 Linear Programming Analysis
%
% Author: Patrick  Cavanagh
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

num_phases=11;

x=zeros(f_len,num_phases);
x_max=zeros(num_phases,1);

phase_index=[1,3,13,23,33,34,36,37,41,42,45];

% Phase select
plagioclase=1;
olivine=2;
augite=3;
pigeonite=4;

%printf('Please select a phase to maximize:\nquartz=1\nplagioclase=2\nmontmorillonite=3\n')
%currentMin=input('Please select a phase to maximize:\nplagioclase=1\nolivine=2;\naugite=3;\npigeonite=4;\n');

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
    [x(:,i),fval,exitflag,output,lambda] = linprog(F,-A,B,Aeq,Beq,zeros(f_len,1));
    x_max(i)=x(phase_index(i),i); 
    fprintf('**************Phase %d*****************\n', i);
    %print_results(x(:,i))
end

print_max(x_max);
x_min=print_min(x,phase_index);

if(currentMin==1)
    fprintf('Set plagioclase objective function to: %0.2f, maximize.\n', objfun);
    F(1)=objfun;
    F(2:f_len)=0;
end

if(currentMin==2)
    fprintf('Set olivine objective function to: %0.2f, maximize.\n', objfun);
    F(3)=objfun;
    F(4:f_len)=0;
    F(1:2)=0;
end

if(currentMin==3)
    fprintf('Set augite objective function to: %0.2f, maximize.\n', objfun);
    F(13)=objfun;
    F(1:12)=0;
    F(14:f_len)=0;
end

if(currentMin==4)
    fprintf('Set pigeonite objective function to: %0.2f, maximize.\n', objfun);
    F(23)=objfun;
    F(1:22)=0;
    F(24:f_len)=0;
end

%% Run the maximizing of the selected phase
% F is negative in order to maximize the phase value, not default minimize
%[x,fval,exitflag,output,lambda] = linprog(F,-A,B,Aeq,Beq,zeros(f_len,1));
