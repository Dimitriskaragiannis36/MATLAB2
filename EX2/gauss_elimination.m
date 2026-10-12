function x = gauss_elimination(a, b)
    [n, ~] = size(a);
    a = [a, b]; 

    % Απαλοιφή Gauss ΧΩΡΙΣ οδήγηση
    for r = 1:n-1
        for i = r+1:n
            m = a(i, r) / a(r, r); 
            a(i, :) = a(i, :) - m * a(r, :); 
        end
    end

    % Οπισθοδιαγραφή
    x = zeros(n, 1);
    x(n) = a(n, end) / a(n, n);
    for i = n-1:-1:1
        s = 0;
        for j = i+1:n
            s = s + a(i, j) * x(j);
        end
        x(i) = (a(i, end) - s) / a(i, i);
    end
end