# Anomaly Detection

## gaussian_distribution.m

The probability density of a multivariate normal distribution is computed for a given test dataset (already provided).  

Using the means and variances previously calculated on the training data, this function evaluates whether a new data point is likely under the modeled distribution or potentially anomalous.  


## estimate_gaussian.m

The script calculates the parameters (means and variances) of the Gaussian distribution from a training dataset.  

This step is fundamental: by fitting the model to “normal” observations, we establish a baseline against which future data can be judged for anomalies.  


## optimal_threshold.m

In optimal_threshold.m, we determine the best threshold for flagging anomalies.  

By comparing the computed probabilities against a range of candidate thresholds, the function measures precision, recall, and F1 score for each.  

It then selects the threshold that maximizes the F1 score, balancing the discovery of true anomalies against the rate of false alarms.  
