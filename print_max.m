function print_max = print_max(x)
    x=x*100;
    % Print results
    fprintf('***********MAXIMUM PHASE ABUNDANCES**************\n');
    fprintf('%0.2f plag \n', x(1));
    fprintf('%0.2f olivine \n', x(2));
    fprintf('%0.2f augite \n', x(3));
    fprintf('%0.2f pigeonite \n', x(4));
    fprintf('%0.2f magnetite \n', x(5));
    fprintf('%0.2f anhydrite \n', x(6));
    fprintf('%0.2f quartz \n', x(7));
    fprintf('%0.2f sanidine \n', x(8));
    fprintf('%0.2f hematite \n', x(9));
    fprintf('%0.2f ilmenite \n', x(10));
    fprintf('%0.2f amorphous \n', x(11));
end
