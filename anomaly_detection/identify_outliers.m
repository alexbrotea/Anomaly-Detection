function outliers = identify_outliers(X, yval)
    [mean_values variances] = estimate_gaussian(X); % Cu ajutorul estimarii gaussiene, aflu parametrii gaussieni
    probabilities = multivariate_gaussian(X, mean_values, variances); % Cu ajutorul metodiei multivariate gaussiene, calculez numarul de probabilitati
    [epsilon F1 precision recall] = optimal_threshold(yval, probabilities); % Apeland si la functia optimal_threshold, aflu valorile extreme posibile
    outliers = find(probabilities < epsilon); % Aici am pus conditia pentru gasirea outlierului, adica aceea de a-i gasi probabilitatea strict mai mica decat epsilonul calculat
endfunction