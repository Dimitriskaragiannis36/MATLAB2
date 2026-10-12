% Άσκηση 2
for k = 2:3
    % διάσταση του συστήματος (ΔΙΟΡΘΩΣΗ: 10 εις την k)
    n = 10^k;

    % δημιουργία του τριδιαγώνιου πίνακα Α
    main_diag = 4 * ones(n, 1);         % κύρια διαγώνιος
    upper_diag = -3 * ones(n-1, 1);     % ανω διαγώνιος
    lower_diag = -1 * ones(n-1, 1);     % κάτω διαγώνιος
    
    A = diag(main_diag) + diag(upper_diag, 1) + diag(lower_diag, -1); 

    % ακριβής λύση x = [1, 1, ..., 1]^T
    x_exact = ones(n, 1);

    % υπολογισμός του διανύσματος b = A * x_exact
    b = A * x_exact;

    % μέτρηση χρόνου εκτέλεσης της μεθόδου Thomas
    tic; 
    x_thomas = thomas_method(main_diag, lower_diag, upper_diag, b);
    elapsed_time_thomas = toc; 

    % μέτρηση χρόνου εκτέλεσης της μεθόδου Gauss
    tic; 
    x_gauss = gauss_elimination(A, b); 
    elapsed_time_gauss = toc; 

    % εκτύπωση
    fprintf('Διάσταση: %d\n', n);
    fprintf('Thomas: Χρόνος = %.6f δευτ.\n', elapsed_time_thomas);
    fprintf('Gauss: Χρόνος = %.6f δευτ.\n\n', elapsed_time_gauss);
end