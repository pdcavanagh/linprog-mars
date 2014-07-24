function print_min = print_min(x, idx)
    x_min=zeros(size(x,2),1);
    for i=1:size(x,2)
        x_min(i)=min(x(idx(i),:));
    end
 
    x_min=x_min*100;

    % Print results
    fprintf('***********MINIMUM PHASE ABUNDANCES**************\n');
    fprintf('%0.2f plag \n', x_min(1));
    fprintf('%0.2f olivine \n', x_min(2));
    fprintf('%0.2f augite \n', x_min(3));
    fprintf('%0.2f pigeonite \n', x_min(4));
    fprintf('%0.2f magnetite \n', x_min(5));
    fprintf('%0.2f anhydrite \n', x_min(6));
    fprintf('%0.2f quartz \n', x_min(7));
    fprintf('%0.2f sanidine \n', x_min(8));
    fprintf('%0.2f hematite \n', x_min(9));
    fprintf('%0.2f ilmenite \n', x_min(10));
    fprintf('%0.2f amorphous \n', x_min(11));
 
    print_min=x_min;
end
