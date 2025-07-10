% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mean_values, variances)
    if iscolumn(mean_values)
        mean_values = mean_values'; % Verific conditia vectorului rand pentru mean_values
    end
    n = length(mean_values); % Tot pentru mean_values, aflu numarul de dimensiuni posibile
    var_det = det(variances); % Aflu determinantul matricei de covarianta
    var_inv = inv(variances); % Aflu matricea inversa matricei de covarianta
    norm_coeff = 1 / ((2 * pi) ^ (n / 2) * sqrt(var_det)); % Conform formulei, calculez functia de densitate a probabilitatii
    diffs = X - repmat(mean_values, size(X, 1), 1); % Calculez, pentru fiecare rand al lui X, diferenta dintre acesta si valoarea medie obtinuta
    exponent = -0.5 * sum((diffs * var_inv) .* diffs, 2); % Aflu, dupa formula, exponentul functiei gaussiene
    probabilities = norm_coeff * exp(exponent); % Calculez, conform instructiunilor, probabilitatile cerute pentru X
endfunction
