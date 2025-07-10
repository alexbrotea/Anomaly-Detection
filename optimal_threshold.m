% Finds the best threshold to use for selecting outliers.
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
    step_size = (max(probabilities) - min(probabilities)) / 1000; % Determin pasul de crestere pentru probabilitati, prin impartirea la 1000 a intervalului acestora
    best_F1 = 0;
    best_epsilon = 0;
    associated_precision = 0;
    associated_recall = 0; % Initializez aceste variabile cu 0
    for epsilon = min(probabilities) : step_size : max(probabilities) % Parcurg un for pentru valoarea lui epsilon
        predictions = (probabilities < epsilon); % Iau cazul cand imi doresc ca probabilities < epsilon
        tp = sum((predictions == 1) & (truths == 1));
        fp = sum((predictions == 1) & (truths == 0));
        fn = sum((predictions == 0) & (truths == 1)); % Acum, pentru cazul dorit de mine, am impartit in alte 3 posibilitati acest caz, pentru a calcula tp, fp si fn
        precision = tp / (tp + fp); % Calculez, conform cerintei, parametrul precision
        recall = tp / (tp + fn); # Calculez, conform cerintei, parametrul recall
        if (tp + fp == 0 || tp + fn == 0)
            continue; % Evit cazul nedorit de impartire la 0
        end
        F1 = 2 * (precision * recall) / (precision + recall); % Calculez F1, asa cum mi se cere
        if (F1 > best_F1)
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall; % Aici, in cazul in care se doreste, se va actualiza valoarea lui F1 pentru a ajunge in cea mai "optima" solutie
        end
    end
endfunction
