% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
    mean_values = mean(X); % Calculez media fiecarei coloane
    variances = cov(X); % Calculez matricea de covarianta a coloanelor lui X
endfunction
