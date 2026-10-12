function x = thomas_method(main_diag, lower_diag, upper_diag, b)
    % αριθμός στοιχείων του διανύσματος b
    n = length(b);

    % προώθηση
    for i = 2:n
        factor = lower_diag(i-1) / main_diag(i-1);
        main_diag(i) = main_diag(i) - factor * upper_diag(i-1);
        b(i) = b(i) - factor * b(i-1);
    end

    % οπισθοδιαγραφή
    x = zeros(n, 1);
    x(n) = b(n) / main_diag(n); % Υπολογισμός τελευταίου στοιχείου
    for i = n-1:-1:1
        x(i) = (b(i) - upper_diag(i) * x(i+1)) / main_diag(i);
    end
end
